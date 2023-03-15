import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constens/constens.dart';
import '../Widgets/appbar_widget.dart';


class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:backGroundColor,
      appBar: appBar(appBarTitle: 'Menu'),
      body: Container(
        padding: EdgeInsets.only(
            left: mWidth * .05, right: mWidth * .05),
        height: mHeight,
        decoration: containerDecoration,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(height:  mHeight * .02),
            MenuTitleWidget(
              text: "Inventory",
              mHeight: mHeight,
            ),
            MenuSectionsWidget(
              mHeight: mHeight,
              mWidth: mWidth,
              imageWidget: Image.asset("assets/Menu/Group 58.png"),
              text: 'Products',
              textOnTap: () {},
              buttonOnPressed: () {
              },
            ),
            MenuSectionsWidget(
              mHeight: mHeight,
              mWidth: mWidth,
              imageWidget: Image.asset("assets/Menu/Group 59.png"),
              text: 'Stock Update',
              textOnTap: () {},
              buttonOnPressed: () {

              },
            ),
            MenuTitleWidget(
              text: "Sales",
              mHeight: mHeight,
            ),
            MenuSectionsWidget(
              mHeight: mHeight,
              mWidth: mWidth,
              imageWidget: Image.asset("assets/Menu/Group 60.png"),
              text: 'Sales',
              textOnTap: () {},
              buttonOnPressed: () {

              },
            ),
            MenuSectionsWidget(
              mHeight: mHeight,
              mWidth: mWidth,
              imageWidget: Image.asset("assets/Menu/Group 61.png"),
              text: 'Sales Return',
              textOnTap: () {},
              buttonOnPressed: () {

              },
            ),
            MenuTitleWidget(
              text: "Purchase",
              mHeight: mHeight,
            ),
            MenuSectionsWidget(
              mHeight: mHeight,
              mWidth: mWidth,
              imageWidget: Image.asset("assets/Menu/Group 62.png"),
              text: 'Purchase',
              textOnTap: () {},
              buttonOnPressed: () {

              },
            ),
            MenuSectionsWidget(
              mHeight: mHeight,
              mWidth: mWidth,
              imageWidget: Image.asset("assets/Menu/Group 63.png"),
              text: 'Purchase Return',
              textOnTap: () {},
              buttonOnPressed: () {

              },
            ),
            MenuTitleWidget(
              text: "Finance",
              mHeight: mHeight,
            ),
            MenuSectionsWidget(
              mHeight: mHeight,
              mWidth: mWidth,
              imageWidget: Image.asset("assets/Menu/Group 64.png"),
              text: 'Payment',
              textOnTap: () {
              },
              buttonOnPressed: () {

              },
            ),
            MenuSectionsWidget(
              mHeight: mHeight,
              mWidth: mWidth,
              imageWidget: Image.asset("assets/Menu/Group 65.png"),
              text: 'Receipts',
              textOnTap: () {},
              buttonOnPressed: () {

              },
            ),
            MenuSectionsWidget(
              mHeight: mHeight,
              mWidth: mWidth,
              imageWidget: Image.asset("assets/Menu/Group 66.png"),
              text: 'Expenses',
              textOnTap: () {},
              buttonOnPressed: () {

              },
            ),
            MenuTitleWidget(
              text: "Promotion", mHeight: mHeight,
            ),
            MenuSectionsWidget(
              mHeight: mHeight,
              mWidth: mWidth,
              imageWidget: Image.asset("assets/Menu/card-image.png"),
              text: 'Ad Banners',
              textOnTap: () {},
              buttonOnPressed: () {

              },
            ),
          ],
        ),
      ),
    );
  }
}

class MenuSectionsWidget extends StatelessWidget {
  const MenuSectionsWidget({
    super.key,
    required this.mHeight,
    required this.mWidth,
    required this.imageWidget,
    required this.text,
    required this.textOnTap,
    required this.buttonOnPressed,
  });

  final double mHeight;
  final double mWidth;
  final Widget imageWidget;
  final String text;
  final Function() textOnTap;
  final Function() buttonOnPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mHeight * .1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: mHeight * .08,
            width: mWidth * .15,
            decoration: BoxDecoration(
                color: const Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(10)),
            child: imageWidget,
          ),
          SizedBox(
            width: mWidth * .02,
          ),

          GestureDetector(
            onTap: textOnTap,
            child: SizedBox(
              width: mWidth*.5,
             height: mHeight*.05,
            // color: Colors.blue,
              child: Container(
                padding: EdgeInsets.only(top: mHeight*.01),
                child: Text(
                  text,
                  style:GoogleFonts.poppins(textStyle: const   TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),),
                ),
              ),
            ),
          ),
          SizedBox(
            width: mWidth * .08,
          ),
          IconButton(
              onPressed: buttonOnPressed,
              icon: Image.asset("assets/Add_icon/plus-circle-line.png",height: mHeight*.035 ,fit: BoxFit.fill,)),
        ],
      ),
    );
  }
}

class MenuTitleWidget extends StatelessWidget {
  const MenuTitleWidget({
    super.key,
    required this.text, required this.mHeight,
  });
  final double mHeight;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: mHeight*.01,bottom: mHeight*.01),
      child: Text(
        text,
      style:GoogleFonts.poppins(textStyle: const  TextStyle(fontSize: 18, fontWeight: FontWeight.w900),),
      ),
    );
  }
}
