import 'package:flutter/material.dart';
import 'button.dart';

final Color lightGray = Color(0xffEBEBEB);
final Color green = Color(0xff009951);

class DeleteImageDialog extends StatelessWidget {
	final VoidCallback onDelete, onCancel;
  final String title, text, deleteButtonText, cancelButtonText;
  const DeleteImageDialog({
    super.key,
		required this.onDelete,
		required this.onCancel,
    this.title = 'Deletar',
    this.text = 'Tem certeza que deseja deletar?',
    this.deleteButtonText = 'Deletar',
    this.cancelButtonText = 'Cancelar',
  });

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
                title,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                text,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: <Widget>[
                  Button(
                    text: deleteButtonText,
                    onTap: onDelete,
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  // SizedBox(width: 10),
                  Button(
                    text: cancelButtonText,
                    onTap: onCancel,
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
