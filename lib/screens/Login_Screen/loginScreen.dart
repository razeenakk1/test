import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topuptest/Api_Section/Bloc/LoginBloc/login_bloc.dart';
import 'package:topuptest/Api_Section/ModelClasses/LoginModelClass.dart';
import 'package:topuptest/screens/HomeScreen/homeScreen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController userNameController = TextEditingController()
    ..text = "vikntest";
  TextEditingController passwordController = TextEditingController()
    ..text = "test@123";
  ValueNotifier<bool> passwordVisible = ValueNotifier(true);
  ValueNotifier<bool> isChecked = ValueNotifier(true);
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
    final mHieght = MediaQuery.of(context).size.height;
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          const CircularProgressIndicator();
        }
        if (state is LoginLoaded) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
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
          // backgroundColor: Colors.white,
          body: Container(
            padding: EdgeInsets.only(left: mWidth * .1, right: mWidth * .1),
            width: mWidth,
            height: mHieght,
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
                    height: mHieght * .15,
                  ),
                  SizedBox(
                    //   padding: EdgeInsets.only(left: mWidth * .1),
                    height: mHieght * .15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/login_bg_image/topup_text_image.png",
                          height: mHieght * .06,
                        ),
                        SizedBox(
                          height: mHieght * .02,
                        ),
                        const Text(
                          "Login.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 37),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mHieght * .07,
                    // color: Colors.grey,
                    child: TextFormField(
                      key: _formFieldKey,
                      onChanged: (value) {
                        (_formFieldKey.currentState!.validate());
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                      controller: userNameController,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffC93C13)),
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color(
                            0xff707070,
                          ),
                        ),
                        labelText: "Username",
                        labelStyle:
                            TextStyle(color: Color(0xffA1A1A1), fontSize: 13),
                      ),
                    ),
                  ),
                  ValueListenableBuilder(
                      valueListenable: passwordVisible,
                      builder: (BuildContext context, bool newValue, _) {
                        return SizedBox(
                            height: mHieght * .1,
                            // color: Colors.grey,
                            child: TextFormField(
                              key: _formFieldKey1,
                              onChanged: (value) {
                                (_formFieldKey1.currentState!.validate());
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter password ';
                                }

                                return null;
                              },
                              obscureText: newValue,
                              controller: passwordController,
                              decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffC93C13)),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Color(
                                      0xff707070,
                                    ),
                                  ),
                                  labelText: "Password",
                                  labelStyle: const TextStyle(
                                      color: Color(0xffA1A1A1), fontSize: 13),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        passwordVisible.value =
                                            !passwordVisible.value;
                                      },
                                      icon: newValue
                                          ? const Icon(
                                              Icons.visibility_off,
                                              color: Color(0xffC93C13),
                                            )
                                          : const Icon(
                                              Icons.remove_red_eye,
                                              color: Color(0xffC93C13),
                                            ))),
                            ));
                      }),
                  Container(
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    //color: Colors.grey,
                    height: mHieght * .06,
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
                                // fillColor: MaterialStateProperty.resolveWith(getColor),
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
                    height: mHieght * .03,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: mWidth * .2,
                      ),
                      SizedBox(
                          height: mHieght * .07,
                          width: mWidth * .4,
                          child: ElevatedButton(
                            onPressed: () {
                              return BlocProvider.of<LoginBloc>(context).add(
                                  FetchLogin(
                                      username: userNameController.text,
                                      password: passwordController.text,
                                      service: "application service"));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffA42910),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(30), // <-- Radius
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
