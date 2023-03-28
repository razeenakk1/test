import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Userole/CreateUserRoleModelClass.dart';

import '../../../../Constens/constens.dart';
import '../../../../Functions/exitbuttonfunction.dart';
import '../../../../Functions/floating_action_function.dart';
import '../../../../Functions/toggle_button_function.dart';
import '../../../../TopUpApiSection/Bloc/UserRole/user_role_bloc.dart';
import '../../../../Widgets/appbar_widget.dart';
import '../../../../Widgets/text_form_field_widget.dart';



class AddAndEditUserole extends StatefulWidget {
  final String type;
  String? id;
  String? selectedItem;
  bool? isSale;
  bool? isPurchase;
  bool? isStockUpdate;
  bool? isReports;



  AddAndEditUserole({Key? key, required this.type,this.id,this.selectedItem,this.isSale,this.isPurchase,this.isStockUpdate,
  this.isReports}) : super(key: key);

  @override
  State<AddAndEditUserole> createState() => _AddAndEditUseroleState();
}

class _AddAndEditUseroleState extends State<AddAndEditUserole> {
  final formKey = GlobalKey<FormState>();

  late  CreateUserRoleModelClass createUserRoleModelClass;
  final TextEditingController userRollNotValueController = TextEditingController();





  late   TextEditingController userRollController;
  late  ValueNotifier<bool> isSwitched ;
  late   ValueNotifier<bool> isSwitchedOne  ;
  late   ValueNotifier<bool> isSwitchedTwo;
  late    ValueNotifier<bool> isSwitchedThree;
  @override
  void initState() {
    userRollController = TextEditingController()..text = widget.type == "Edit"?widget.selectedItem.toString() :"";

    isSwitched = ValueNotifier( widget.type == "Edit" ?  widget.isSale!: false);

    isSwitchedOne = ValueNotifier(widget.type == "Edit"?  widget.isPurchase! :false);

    isSwitchedTwo = ValueNotifier(widget.type == "Edit"?  widget.isStockUpdate!:false);

    isSwitchedThree = ValueNotifier(widget.type == "Edit" ?  widget.isReports!: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    // final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;
    return MultiBlocListener(
      listeners: [
      BlocListener<UserRoleBloc, UserRoleState>(
    listener: (context, state) {
      if (state is UserRoleCreateLoading) {
        const CircularProgressIndicator(
          color: Color(0xffB73312),
        );
      }
      if (state is UserRoleCreateLoaded) {
      //  hideProgressBar();
        createUserRoleModelClass =
            BlocProvider.of<UserRoleBloc>(context).createUserRoleModelClass;
        Navigator.pop(context);
        BlocProvider.of<UserRoleBloc>(context)
            .add(UserRoleListEvent(search: ""));
        if (createUserRoleModelClass.statusCode == 6001) {
          msgBtmDialogueFunction(
              context: context,
              textMsg: createUserRoleModelClass.message.toString());
          BlocProvider.of<UserRoleBloc>(context)
              .add(UserRoleListEvent(search: ""));
        }


        if (state is UserRoleCreateError) {
       //   hideProgressBar();
          const Text("Something went wrong");
        }
      }
    },
    ),
        BlocListener<UserRoleBloc, UserRoleState>(
          listener: (context, state) {
            if (state is UserRoleEditLoading) {
              const CircularProgressIndicator();
            }
            if (state is UserRoleEditLoaded) {
              Navigator.pop(context);
              BlocProvider.of<UserRoleBloc>(context).add(UserRoleListEvent(search: ""));

            }
            if (state is UserRoleEditError) {
              const Text("Something went wrong");
            }
          },
        ),
      ],
      child: Scaffold(
          resizeToAvoidBottomInset: false,

          backgroundColor: const Color(0xffF2F2F2),
          appBar: appBar(appBarTitle: "${widget.type} User Role"),
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
                    textCapitalization: TextCapitalization.words,

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
                              return particularItemFunction(text: 'Sales', toggleButtonBoolValue:sWitched, toggleButtonOnChanged: (value ) {

                             value =  isSwitched.value;
                             isSwitched.value = !isSwitched.value ;
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
            if (formKey.currentState!.validate() == true &&
    widget.type == "Add") {
              BlocProvider.of<UserRoleBloc>(context).add(UserRoleCreateEvent(
                  userRoleName: userRollController.text,
                  isSale: isSwitched.value,
                  isPurchase: isSwitchedOne.value,
                  isReports: isSwitchedTwo.value,
                  isStockUpdate: isSwitchedThree.value
              )
              );
            }if(formKey.currentState!.validate() == true && widget.type == "Edit"){
              BlocProvider.of<UserRoleBloc>(context).add(EditUseroleEvent(id: widget.id.toString(),
                  useroleName: userRollController.text,
                  isSale: isSwitched.value,
                  isPurchase: isSwitchedOne.value,
                  isReports: isSwitchedTwo.value,
                  isStockUpdate: isSwitchedThree.value
              ));

            }else {
              null;
            }
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


