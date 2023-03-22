import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topuptest/TopUpScreen/MainScreen/main_screen.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Bloc/TopUpLoginBloc/top_up_login_bloc.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/TopUpLoginModelClass.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> passwordVisible = ValueNotifier(true);
  final ValueNotifier<bool> isChecked = ValueNotifier(true);
  final formKey = GlobalKey<FormState>();

late TopUpLoginModelClass topUpLoginModelClass;


  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;
    return BlocListener<TopUpLoginBloc, TopUpLoginState>(
      listener: (context, state) {
        if (state is TopUpLoginLoading) {
          const CircularProgressIndicator();
        }
        if (state is TopUpLoginLoaded) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => MainScreen(),
              ),
              (route) => false);
        }
        if (state is TopUpLoginError) {
          const Text("Something went wrong");
        }

      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            padding: EdgeInsets.only(left: mWidth * .1, right: mWidth * .1),
            width: mWidth,
            height: mHeight,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/login_bg_image/topup_bg_image.png",
                    ),
                    fit: BoxFit.fill)),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: mHeight * .15,
                  ),
                  SizedBox(
                    height: mHeight * .17,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/login_bg_image/topup_text_image.png",
                          height: mHeight * .06,
                        ),
                        // SizedBox(
                        //   height: mHeight * .01,
                        // ),
                         Text(
                          "Login.",
                          style: GoogleFonts.poppins(textStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 36),
                        )
                         )],
                    ),
                  ),
                  LoginTextFieldWidget(
                    mHeight: mHeight,

                    controller: userNameController,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter username';
                      }
                      return null;
                    },
                    prefixIcon: Icons.person,
                    labelText: "Username",
                    obscureText: false, textInputAction: TextInputAction.next,
                  ),
                  ValueListenableBuilder(
                      valueListenable: passwordVisible,
                      builder: (BuildContext context, bool newValue, _) {
                        return LoginTextFieldWidget(
                          mHeight: mHeight,

                          controller: passwordController,

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password ';
                            }

                            return null;
                          },
                          suffixIcon: IconButton(
                              onPressed: () {
                                passwordVisible.value = !passwordVisible.value;
                              },
                              icon: newValue
                                  ? const Icon(
                                      Icons.visibility_off,
                                      color: Color(0xffC93C13),
                                    )
                                  : const Icon(
                                      Icons.remove_red_eye,
                                      color: Color(0xffC93C13),
                                    )),
                          prefixIcon: Icons.lock,
                          labelText: 'Password',
                          obscureText: newValue, textInputAction: TextInputAction.done,
                        );
                      }),
                  Container(
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    //color: Colors.grey,
                    height: mHeight * .06,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ValueListenableBuilder(
                            valueListenable: isChecked,
                            builder:
                                (BuildContext context, bool newCheckValue, _) {
                              return Checkbox(
                                checkColor: Colors.white,
                                activeColor: const Color(0xffA42910),
                                value: newCheckValue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onChanged: (value) {
                                  isChecked.value = !isChecked.value;
                                },
                              );
                            }),
                         Text(
                          "Remember me",
                          style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mHeight * .03,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: mWidth * .2,
                      ),
                      SizedBox(
                          height: mHeight * .07,
                          width: mWidth * .4,
                          child: ElevatedButton(
                            onPressed: ()async{
                              // SharedPreferences pref = await SharedPreferences.getInstance();
                              // pref.setString("userName", "vikntest");
                           formKey.currentState!.validate()  ?
                           BlocProvider.of<TopUpLoginBloc>(context).add(
                                PostLoginEvent(userName: userNameController.text, password: passwordController.text)

                              ): null;
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffA42910),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child:  Text('Login',style: GoogleFonts.poppins(),),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class LoginTextFieldWidget extends StatelessWidget {
  LoginTextFieldWidget(
      {super.key,
      required this.mHeight,
      required this.controller,
       this.onChanged,
      required this.validator,
      required this.prefixIcon,
      required this.labelText,
      required this.obscureText,
      this.suffixIcon, required this.textInputAction})
  ;

  final double mHeight;
  // final GlobalKey<FormFieldState> _formFieldKey;
  final TextEditingController controller;
   Function(String)? onChanged;
  final String? Function(String?) validator;
  final IconData prefixIcon;
  final String labelText;
  final bool obscureText;
  final TextInputAction textInputAction;
  Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mHeight * .07,
      child: TextFormField(
        textInputAction: textInputAction,
        obscureText: obscureText,
        style: GoogleFonts.poppins(textStyle: const TextStyle(fontWeight: FontWeight.bold)),
        // key: _formFieldKey,
        onChanged: onChanged,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffC93C13)),
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: const Color(
              0xff707070,
            ),
          ),
          suffixIcon: suffixIcon,
          labelText: labelText,
          labelStyle:GoogleFonts.poppins(textStyle: const TextStyle(color: Color(0xffA1A1A1), fontSize: 13),)
        ),
      ),
    );
  }
}
