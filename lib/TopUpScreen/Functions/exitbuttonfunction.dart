

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Login_Screen/login_screen.dart';

exitBtn(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        title: const Text(
          "Are you sure  want to Logout",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  color: Colors.grey,
                  child: TextButton(
                    onPressed: ()async {
                      if (Platform.isAndroid) {
                        SystemNavigator.pop();
                      }

                    },
                    child: const Text(
                      "Yes",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Card(
                  color: Colors.grey,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "NO",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
btmDialogueFunction({required BuildContext context,required String textMsg,required Function() fistBtnOnPressed ,required Function() secondBtnPressed, required String secondBtnText }) {
  return showModalBottomSheet(

    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        padding:
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(textMsg,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              SizedBox(width: MediaQuery.of(context).size.width*.05,),
              TextButton(onPressed:fistBtnOnPressed,  child: Text("Cancel",style: TextStyle(color: Color(0xffB53211)),)),

              TextButton(onPressed: secondBtnPressed, child: Text(secondBtnText,style: TextStyle(color: Color(0xffB53211)),)),
            ],
          )
        ),
      );
    },
  );
}