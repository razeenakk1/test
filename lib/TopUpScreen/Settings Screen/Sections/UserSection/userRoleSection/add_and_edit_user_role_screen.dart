import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Userole/CreateUserRoleModelClass.dart';

import '../../../../Constens/constens.dart';
import '../../../../Functions/floating_action_function.dart';
import '../../../../Functions/toggle_button_function.dart';
import '../../../../TopUpApiSection/Bloc/Tax/tax_bloc.dart';
import '../../../../TopUpApiSection/Bloc/UserRole/user_role_bloc.dart';
import '../../../../Widgets/appbar_widget.dart';
import '../../../../Widgets/text_form_field_widget.dart';



class AddAndEditUserole extends StatelessWidget {
  AddAndEditUserole({Key? key, required this.type}) : super(key: key);
  final String type;

 final TextEditingController userRollController = TextEditingController()
    ..text = "Accountant";
  final TextEditingController userRollNotValueController = TextEditingController();

  final  ValueNotifier<bool> isSwitched = ValueNotifier(false);

  final ValueNotifier<bool> isSwitchedOne = ValueNotifier(false);

  final ValueNotifier<bool> isSwitchedTwo = ValueNotifier(false);

  final  ValueNotifier<bool> isSwitchedThree = ValueNotifier(false);
  final formKey = GlobalKey<FormState>();
  late  CreateUserRoleModelClass createUserRoleModelClass;



  @override
  Widget build(BuildContext context) {
    // final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;
    return MultiBlocListener(
      listeners: [
      BlocListener<UserRoleBloc, UserRoleState>(
    listener: (context, state) {
      if (state is UserRoleListCreateLoading) {
        const CircularProgressIndicator(
          color: Color(0xffB73312),
        );
      }
      if (state is UserRoleListCreateLoaded) {
      //  hideProgressBar();
        createUserRoleModelClass =
            BlocProvider.of<UserRoleBloc>(context).createUserRoleModelClass;


        if (state is UserRoleListCreateError) {
       //   hideProgressBar();
          const Text("Something went wrong");
        }
      }
    },
    ),
      ],
      child: Scaffold(
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

                    controller: type == "Edit" ?userRollController:userRollNotValueController,
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
            if (formKey.currentState!.validate() == true &&
    type == "Add") {
              BlocProvider.of<UserRoleBloc>(context).add(UserRoleCreateEvent(
                  userRoleName: userRollNotValueController.text,
                  isSale: isSwitched.value,
                  isPurchase: isSwitchedOne.value,
                  isReports: isSwitchedTwo.value,
                  isStockUpdate: isSwitchedThree.value)
              );
              //     formKey.currentState!.validate() ?
            }   // Navigator.pop(context) :const  SizedBox();
      })
      ),
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


