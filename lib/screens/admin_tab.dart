import 'package:flutter/material.dart';
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tabela de Professores Autorizados',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: 10),
                  Container(
                    // width: 670,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: DataTable(
                          dataRowMinHeight: 70,
                          dataRowMaxHeight: 70,
                          dataTextStyle: TextStyle(fontSize: 20),
                          columnSpacing: 100,
                          columns: [
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
                          rows: [
                            UserRow(
                              nome: 'User1',
                              email: 'user1@email.com',
                              onEdit: () => showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) => const EditDialog(),
                              ),
                              onDelete: () => showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) => const DeleteDialog(),
                              ),
                            ),
                            UserRow(
                              nome: 'User2',
                              email: 'user2@email.com',
                              onEdit: () => showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) => const EditDialog(),
                              ),
                              onDelete: () => showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) => const DeleteDialog(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Button(
                    text: 'Adicionar Professor',
                    onTap: () => showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) => const AddTeacherDialog(),
                    ),
                    backgroundColor: green,
                    foregroundColor: Colors.white,
                    horizontalPadding: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
