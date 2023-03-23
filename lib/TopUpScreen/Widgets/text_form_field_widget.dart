import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget(
      {super.key,
      required this.controller,
      required this.labelText,
      this.suffixIcon,
      this.onTap,
      this.prefixIcon,
      this.maxLines,
     required this.readOnly,
      required this.textInputType,
      this.onChanged,
      required this.obscureText,this.autoFocus,  this.validator, required this.textInputAction,this.focusNode,this.enabled,this.list});

  final TextEditingController controller;
  final String labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function()? onTap;
  void Function(String)? onChanged;
TextInputType? keyBordType;



final int? maxLines;
   final bool readOnly ;
  final TextInputType textInputType;
  FocusNode? focusNode;
  bool? enabled;

  final bool obscureText;
  bool? autoFocus;
    String? Function(String?)?  validator;
    final TextInputAction textInputAction;
  List<TextInputFormatter>? list;
 // final Key textFieldKey;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        inputFormatters: list,
      enabled: enabled,
      focusNode: focusNode,
        textInputAction: textInputAction,
        validator: validator ,
        autofocus: autoFocus == null ? false : true ,
        obscureText: obscureText,
        readOnly: readOnly ,
        keyboardType: textInputType,
        maxLines: maxLines,
        onChanged: onChanged,
        onTap: onTap,
        style: GoogleFonts.poppins(textStyle: const TextStyle(fontWeight: FontWeight.bold)),
        controller: controller,
        decoration: InputDecoration(


            labelText: labelText,
            labelStyle:   GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.grey)),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffB53211)),
            ),
            disabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon));
  }
}
