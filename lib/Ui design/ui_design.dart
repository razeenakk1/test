import 'package:flutter/material.dart';

class UiDesign extends StatelessWidget {
  const UiDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
          onPressed: (){
            print("peressed");

            },
          icon: Icon(Icons.add),
        ),

        backgroundColor: Colors.grey,
        title:Text("Login",style: TextStyle(color: Colors.limeAccent ),) ,

      ) ,
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
             Icon(Icons.add_call,size: 30,),
           ElevatedButton(onPressed: (){
             print("clicled");


           }, child: Text("click"))

            ],
          )

        ),
      ),

    );
  }
}

