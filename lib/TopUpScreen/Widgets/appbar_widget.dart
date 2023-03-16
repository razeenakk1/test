import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

PreferredSizeWidget appBar(
    {required String appBarTitle,
    List<Widget>? actions,
    bool? automaticallyImplyLeading, Widget? leading}) {
  return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
      leading: leading,
      iconTheme: const IconThemeData(
        color: Colors.black,),
      backgroundColor: const Color(0xffF2F2F2),
      elevation: 0,
      title: Text(
        appBarTitle,
  style:GoogleFonts.poppins(textStyle: const  TextStyle(
            color: Colors.black, fontWeight: FontWeight.w900, fontSize: 21),),),
      actions: actions);
}
