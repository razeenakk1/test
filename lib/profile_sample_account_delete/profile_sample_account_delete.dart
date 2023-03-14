import 'package:flutter/material.dart';

class ProfileSample extends StatefulWidget {
  const ProfileSample({Key? key}) : super(key: key);

  @override
  State<ProfileSample> createState() => _ProfileSampleState();
}

class _ProfileSampleState extends State<ProfileSample> {
  TextEditingController nameController = TextEditingController()
    ..text = "Rabeeh@vk";

  TextEditingController emailController = TextEditingController()
    ..text = "rabeeh.amk@gmail.com";

  bool checkBoxValue = false;
  bool isButtonDesabled = false;

  final image =  "https://www.api.viknbooks.com/media/profiles/image_27.png";
  final constantImage = "https://icon-library.com/images/unknown-person-icon/unknown-person-icon-4.jpg";


  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(

        padding: EdgeInsets.only(left: mWidth * .35, right: mWidth * .35),
        height: mHeight,
        width: mWidth,
        color: Colors.white,
        child: Card(
          elevation: 10,
          //padding: EdgeInsets.only(left: mWidth * .35, right: mWidth * .35),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: mHeight * .01,
                ),
                Container(
                  height: mHeight * .18,
                  width: mWidth * .15,
                  decoration: BoxDecoration(
                   //   color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                         image.isNotEmpty ? image : constantImage
                          ))),
                ),
                SizedBox(
                  height: mHeight * .05,
                ),
                cardWidget(
                    mWidth: mWidth, mHeight: mHeight, controller: nameController),
                SizedBox(
                  height: mHeight * .01,
                ),
                cardWidget(
                    mWidth: mWidth, mHeight: mHeight, controller: emailController),
                SizedBox(
                  height: mHeight * .01,
                ),
                Card(
                  elevation: 5,
                  child: Container(
                      color: const Color(0xffF1F1F1),
                      width: mWidth * .95,
                      height: mHeight * .15,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                            "if it's been less than 30 days since you initiated the deletion,"
                                " you can cancel your account deletion. After 30 days, your account and all your information will be permanently deleted, "
                                "and you won't be able to retrieve your information",style: TextStyle(fontWeight: FontWeight.bold),),
                      )),
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.red,
                      value: isButtonDesabled,
                      onChanged: (value) {
                        setState(() {
                          isButtonDesabled = value!;
                        });
                      },
                    ),
                    const Text("I have read and accept terms and conditions.")
                  ],
                ),
                SizedBox(
                  height: mHeight * .1,
                ),
                AbsorbPointer(
                  absorbing: isButtonDesabled,
                  child: SizedBox(
                      height: mHeight * .08,
                      width: mWidth * .3,
                      child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(
                                  backgroundColor:isButtonDesabled ? Colors.red : Colors.red.shade200
                              ),
                              onPressed: isButtonDesabled ? () {

                              } : null,
                          child: const Text("Deactivate Account"))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class cardWidget extends StatelessWidget {
  const cardWidget({
    super.key,
    required this.mWidth,
    required this.mHeight,
    required this.controller,
  });

  final double mWidth;
  final double mHeight;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          color: const Color(0xffF2F2F2),
          width: mWidth * .95,
          //height: mHeight*.1,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: const TextStyle(fontWeight: FontWeight.w500),
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          )),
    );
  }
}
