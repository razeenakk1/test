import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../CameraSecton/camera_screen.dart';
import '../Constens/constens.dart';
import '../Widgets/appbar_widget.dart';
import 'Custom_Class/profile_bottom_sheet_class.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // BottomSheetClass bottomSheetClass = BottomSheetClass();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ProfileBottomSheetClass profileBottomSheetClass = ProfileBottomSheetClass();

  File? image;
  File? path;
  final constantImage =
      "https://icon-library.com/images/unknown-person-icon/unknown-person-icon-4.jpg";
  String name = 'Savad Farooque';
  String phone = '912536985698';
  String email = 'savadfarooque@gmail.com';



  TextEditingController oldPasswordController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: backGroundColor,
        appBar: appBar(appBarTitle: 'Profile'),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Stack(
            children: [
              Container(
                height: size.height,
                width: size.width,
                color: const Color(0xffF2F2F2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: size.height * .9,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: size.height * .15,
                          ),
                          ProfileRowWidget(
                            size: size,
                            icon: const Icon(Icons.person,
                                size: 25, color: Color(0xff707070)), firstText: "Name", secondText: name,
                            buttonOnPressed: () {
                              profileBottomSheetClass.profileModelBottomSheet(
                                  type: 'Name', context: context, data: name);
                              },),
                          ProfileRowWidget(
                              size: size,
                              firstText: "Phone",
                            icon: const Icon(Icons.phone,
                                size: 20, color: Color(0xff707070)), secondText: "+$phone",
                              buttonOnPressed: () {
                                profileBottomSheetClass.profileModelBottomSheet(
                                  type: 'Phone',
                                  context: context, data: phone,
                                );
                              },
                             ),
                          ProfileRowWidget(
                              size: size,
                              firstText: "Email",
                              icon: Image.asset(
                                "assets/profile_image/sendimage.png",
                              ),
                              secondText: email,
                              buttonOnPressed: () {
                                profileBottomSheetClass.profileModelBottomSheet(
                                    context: context, type: 'Email', data: email);
                              }),
                          SizedBox(
                            height: size.height * .03,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: size.width * .09),
                              //  color: Colors.green,

                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.lock,
                                    color: Color(0xff707070),
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: size.width * .04,
                                  ),
                                   Text(
                                    "Security",
                                    style:GoogleFonts.poppins(textStyle: const TextStyle(
                                        // color: Color(0xff707070),
                                        fontWeight: FontWeight.w900,
                                        fontSize: 15),
                                  )
                                   )
                                ],
                              )),
                          SizedBox(
                            height: size.height * .05,
                          ),
                          InkWell(
                            onTap: () {
                              profileBottomSheetClass.passwordModelBottomSheet(
                                  context: context,
                                  labelText: "Old password",
                                  controller: oldPasswordController,
                                  onPressed: () {
                                    formKey.currentState!.validate() ? Navigator.pop(context): const SizedBox();
                                    /// save onPressed api call function
                                    ///
                                  //  Navigator.pop(context);
                                  },
                                  headingText: 'Change Password',
                                  labelTextOne: "new password",
                                  controllerOne: newPasswordController, formKey: formKey);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: size.width * .01,
                                ),
                                 Text("Change Password", style:GoogleFonts.poppins(fontWeight: FontWeight.w500,color: Colors.grey),),
                                SizedBox(
                                  width: size.width * .23,
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 15,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: size.width / 3.3,
                //  top: size.height * .01,
                child: Container(
                  height: size.height * .2,
                  width: size.width * .4,

                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    image: path != null
                        ? DecorationImage(
                            image: FileImage(path!), fit: BoxFit.cover)
                        : DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(constantImage),
                          ),
                  ),

                  // child: const FittedBox(
                  //   child: Icon(Icons.person),
                  // ),
                ),
              ),
              Positioned(
                left: size.width * .65,
                top: size.height * .13,
                child: Container(
                  height: size.height * .055,
                  width: size.width * .12,
                  decoration: BoxDecoration(
                    color: const Color(0xffA42910),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () async {
                      final result = await Navigator.push(
                          context,
                          (MaterialPageRoute(
                              builder: (context) => const CameraScreen())));
                      setState(() {
                        path = result;
                        image = result;
                      });
                      path = result;
                    },
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: size.width * .07,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class ProfileRowWidget extends StatelessWidget {
  const ProfileRowWidget({
    super.key,
    required this.size,

    required this.firstText, required this.secondText,
    required this.icon,
    required this.buttonOnPressed,
  });

  final Size size;

  final Widget icon;
  final String firstText;
  final String secondText;

  final Function() buttonOnPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: size.width*.05),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              height: size.height * .08,
             // color: Colors.grey,
              width: size.width * .7,
              child:
              Row(
                children: [
               Container(
                 padding: EdgeInsets.only(bottom: size.height*.02),
                // color: Colors.greenAccent,
                   child: icon),
                  SizedBox(width: size.width*.03,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(firstText, style:GoogleFonts.poppins(textStyle: const  TextStyle(fontSize: 13,color: Colors.grey,fontWeight: FontWeight.w700,),)),
                      SizedBox(
                        width: size.width*.6,
                       // color: Colors.blue,
                        child: Expanded(
                            child: Text(secondText, overflow: TextOverflow.ellipsis,


                                style:GoogleFonts.poppins(textStyle: const  TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)),
                      ))
                    ],
                  )


                ],
              )
              // TextFormField(
              //   style: const TextStyle(fontWeight: FontWeight.bold),
              //   readOnly: true,
              //   controller: controller,
              //   decoration: InputDecoration(
              //     labelText: labelText,
              //     labelStyle: const TextStyle(color: Colors.grey),
              //     border: InputBorder.none,
              //     prefixIcon: prefixIcon,
              //   ),
              // )
          ),
          IconButton(
            onPressed: buttonOnPressed,
            icon: const Icon(
              Icons.edit,
              color: Color(0xff707070),
            ),
          ),
        ],
      ),
    );
  }
}


