import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/teacher.dart';
import '../services/admin.dart';
import '../widgets/add_teacher_dialog.dart';
import '../widgets/button.dart';
import '../widgets/delete_dialog.dart';
import '../widgets/edit_dialog.dart';
import '../widgets/user_row.dart';

final Color lightGray = Color(0xffEBEBEB);
final Color green = Color(0xff009951);

class AdminTab extends StatefulWidget {
  const AdminTab({super.key});

  @override
  State<AdminTab> createState() => _AdminTabState();
}

class _AdminTabState extends State<AdminTab> {
  final _adminService = AdminService();
  late Future<List<Teacher>> _futureTeachers;
  @override
  void initState() {
    super.initState();
    _futureTeachers = _loadTeachers();
  }

  Future<List<Teacher>> _loadTeachers() async {
    final res = await _adminService.listarProfessor();
    if (res.statusCode != 200) {
      throw Exception('Falha ao carregar professores (${res.statusCode})');
    }

    final decoded = jsonDecode(res.body);
    final list = decoded is List ? decoded : (decoded['data'] as List? ?? []);

    return list
        .map((e) => Teacher.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> _refresh() async {
    setState(() {
      _futureTeachers = _loadTeachers();
    });
  }

  Future<void> _onAddTeacher() async {
    await showDialog(
      context: context,
      builder: (_) => const AddTeacherDialog(),
    );
    await _refresh();
  }

  Future<void> _onEditTeacher(Teacher t) async {
    await showDialog(
      context: context,
      builder: (_) => EditDialog(emailToEdit: t.email, initialName: t.nome),
    );
    await _refresh();
  }

  Future<void> _onDeleteTeacher(Teacher t) async {
    await showDialog<bool>(
      context: context,
      builder: (_) => DeleteDialog(emailToDelete: t.email),
    );
    await _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        decoration: BoxDecoration(
          color: lightGray,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        padding: EdgeInsets.all(50),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          'Número de Acessos ao Sistema',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Image.asset('assets/icons/users.png', height: 24),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            height: 75,
                            width: 150,
                            child: Text(
                              '1.498',
                              style: TextStyle(
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'acessos de usuário',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(width: 150),
              VerticalDivider(thickness: 5, color: Colors.white),
              SizedBox(width: 150),
              FutureBuilder<List<Teacher>>(
                future: _futureTeachers,
                builder: (context, snapshot) {
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Tabela de Professores Autorizados',
                          style: TextStyle(fontSize: 30),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 400,
                          constraints: BoxConstraints(minWidth: 600),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: _buildTable(snapshot),
                        ),
                        SizedBox(height: 40),
                        Button(
                          text: 'Adicionar Professor',
                          onTap: _onAddTeacher,
                          backgroundColor: green,
                          foregroundColor: Colors.white,
                          horizontalPadding: 60,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTable(AsyncSnapshot<List<Teacher>> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }
    if (snapshot.hasError) {
      return Center(child: Text('Erro: ${snapshot.error}'));
    }

    final teachers = snapshot.data ?? [];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          dataRowMinHeight: 70,
          dataRowMaxHeight: 70,
          dataTextStyle: const TextStyle(fontSize: 20),
          columnSpacing: 100,
          columns: const [
            DataColumn(
              label: Text('Nome'),
              headingRowAlignment: MainAxisAlignment.center,
            ),
            DataColumn(
              label: Text('Email'),
              headingRowAlignment: MainAxisAlignment.center,
            ),
            DataColumn(
              label: Text(''),
              headingRowAlignment: MainAxisAlignment.center,
            ),
          ],
          rows: teachers.map((t) {
            return UserRow(
              nome: t.nome,
              email: t.email,
              onEdit: () => _onEditTeacher(t),
              onDelete: () => _onDeleteTeacher(t),
            );
          }).toList(),
        ),
      ),
    );
  }
}
