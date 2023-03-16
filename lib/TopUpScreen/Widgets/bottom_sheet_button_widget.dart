import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key, required this.onPressed
  });
  final Function() onPressed ;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child:  Text("cancel",   style: GoogleFonts.poppins(textStyle: const  TextStyle(color: Color(0xffB53211)),
            )  )),
        TextButton(
            onPressed: onPressed,
            child:  Text("save",   style: GoogleFonts.poppins(textStyle: const TextStyle(color: Color(0xffB53211)),))),
      ],
    );
  }
}