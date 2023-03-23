import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatelessWidget {
   TextFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,  this.onChanged, required this.validator, required this.textInputAction,
     this.textInputType,this.list
  });

  final TextEditingController controller;
  final String labelText;
  Function(String)? onChanged;
  final String? Function(String?) validator;
  final TextInputAction textInputAction;
   TextInputType? textInputType;
   List<TextInputFormatter>? list;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textInputAction: textInputAction,
        onChanged:onChanged ,
        style: GoogleFonts.poppins(textStyle: const TextStyle(fontWeight: FontWeight.bold)),
        keyboardType: textInputType,
        inputFormatters: list,

        validator: validator ,
        controller: controller,
        autofocus: true,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle:  GoogleFonts.poppins(
        textStyle: const TextStyle(color: Colors.grey)),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffB53211)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffB53211)),
          ),
        ));
  }
}
