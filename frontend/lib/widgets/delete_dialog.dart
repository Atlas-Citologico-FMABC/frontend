import 'package:flutter/material.dart';
import '../services/admin.dart';
import 'button.dart';

final Color lightGray = Color(0xffEBEBEB);

class DeleteDialog extends StatelessWidget {
	final String emailToDelete;
  const DeleteDialog({super.key, required this.emailToDelete});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 8,
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: SizedBox(
          height: 200,
          width: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Deletar usuário',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                'Tem certeza que deseja excluir o usuário?',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: <Widget>[
                  Button(
                    text: 'Deletar',
                    onTap: () async {
											AdminService().deletarProfessor(emailToDelete);
											Navigator.pop(context);
										},
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  // SizedBox(width: 10),
                  Button(
                    text: 'Cancelar',
                    onTap: () {
											Navigator.pop(context);
										},
                    backgroundColor: lightGray,
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
