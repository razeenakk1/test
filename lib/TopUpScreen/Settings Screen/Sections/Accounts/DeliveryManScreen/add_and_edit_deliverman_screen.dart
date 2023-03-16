import 'package:flutter/material.dart';

import '../../../../Constens/constens.dart';
import '../../../../Functions/floating_action_function.dart';
import '../../../../Widgets/appbar_widget.dart';
import '../../../../Widgets/text_form_field_widget.dart';


class AddAndEditDeliveryMan extends StatelessWidget {
   AddAndEditDeliveryMan({Key? key, required this.type}) : super(key: key);
   final String type ;

 final TextEditingController nameController = TextEditingController()..text = "savad farooque";
   final TextEditingController phoneController = TextEditingController()..text = "+901235874695";
   final TextEditingController emailController = TextEditingController()..text = "savadfarooque@gmail.com";

   final formKey = GlobalKey<FormState>();



   @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,

        backgroundColor: backGroundColor,
        appBar: appBar(appBarTitle: '$type Delivery man'),
        body: Container(

          decoration: containerDecoration,
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          height: mHeight,
          child: Form(
            key:formKey ,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [

                TextFormFieldWidget(
                  textInputAction: TextInputAction.next,
                  validator: (val ) {
                    if (val == null || val.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },

                  obscureText: false,

                  prefixIcon: const Icon(Icons.person,color: Color(0xff707070),),
                  controller: nameController,
                  labelText: 'Name',
                  textInputType: TextInputType.name,
                ),
                TextFormFieldWidget(
                  textInputAction: TextInputAction.next,
                  validator: (val ) {
                    if (val == null || val.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                  obscureText: false,

                  prefixIcon: const Icon(Icons.phone,color: Color(0xff707070),),
                  controller: phoneController,
                  labelText: 'Phone',
                  textInputType: TextInputType.streetAddress,
                ),
                TextFormFieldWidget(
                  textInputAction: TextInputAction.done,

                  validator: (val ) {
                    if (val == null || val.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                  obscureText: false,

                  prefixIcon: Image.asset("assets/profile_image/sendimage.png",color: const Color(0xff707070),),
                  controller: emailController,
                  labelText: 'Email',
                  textInputType: TextInputType.text,
                ),

              ],
            ),
          ),
        ),
        floatingActionButton: floatingActionButton(context: context, color: Colors.green, icon: Icons.done, onPressed: () {
          /// api integration check with type edit or add
          formKey.currentState!.validate()  == true ?
          Navigator.pop(context): const SizedBox(); })
    );
  }

}
