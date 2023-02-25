import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      appBar: AppBar(
        backgroundColor: Color(0xffF2F2F2),
        elevation: 0,
        title: Text("Profile",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 21),),
      ),
      body: Stack(
        children: [
          Container(
            height: mHeight*.5,
            //color: Colors.green,

          ),
          Positioned(
            right: 100,
            top: 100,
            left: 20,

            child: Container(
              height: mHeight*.9,
              color: Colors.red,

            ),
          )


        ],
      ),


    );
  }
}
