import 'package:flutter/material.dart';

Widget floatingActionButton ({required BuildContext context , required Color color , required IconData icon, required void Function() onPressed}){
  return FloatingActionButton(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0))),
    backgroundColor: color,
    onPressed: onPressed,
    child:  Icon(icon),
  );


}