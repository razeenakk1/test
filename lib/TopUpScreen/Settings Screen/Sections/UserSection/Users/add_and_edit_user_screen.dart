import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Bloc/User/user_bloc.dart';
import '../../../../Constens/constens.dart';
import '../../../../Functions/auto_generate_function.dart';
import '../../../../Functions/exitbuttonfunction.dart';
import '../../../../Functions/floating_action_function.dart';
import '../../../../Functions/toggle_button_function.dart';
import '../../../../TopUpApiSection/ModelClasses/User/CreateUserModelClass.dart';
import '../../../../Widgets/appbar_widget.dart';
import '../../../../Widgets/text_form_field_widget.dart';
import 'use_role_list_textfiled.dart';

class AddAndEitUser extends StatefulWidget {
  const AddAndEitUser({Key? key, required this.type}) : super(key: key);
  final String type;

  @override
  State<AddAndEitUser> createState() => _AddAndEitUserState();
}

class _AddAndEitUserState extends State<AddAndEitUser> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController userNameController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController userRollController = TextEditingController();

  String userNameText = "";
  String passwordText = "";
  String textMsg = '';
  late CreateUserModelClass createUserModelClass;




  String userID = "";

  // assigningFunction() {
  //   String msgText = 'This is TopUp !\n'
  //       'Our inviting you and providing your user name is $userNameText and password is $passwordText';
  //   textMsg = msgText;
  // }


  @override
  void initState() {
    // passwordText = passwordController.value.text;
    // userNameText = userNameController.value.text;

    // TODO: implement initState
    super.initState();
  }

  // bool isSwitched = false;
  final ValueNotifier<bool> passwordVisible = ValueNotifier(true);

  final ValueNotifier<bool> isSwitched = ValueNotifier(false);
  final ValueNotifier<bool> isVisible = ValueNotifier(false);


  final formKey = GlobalKey<FormState>();

  // void _onShare(BuildContext context) async {
  //   final box = context.findRenderObject() as RenderBox?;
  //
  //   await Share.share(text,
  //       sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  //   print("***************************************$text");
  // }

  // }
  FocusNode myFocus = FocusNode();
  void clearText() {

    nameController.clear();
    userNameController.clear();
    phoneNumberController.clear();
    emailController.clear();
    passwordController.clear();
    userRollController.clear();
  }


  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;

    return MultiBlocListener(
      listeners: [
        BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UserCreateLoading) {
              const CircularProgressIndicator(
                color: Color(0xffB73312),
              );
            }
            if (state is UserCreateLoaded) {

              print("hy_______________________");
              //  hideProgressBar();
              createUserModelClass = BlocProvider.of<UserBloc>(context).createUserModelClass;
              if(createUserModelClass.statusCode == 6000){
                btmDialogueFunction(context: context,
                    textMsg: 'Do you want to share?', fistBtnOnPressed: () {
                      Navigator.of(context).pop(true);
                      clearText();

                    }, secondBtnPressed: () {
                      shareFunction( context,  userNameText, passwordText);
                      clearText();
                      Navigator.of(context).pop(true);



                    }, secondBtnText: 'share'
                );

              }if(createUserModelClass.statusCode == 6001){
                msgBtmDialogueFunction(context: context, textMsg: createUserModelClass.message.toString());
              }


              // Navigator.pop(context);
              // BlocProvider.of<UserBloc>(context)
              //     .add(UserListEvent(search: ""));
              // if (createUserModelClass.statusCode == 6001) {
              //   msgBtmDialogueFunction(
              //       context: context,
              //       textMsg: createUserModelClass.message.toString());
              //   BlocProvider.of<UserBloc>(context)
              //       .add(UserListEvent(search: ""));
              // }


              if (state is UserCreateError) {
                //   hideProgressBar();
                const Text("Something went wrong");
              }
            }
          },
        ),
        // BlocListener<UserBloc, UserState>(
        //   listener: (context, state) {
        //     if (state is UserEditLoading) {
        //       const CircularProgressIndicator();
        //     }
        //     if (state is UserEditLoaded) {
        //       Navigator.pop(context);
        //       BlocProvider.of<UserBloc>(context).add(UserListEvent(search: ""));
        //
        //     }
        //     if (state is UserEditError) {
        //       const Text("Something went wrong");
        //     }
        //   },
        // ),
      ],


      child: ValueListenableBuilder(
        valueListenable: isVisible,
          builder: (BuildContext context, bool newValue, _) {
          return Scaffold(
              //resizeToAvoidBottomInset: false,
              backgroundColor: backGroundColor,
              appBar: appBar(appBarTitle: '${widget.type} User', actions: [
                SizedBox(
                  width: mWidth * .2,
                  child:  newValue ?GestureDetector(
                    onTap: () {
                     // assigningFunction();
                   shareFunction( context,  userNameText, passwordText);
                      // print("_______________$text");

                    },
                    child: ShareButtonWidget(mHeight: mHeight, mWidth: mWidth),
                  ):const SizedBox()
                ),
              ]),
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
                        enabled: !newValue,
                        readOnly: false,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        obscureText: false,
                        controller:   nameController,
                        labelText: 'Name',
                        textInputType: TextInputType.text,
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                      TextFormFieldWidget(
                        readOnly: false,
                        enabled: !newValue,

                        onChanged: (String value) => setState(() {
                          userNameText = value;
                        }),
                        textInputAction: TextInputAction.next,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        obscureText: false,
                        controller:userNameController,
                        labelText: 'User Name',
                        textInputType: TextInputType.text,
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                      ),
                      TextFormFieldWidget(
                        readOnly: false,
                        enabled: !newValue,

                        textInputAction: TextInputAction.next,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        obscureText: false,
                        controller: phoneNumberController,
                        labelText: 'Phone',
                        textInputType: TextInputType.phone,
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Colors.grey,
                        ),
                      ),
                      TextFormFieldWidget(
                        enabled: !newValue,
                        readOnly: false,

                        textInputAction: TextInputAction.next,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'This field is required';
                          }
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(val)) {
                            return "Please enter a valid email address";
                          }
                          return null;
                        },
                        obscureText: false,
                        controller: emailController,
                        labelText: 'Email',
                        textInputType: TextInputType.emailAddress,
                        prefixIcon: Image.asset("assets/profile_image/sendimage.png"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ValueListenableBuilder(
                              valueListenable: passwordVisible,
                              builder: (BuildContext context, bool passwordNewValue, _) {
                                return Expanded(
                                    flex: 8,
                                    child: TextFormFieldWidget(
                                        validator: (val) {

                                          if (val == null || val.isEmpty) {
                                            return 'This field is required';
                                          }if (val.length < 8 ) {
                                            return 'Too short';
                                          }
                                          return null;
                                        },
                                        readOnly: false,
                                        enabled: !newValue,

                                        onChanged: (String value) => setState(() {
                                              passwordText = value;

                                            }),
                                        textInputAction: TextInputAction.done,
                                        obscureText: passwordNewValue,
                                        controller: passwordController,
                                        maxLines: 1,
                                        labelText: "Password",
                                        textInputType: TextInputType.visiblePassword,
                                        prefixIcon: Image.asset(
                                          "assets/settingsimage/paswrd.png",
                                        ),
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              passwordVisible.value =
                                                  !passwordVisible.value;
                                            },
                                            icon: passwordNewValue
                                                ? const Icon(
                                                    Icons.visibility_off,
                                                    color: Color(0xffC93C13),
                                                  )
                                                : const Icon(
                                                    Icons.remove_red_eye,
                                                    color: Color(0xffC93C13),
                                                  )
                                        )
                                    )
                                );
                              }),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: GestureDetector(
                                onTap: () {
                                   passwordText =generatePassword();
                                  passwordController.text = passwordText;
                                },
                                child: Image.asset(
                                    "assets/settingsimage/reloadicon.png")),
                          )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Admin",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Colors.black, fontSize: 16),
                              )),
                          ValueListenableBuilder(
                              valueListenable: isSwitched,
                              builder: (BuildContext context, bool sWitched, _) {
                                return toggleButton(
                                    value: sWitched,
                                    onChanged: (value) {
                                      value = isSwitched.value;
                                      isSwitched.value = !isSwitched.value;
                                    });
                              })
                        ],
                      ),
                      SizedBox(
                        height: mHeight * .02,
                      ),
                      Text("Userole",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w900),
                          )),
                      TextFormFieldWidget(

                        validator: (val) {

                          if (val == null || val.isEmpty) {
                            return 'This field is required';

                          }
                          return null;
                        },
                        textInputAction: TextInputAction.done,
                        obscureText: false,
                        controller:  userRollController,
                        readOnly: true,
                        enabled: !newValue,
                        labelText: "User Roles",
                        suffixIcon: const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.black,
                        ),
                        onTap: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UseRoleListScreen()),
                          );

                          result != null ? userRollController.text = result[0] : Null;
                        //  result != null ? controllerUserole.text = result[0] : Null;
                          print("***********************************$result");

                          userID = result[1];

                          print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@$userID");
                        },
                        textInputType: TextInputType.none,
                      ),
                    ],
                  ),
                ),
              ),
              floatingActionButton: floatingActionButton(
                  context: context,
                  color: Colors.green,
                  icon: Icons.done,
                  onPressed: () {
                    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~$userID");

                    if(  formKey.currentState!.validate() && widget.type == "Add"){
                      // isVisible.value = !isVisible.value;
                      BlocProvider.of<UserBloc>(context).add(CreateUserEvent(
                          firstName: nameController.text, username: userNameController.text, email: emailController.text,
                          password1: passwordController.text, password2: passwordController.text, phone: phoneNumberController.text,
                          userRoles: userID.toString(), isAdmin: isSwitched.value));
                      print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${nameController.text}");
                      print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${userNameController.text}");
                      print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~$userID");
                    }

                    // formKey.currentState!.validate()
                    //     ?   isVisible.value = !isVisible.value
                    //     : const SizedBox();



                  }));
        }
      ),
    );
  }
}

class ShareButtonWidget extends StatelessWidget {
  const ShareButtonWidget({
    super.key,
    required this.mHeight,
    required this.mWidth,
  });

  final double mHeight;
  final double mWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Image.asset(
            "assets/settingsimage/share.png",
            height: mHeight * .022,
          ),
        ),
        Text("share",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  color: Color(0xffCC3E14), fontSize: 13),
            )),
        SizedBox(
          width: mWidth * .02,
        )
      ],
    );
  }
}
 shareFunction(BuildContext context, String userName, String password) async {

  await Share.share('This is TopUp !\n'
      'Our inviting you and providing your user name is $userName and password is $password',
      );
}
