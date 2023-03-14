

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: size.height * .7,
                  decoration: const BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text('Name: John Doe'),
                          const SizedBox(
                            width: 20,
                          ),
                          IconButton(
                            onPressed: () {
                              custoModelBottomSheet(context);
                            },
                            icon: const Icon(Icons.edit),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text('Email: johndoe@example.com'),
                          const SizedBox(
                            width: 20,
                          ),
                          IconButton(
                            onPressed: () {
                              custoModelBottomSheet(context);
                            },
                            icon: const Icon(Icons.edit),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text('Phone: +1 555 123 4567'),
                          const SizedBox(
                            width: 20,
                          ),
                          IconButton(
                            onPressed: () {
                              custoModelBottomSheet(context);
                            },
                            icon: const Icon(Icons.edit),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: size.width / 3,
            top: size.height * .1,
            child: Container(
              height: size.height * .2,
              width: size.width * .3,
              color: Colors.white.withOpacity(.5),
              child: const FittedBox(
                child: Icon(Icons.person),
              ),
            ),
          ),
          Positioned(
            left: size.width * .6,
            top: size.height * .22,
            child: Container(
              height: size.height * .05,
              width: size.width * .15,
              color: Colors.grey,
              alignment: Alignment.center,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.camera_alt_outlined,
                  size: size.width * .07,
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

custoModelBottomSheet(context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        padding:
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Enter your details",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 16.0),
              const TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Save"),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:topuptest/TopUpScreen/Custom_Commen_Class_BottomSheet/commen_function.dart';
// import '../CameraSecton/camera_screen.dart';
// import '../Constens/constens.dart';
// import '../Functions/bottom_sheet_function.dart';
// import '../Widgets/appbar_widget.dart';
// import '../Widgets/bottom_sheet_button_widget.dart';
// import '../Widgets/text_field_widget.dart';
// import 'Widgets/listTileWidget.dart';
//
// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   BottomSheetClass bottomSheetClass = BottomSheetClass();
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   File? image;
//   File? path;
//   final constantImage =
//       "https://icon-library.com/images/unknown-person-icon/unknown-person-icon-4.jpg";
//
//   TextEditingController nameController = TextEditingController()
//     ..text = "Savad Farooque";
//
//   TextEditingController phoneNumberController = TextEditingController()
//     ..text = "912536985698";
//
//   TextEditingController emailController = TextEditingController()
//     ..text = "savadfarooque@gmail.com";
//
//   TextEditingController oldPasswordController = TextEditingController();
//
//   TextEditingController newPasswordController = TextEditingController();
//
//   FocusNode nameFocus = FocusNode();
//
//   FocusNode phoneFocus = FocusNode();
//
//   FocusNode emailFocus = FocusNode();
//
//   userImage(File image) {
//     setState(() {
//       image = image;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     final mWidth = MediaQuery.of(context).size.width;
//     final mHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: backGroundColor,
//       appBar: appBar(appBarTitle: 'Profile'),
//       body: LayoutBuilder(builder: (_, constraints) {
//         final width = constraints.biggest.width;
//         final height = constraints.biggest.height;
//         return Stack(
//           children: [
//             Positioned(
//               right: 1,
//               top: 100,
//               left: 1,
//               bottom: 1,
//               child: Container(
//                 height: mHeight * .1,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20)),
//                 ),
//                 child: ListView(
//                   physics: const BouncingScrollPhysics(),
//                   children: [
//                     SizedBox(
//                       height: mHeight * .15,
//                     ),
//                     ListTileWidget(
//                       inputBorder: InputBorder.none,
//                       //focusNode: nameFocus,
//                       trailing: IconButton(
//                         icon: const Icon(Icons.edit),
//                         onPressed: () {
//                           WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//                             bottomSheetClass.bottomSheet(
//                                 context: context,
//                                 labelText: 'Enter your name',
//                                 controller: nameController,
//                                 onPressed: () {},
//                                 scaffoldKey: scaffoldKey);
//                           }
//                             // displayBottomSheet(
//                             //   context: context,
//                             //   labelText: 'Enter your name',
//                             //   controller: nameController,
//                             //   onPressed: () {
//                             //     Navigator.pop(context);
//                             //   },
//                             // );
//                           );},
//                       ),
//                       labelText: 'Name',
//                       widget: const Icon(Icons.person,
//                           size: 20, color: Color(0xff707070)),
//                       controller: nameController,
//                       //  readOnly: _isDisabled,
//                     ),
//                     ListTileWidget(
//                       inputBorder: InputBorder.none,
//                       // focusNode: phoneFocus,
//                       controller: phoneNumberController,
//                       trailing: IconButton(
//                         icon: const Icon(Icons.edit),
//                         onPressed: () {
//                           // displayBottomSheet(
//                           //   context: context,
//                           //   labelText: 'Enter your phone number',
//                           //   controller: phoneNumberController,
//                           //   onPressed: () {
//                           //     Navigator.pop(context);
//                           //   },
//                           // );
//                         },
//                       ),
//                       labelText: 'Phone',
//                       widget: const Icon(Icons.phone,
//                           size: 20, color: Color(0xff707070)),
//                       // readOnly: _isDisabledPhone,
//                     ),
//                     ListTileWidget(
//                       inputBorder: InputBorder.none,
//                       // focusNode: emailFocus,
//                       controller: emailController,
//                       trailing: IconButton(
//                         icon: const Icon(Icons.edit),
//                         onPressed: () {
//                           // displayBottomSheet(
//                           //   context: context,
//                           //   labelText: 'Enter your email',
//                           //   controller: emailController,
//                           //   onPressed: () {
//                           //     Navigator.pop(context);
//                           //   },
//                           // );
//                         },
//                       ),
//                       labelText: 'Email',
//                       widget: Image.asset(
//                         "assets/profile_image/sendimage.png",
//                       ),
//                       //  readOnly: _isDisabledEmail,
//                     ),
//                     Container(
//                       //  color: Colors.green,
//                         padding: EdgeInsets.only(
//                             left: mWidth * .065,
//                             right: mWidth * .1,
//                             top: mHeight * .03),
//                         child: Row(
//                           children: [
//                             const Icon(
//                               Icons.lock,
//                               color: Color(0xff707070),
//                               size: 20,
//                             ),
//                             SizedBox(
//                               width: mWidth * .05,
//                             ),
//                             const Text(
//                               "Security",
//                               style: TextStyle(
//                                 // color: Color(0xff707070),
//                                   fontWeight: FontWeight.w900),
//                             )
//                           ],
//                         )),
//                     Container(
//                       //color: Colors.grey,
//                       padding: EdgeInsets.only(left: mWidth * .12),
//                       // height: mHeight * .03,
//                       child: ListTile(
//                           onTap: () {
//                             passwordBottomSheet(
//                                 context: context,
//                                 labelText: "Old password",
//                                 controller: oldPasswordController,
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                                 headingText: 'Change Password',
//                                 labelTextOne: "new password",
//                                 controllerOne: newPasswordController);
//                           },
//                           subtitle: const Text("Change Password"),
//                           trailing: Padding(
//                             padding: EdgeInsets.only(
//                                 top: mHeight * .035, right: mWidth * .05),
//                             child: const Icon(
//                               Icons.arrow_forward_ios_rounded,
//                               size: 15,
//                             ),
//                           )),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             PositionedWidget(
//               right: mWidth * .3,
//               top: mHeight * .03,
//               left: mWidth * .3,
//               bottom: mHeight * .55,
//               color: Colors.grey,
//               borderRadius: BorderRadius.circular(10),
//               image: path != null
//                   ? DecorationImage(image: FileImage(path!), fit: BoxFit.cover)
//                   : DecorationImage(
//                 fit: BoxFit.cover,
//                 image: NetworkImage(constantImage),
//               ),
//             ),
//             Positioned(
//               left: size.width * .6,
//               top: size.height * .22,
//               child: Container(
//                 height: size.height * .05,
//                 width: size.width * .15,
//                 color: Colors.grey,
//                 alignment: Alignment.center,
//                 child: IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.camera_alt_outlined,
//                     size: size.width * .07,
//                   ),
//                 ),
//               ),
//             )
//             // Positioned(
//             //     right: width * .26,
//             //     top: height * .22,
//             //     left: width * .64,
//             //     bottom: height * .72,
//             //     child: Container(
//             //         decoration: BoxDecoration(
//             //           color: const Color(0xffA42910),
//             //           borderRadius: BorderRadius.circular(8),
//             //         ),
//             //         child: TextButton(
//             //           onPressed: () async {
//             //             final result = await Navigator.push(
//             //                 context,
//             //                 (MaterialPageRoute(
//             //                     builder: (context) => const CameraScreen())));
//             //             setState(() {
//             //               path = result;
//             //               image = result;
//             //             });
//             //             path = result;
//             //           },
//             //           child: Image.asset(
//             //             "assets/profile_image/camera.png",
//             //             height: mHeight * .02,
//             //             width: mWidth * .04,
//             //             fit: BoxFit.cover,
//             //           ),
//             //         ))),
//           ],
//         );
//       }),
//     );
//   }
// }
//
// class PositionedWidget extends StatelessWidget {
//   const PositionedWidget(
//       {super.key,
//         required this.right,
//         required this.top,
//         required this.left,
//         required this.bottom,
//         this.image,
//         required this.color,
//         required this.borderRadius,
//         this.child});
//
//   final double right;
//   final double top;
//   final double left;
//   final double bottom;
//   final Color color;
//   final BorderRadiusGeometry borderRadius;
//   final DecorationImage? image;
//   final Widget? child;
//
//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//         right: right,
//         top: top,
//         left: left,
//         bottom: bottom,
//         child: Container(
//           decoration: BoxDecoration(
//               color: color, borderRadius: borderRadius, image: image),
//           child: child,
//         ));
//   }
// }
//
// void passwordBottomSheet({
//   required BuildContext context,
//   required String labelText,
//   required TextEditingController controller,
//   required Function() onPressed,
//   required String headingText,
//   required String labelTextOne,
//   required TextEditingController controllerOne,
// }) {
//   showModalBottomSheet(
//       isScrollControlled: true,
//       isDismissible: true,
//       context: context,
//       constraints: BoxConstraints.tight(Size(MediaQuery.of(context).size.width,
//           MediaQuery.of(context).size.height * .7)),
//       builder: (ctx) {
//         final MediaQueryData mediaQueryData = MediaQuery.of(context);
//         return Padding(
//           padding: mediaQueryData.viewInsets,
//           child: SingleChildScrollView(
//             child: Container(
//               padding:
//               const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
//               child: Form(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       headingText,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.w900, fontSize: 18),
//                     ),
//                     TextFieldWidget(
//                       controller: controller,
//                       labelText: labelText,
//                     ),
//                     TextFieldWidget(
//                       controller: controllerOne,
//                       labelText: labelTextOne,
//                     ),
//                     ButtonWidget(onPressed: onPressed)
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       });
// }
