import 'package:flutter/material.dart';
import 'button.dart';

final Color lightGray = Color(0xffEBEBEB);

DataRow UserRow({required nome, required email, VoidCallback? onEdit, VoidCallback? onDelete}) {
  return DataRow(
    cells: [
      DataCell(Text(nome)),
      DataCell(Text(email)),
      DataCell(
        Row(
          children: <Widget>[
            Button(
              text: 'Editar',
              onTap: onEdit,
              backgroundColor: lightGray,
              horizontalPadding: 20,
              verticalPadding: 15,
              fontSize: 20,
            ),
            SizedBox(width: 10),
            Button(
              text: 'Deletar',
              onTap: onDelete,
              backgroundColor: Colors.black,
              foregroundColor: lightGray,
              horizontalPadding: 20,
              verticalPadding: 15,
              fontSize: 20,
            ),
          ],
        ),
      ),
    ],
  );
}
