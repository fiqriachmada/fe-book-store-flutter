import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController con;
  final String? hint;
  String? Function(String? value)? validate;
  TextFieldWidget({Key? key, required this.con, this.hint, this.validate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
          controller: con,
          decoration: InputDecoration(hintText: hint),
          validator: validate
      ),
    );
  }
}