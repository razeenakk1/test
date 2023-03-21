
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../TopUpScreen/Functions/auto_generate_function.dart';

class GeneratePassword extends StatefulWidget {
  @override
  _GeneratePasswordState createState() => _GeneratePasswordState();
}

class _GeneratePasswordState extends State<GeneratePassword> {

  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.cyan,
          title: Text('Flutter Generate Random Password'),
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text("Generate Strong Random Password",style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold
                  ),),
                ],
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: _controller,
                readOnly: true,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan,),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    suffixIcon: IconButton(
                        onPressed: (){
                          final data = ClipboardData(text: _controller.text);
                          Clipboard.setData(data);

                          final snackbar = SnackBar(
                              content: Text("Password Copy"));

                          ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(snackbar);
                        },
                        icon: Icon(Icons.copy))
                ),
              ),
              SizedBox(height: 15,),
              buildButtonWidget()
            ],
          ),

        ),
      );

  Widget buildButtonWidget() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.black
        ),
        onPressed: (){
          final password = generatePassword();
          _controller.text = password;
        },
        child: Text("Password Generate",style: TextStyle(color: Colors.white),)
    );
  }

}

String generatePassword({
  bool letter = true,
  bool isNumber = true,
  bool isSpecial = true,
}) {
  const length = 8;
  const letterLowerCase = "abcdefghijklmnopqrstuvwxyz";
  const letterUpperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  const number = '0123456789';
  const special = '@#%^*>\$@?/[]=+';

  String chars = "";
  if (letter) chars += '$letterLowerCase$letterUpperCase';
  if (isNumber) chars += '$number';
  if (isSpecial) chars += '$special';


  return List.generate(length, (index) {
    final indexRandom = Random.secure().nextInt(chars.length);
    return chars [indexRandom];
  }).join('');
}

