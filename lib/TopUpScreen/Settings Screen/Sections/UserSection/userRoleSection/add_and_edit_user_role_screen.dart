import 'package:flutter/material.dart';

import '../../../../Constens/constens.dart';
import '../../../../Functions/floating_action_function.dart';
import '../../../../Functions/toggle_button_function.dart';
import '../../../../Widgets/appbar_widget.dart';
import '../../../../Widgets/text_form_field_widget.dart';



class AddAndEditUserole extends StatelessWidget {
  AddAndEditUserole({Key? key, required this.type}) : super(key: key);
  final String type;

 final TextEditingController userRollController = TextEditingController()
    ..text = "Accountant";

  final  ValueNotifier<bool> isSwitched = ValueNotifier(false);

  final ValueNotifier<bool> isSwitchedOne = ValueNotifier(false);

  final ValueNotifier<bool> isSwitchedTwo = ValueNotifier(false);

  final  ValueNotifier<bool> isSwitchedThree = ValueNotifier(false);
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    // final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,

        backgroundColor: const Color(0xffF2F2F2),
        appBar: appBar(appBarTitle: "$type User Role"),
        body: Container(
            padding: const EdgeInsets.all(20),
            height: mHeight,
            decoration: containerDecoration,
            child: Form(
              key: formKey,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                  children: [
                TextFormFieldWidget(
                  readOnly: false,

                  validator: (val ) {
                    if (val == null || val.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },

                  obscureText: false,

                  controller: userRollController,
                  labelText: 'User Roles',
                  textInputType: TextInputType.text, textInputAction: TextInputAction.done,
                ),
                    Column(
                      children: [
                        ValueListenableBuilder(
                            valueListenable: isSwitched,
                            builder: (BuildContext context, bool sWitched, _) {
                            return particularItemFunction(text: 'Sales', toggleButtonBoolValue: sWitched, toggleButtonOnChanged: (value ) {
                              value = isSwitched.value;
                              isSwitched.value = !isSwitched.value;
                            });
                          }
                        ),
                        ValueListenableBuilder(
                            valueListenable: isSwitchedOne,
                            builder: (BuildContext context, bool sWitchedOne, _) {
                            return particularItemFunction(text: 'Purchase', toggleButtonBoolValue: sWitchedOne, toggleButtonOnChanged: (value ) {
                              value = isSwitchedOne.value;
                              isSwitchedOne.value = !isSwitchedOne.value;
                            });
                          }
                        ),
                        ValueListenableBuilder(
                            valueListenable: isSwitchedTwo,
                            builder: (BuildContext context, bool sWitchedTwo, _) {
                            return particularItemFunction(text: 'Stock Update', toggleButtonBoolValue: sWitchedTwo, toggleButtonOnChanged: (value ) {
                              value = isSwitchedTwo.value;
                              isSwitchedTwo.value = !isSwitchedTwo.value;
                            });
                          }
                        ),
                        ValueListenableBuilder(
                            valueListenable: isSwitchedThree,
                            builder: (BuildContext context, bool sWitchedThree, _) {
                            return particularItemFunction(text: 'Report', toggleButtonBoolValue: sWitchedThree, toggleButtonOnChanged: (value ) {
                              value = isSwitchedThree.value;
                              isSwitchedThree.value = !isSwitchedThree.value;
                            });
                          }
                        ),
                      ],
                    )
                  ]),
            )
        ),
        floatingActionButton: floatingActionButton(context: context, color:  Colors.green, icon: Icons.done, onPressed: () {
          /// api check type and pass apis
          formKey.currentState!.validate() ?
      Navigator.pop(context) :const  SizedBox();
    })
    );
  }
}

/// this function show useRole items and toggle button
Widget particularItemFunction({required String text,required bool toggleButtonBoolValue , required void Function(bool) toggleButtonOnChanged}){
  return          Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [

    Text(text,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w800),),
      toggleButton(value: toggleButtonBoolValue, onChanged: toggleButtonOnChanged

      )
    ],
  );
}


