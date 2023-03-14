import 'package:flutter/material.dart';
import '../../../../Constens/constens.dart';
import '../../../../Functions/floating_action_function.dart';
import '../../../../Functions/toggle_button_function.dart';
import '../../../../Widgets/appbar_widget.dart';
import '../../../../Widgets/text_form_field_widget.dart';
import 'use_role_list_textfiled.dart';

class AddUserScreen extends StatelessWidget {
   AddUserScreen({Key? key}) : super(key: key);

 final TextEditingController nameController = TextEditingController()
    ..text = "Savad Farooque";

   final TextEditingController phoneNumberController = TextEditingController()
    ..text = "+912365478965";

   final TextEditingController emailController = TextEditingController()
    ..text = "savadfarooque@gmail.com";

   final TextEditingController passwordController = TextEditingController()
    ..text = "123456";

   final TextEditingController userRollController = TextEditingController()
    ..text = "Accountant";

 // bool isSwitched = false;
   final ValueNotifier<bool> passwordVisible = ValueNotifier(true);

   final ValueNotifier<bool> isSwitched = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: backGroundColor,
        appBar: appBar(appBarTitle: 'Add User', actions: [
          SizedBox(
            width: mWidth * .2,
            child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Image.asset(
                      "assets/settingsimage/share.png",
                      height: mHeight * .025,
                    ),
                  ),
                  const Text(
                    "share",
                    style: TextStyle(color: Color(0xffCC3E14), fontSize: 16),
                  ),
                  SizedBox(
                    width: mWidth * .02,
                  )
                ],
              ),
            ),
          ),
        ]),
        body: Container(
          padding: const EdgeInsets.all(20),
          height: mHeight,
          decoration: containerDecoration,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              TextFormFieldWidget(
                obscureText: false,

                controller: nameController,
                labelText: 'User',
                textInputType: TextInputType.text,
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
              ),
              TextFormFieldWidget(
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
                      builder: (BuildContext context, bool newValue, _) {
                      return Expanded(
                          flex: 8,
                          child: TextFormFieldWidget(
                            obscureText: newValue,
                            controller: passwordController,
                            maxLines: 1,

                            labelText: "Password",
                            textInputType: TextInputType.number,
                            prefixIcon: Image.asset(
                              "assets/settingsimage/paswrd.png",
                            ),
                            suffixIcon:IconButton(
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
                                ))
                          ));
                    }
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: GestureDetector(
                        onTap: () {},
                        child:
                            Image.asset("assets/settingsimage/reloadicon.png")),
                  )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Admin",style: TextStyle(color: Colors.black,fontSize: 16),),

                  ValueListenableBuilder(
                      valueListenable: isSwitched,
                      builder: (BuildContext context, bool sWitched, _) {
                      return toggleButton(value: sWitched, onChanged: (value ) {
                        value = isSwitched.value;
                        isSwitched.value = !isSwitched.value;

                      });
                    }
                  )

                ],
              ),
              SizedBox(height: mHeight*.02,),
              const Text("Userole",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w900),),
              TextFormFieldWidget(
                obscureText: false,

                controller: userRollController,
                readOnly: true,
                labelText: "User Roles",
                suffixIcon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.black,
                ),
                onTap: () async {
                  final
                  result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UseRoleListScreen()),
                  );
                  result != null ? userRollController.text = result[0] : Null;
                  },
                textInputType: TextInputType.none,
              ),
            ],
          ),
        ),
        floatingActionButton: floatingActionButton(
            context: context,
            color: Colors.green,
            icon: Icons.done,
            onPressed: () {
              Navigator.pop(context);
            }));
  }
}
