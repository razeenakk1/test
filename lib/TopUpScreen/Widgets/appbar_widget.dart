import 'package:flutter/material.dart';

PreferredSizeWidget appBar(
    {required String appBarTitle,
    List<Widget>? actions,
    bool? automaticallyImplyLeading}) {
  return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
      iconTheme: const IconThemeData(
        color: Colors.black,),
      backgroundColor: const Color(0xffF2F2F2),
      elevation: 0,
      title: Text(
        appBarTitle,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.w900, fontSize: 21),),
      actions: actions);
}
