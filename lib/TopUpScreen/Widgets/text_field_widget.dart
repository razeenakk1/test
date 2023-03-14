import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
   TextFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,  this.onChanged,
  });

  final TextEditingController controller;
  final String labelText;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged:onChanged ,
        style: const TextStyle(fontWeight: FontWeight.bold),

        controller: controller,
        autofocus: true,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.grey),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffB53211)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffB53211)),
          ),
        ));
  }
}
