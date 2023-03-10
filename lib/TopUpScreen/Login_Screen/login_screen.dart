import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topuptest/Api_Section/Bloc/LoginBloc/login_bloc.dart';
import 'package:topuptest/Api_Section/ModelClasses/LoginModelClass.dart';
import 'package:topuptest/TopUpScreen/MainScreen/main_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController userNameController = TextEditingController()
    ..text = "vikntest";
  final TextEditingController passwordController = TextEditingController()
    ..text = "test@123";
  final ValueNotifier<bool> passwordVisible = ValueNotifier(true);
  final ValueNotifier<bool> isChecked = ValueNotifier(true);
  final formKey = GlobalKey<FormState>();
  final _formFieldKey = GlobalKey<FormFieldState>();
  final _formFieldKey1 = GlobalKey<FormFieldState>();
  late LoginModelClass loginModelClass;

  loginFunction(
      {required String userName,
      required String password,
      required String service}) async {}

  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          const CircularProgressIndicator();
        }
        if (state is LoginLoaded) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => MainScreen(),
              ),
              (route) => false);
        }
        if (state is LoginError) {
          const Text("Something went wrong");
        }
        // TODO: implement listener
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
                    height: mHeight * .15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/login_bg_image/topup_text_image.png",
                          height: mHeight * .06,
                        ),
                        SizedBox(
                          height: mHeight * .02,
                        ),
                        const Text(
                          "Login.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 37),
                        )
                      ],
                    ),
                  ),
                  LoginTextFieldWidget(
                    mHeight: mHeight,
                    formFieldKey: _formFieldKey,
                    controller: userNameController,
                    onChanged: (value) {
                      (_formFieldKey.currentState!.validate());
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter username';
                      }
                      return null;
                    },
                    prefixIcon: Icons.person,
                    labelText: "Username",
                    obscureText: false,
                  ),
                  ValueListenableBuilder(
                      valueListenable: passwordVisible,
                      builder: (BuildContext context, bool newValue, _) {
                        return LoginTextFieldWidget(
                          mHeight: mHeight,
                          formFieldKey: _formFieldKey1,
                          controller: passwordController,
                          onChanged: (value) {
                            (_formFieldKey1.currentState!.validate());
                          },
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
                          obscureText: newValue,
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
                        const Text(
                          "Remember me",
                          style: TextStyle(fontSize: 16),
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
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => MainScreen(),
                                  ),
                                      (route) => false);
                              // return BlocProvider.of<LoginBloc>(context).add(
                              //     FetchLogin(
                              //         username: userNameController.text,
                              //         password: passwordController.text,
                              //         service: "application service"));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffA42910),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text('Login'),
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
      required GlobalKey<FormFieldState> formFieldKey,
      required this.controller,
      required this.onChanged,
      required this.validator,
      required this.prefixIcon,
      required this.labelText,
      required this.obscureText,
      this.suffixIcon})
      : _formFieldKey = formFieldKey;

  final double mHeight;
  final GlobalKey<FormFieldState> _formFieldKey;
  final TextEditingController controller;
  final Function(String) onChanged;
  final String? Function(String?) validator;
  final IconData prefixIcon;
  final String labelText;
  final bool obscureText;
  Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mHeight * .07,
      child: TextFormField(
        obscureText: obscureText,
        style: const TextStyle(fontWeight: FontWeight.bold),
        key: _formFieldKey,
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
          labelStyle: const TextStyle(color: Color(0xffA1A1A1), fontSize: 13),
        ),
      ),
    );
  }
}
