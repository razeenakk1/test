import 'package:flutter/material.dart';

import '../../../../Constens/constens.dart';
import '../../../../Functions/floating_action_function.dart';
import '../../../../Widgets/appbar_widget.dart';
import '../../../../Widgets/text_form_field_widget.dart';


class AddDeliveryManScreen extends StatelessWidget {
   AddDeliveryManScreen({Key? key}) : super(key: key);

 final TextEditingController nameController = TextEditingController()..text = "savad farooque";
   final TextEditingController phoneController = TextEditingController()..text = "+901235874695";
   final TextEditingController emailController = TextEditingController()..text = "savadfarooque@gmail.com";


  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: backGroundColor,
        appBar: appBar(appBarTitle: 'Add Delivery man'),
        body: Container(

          decoration: containerDecoration,
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          height: mHeight,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [

              TextFormFieldWidget(
                obscureText: false,

                prefixIcon: const Icon(Icons.person,color: Color(0xff707070),),
                controller: nameController,
                labelText: 'Name',
                textInputType: TextInputType.name,
              ),
              TextFormFieldWidget(
                obscureText: false,

                prefixIcon: const Icon(Icons.phone,color: Color(0xff707070),),
                controller: phoneController,
                labelText: 'Phone',
                textInputType: TextInputType.streetAddress,
              ),
              TextFormFieldWidget(
                obscureText: false,

                prefixIcon: Image.asset("assets/profile_image/sendimage.png",color: const Color(0xff707070),),
                controller: emailController,
                labelText: 'Email',
                textInputType: TextInputType.text,
              ),

            ],
          ),
        ),
        floatingActionButton: floatingActionButton(context: context, color: Colors.green, icon: Icons.done, onPressed: () { Navigator.pop(context); })
    );
  }

}
