import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constens/constens.dart';
import '../../Widgets/appbar_widget.dart';
import '../../Widgets/search_widget.dart';



class StockFinderScreen extends StatelessWidget {
   StockFinderScreen({Key? key}) : super(key: key);

 final TextEditingController searchController = TextEditingController();

 final String productId = "Product ID";

  final List images = [
    "assets/settingsimage/password.png",
    "assets/settingsimage/accounts.png",
    "assets/settingsimage/reloadicon.png",
  ];

  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backGroundColor,
      appBar: appBar(
          automaticallyImplyLeading: false,
          appBarTitle: 'Stock Finder',
          actions: [
            IconButtonWidget(icon:  Icons.close, onPressed: () {
              Navigator.pop(context);
            },)
          ]),
      body: Container(

        height: mHeight,
        decoration: containerDecoration,
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(height: mHeight * .02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    width: mWidth * .75,
                    child: SearchFieldWidget(
                      // onChanged: (value){
                      //   productIdFunction();
                      // },
                      mHeight: mHeight,
                      hintText: 'Product ID',
                      controller: searchController,

                    )),
                SizedBox(
                  width: mWidth * .1,
                  //color: Colors.grey,
                  child: IconButtonWidget(icon:  Icons.arrow_forward, onPressed: () {

                  },)
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: mHeight * .02),
             // color: Colors.orange,
              height: mHeight * .13,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SearchProductDetailsWidget(
                    text: productId,
                    textColor: Colors.blue,
                    fontSize: 13,
                    text1: 'Yeezy Boost 350 v2',
                    text1Color: Colors.black,
                    text1fontSize: 20,
                    fontWeighText1: FontWeight.w800,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  SizedBox(
                    width: mWidth * .02,
                  ),
                  const SearchProductDetailsWidget(
                    text: 'Available',
                    textColor: Colors.grey,
                    fontSize: 15,
                    text1: '1233',
                    text1Color: Color(0xffDF110A),
                    text1fontSize: 20,
                    fontWeighText1: FontWeight.w900,
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ),
                ],
              ),
            ),
            SizedBox(height: mHeight*.02,),
            SizedBox(
              height: mHeight * .3,
              //   color: Colors.grey,
              child: CarouselSlider.builder(
                  options: CarouselOptions(
                    height: mHeight * .4,
                    aspectRatio: 2.0,
                    viewportFraction: 0.6,
                    initialPage: 0,
                    disableCenter: false,
                   // enlargeCenterPage: false,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false,
                   // autoPlayInterval: const Duration(seconds: 3),
                    // autoPlayAnimationDuration:
                    //     const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  itemCount: images.length,
                  itemBuilder:
                      (BuildContext context, int index, int pageViewIndex) =>
                          Container(
                           // margin: EdgeInsets.only(left: mWidth*.01,right: mWidth*.01),
                              height: MediaQuery.of(context).size.height * .29,
                              width: MediaQuery.of(context).size.width * .90,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(.5),
                                  image: DecorationImage(
                                      image: AssetImage(
                                        images[index]
                                      ),
                                      ),

                                  borderRadius: BorderRadius.circular(20)
                              ),
                          )
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ColorAndSizeWidget(mWidth: mWidth, mHeight: mHeight);
                })
          ],
        ),
      ),
    );
  }
}

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key, required this.icon, required this.onPressed,
  });
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon:  Icon(
         icon,
          size: 30,
          weight: 30,
        ));
  }
}

class ColorAndSizeWidget extends StatelessWidget {
  const ColorAndSizeWidget({
    super.key,
    required this.mWidth,
    required this.mHeight,
  });

  final double mWidth;
  final double mHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height: mHeight * .15,
      // color: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(left: mWidth * .03),
              child:  Text("Red",
                  style:GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900)))),
          SizedBox(
            height: mHeight * .1,
            // color: Colors.orange,
            child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffF5F5F5),
                          borderRadius: BorderRadius.circular(15)),
                      width: mWidth * .16,
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "4",
                        style:GoogleFonts.poppins(textStyle: const  TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                        ) ),
                          Text(
                            "10",
                            style:GoogleFonts.poppins(textStyle: const TextStyle(
                                fontSize: 12, color: Color(0xffC93D14)),)
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class SearchProductDetailsWidget extends StatelessWidget {
  const SearchProductDetailsWidget({
    super.key,
    required this.text,
    required this.textColor,
    required this.fontSize,
    required this.text1,
    required this.text1Color,
    required this.text1fontSize,
    required this.fontWeighText1,
    required this.crossAxisAlignment,
  });

  final String text;
  final Color textColor;
  final double fontSize;
  final String text1;
  final Color text1Color;
  final double text1fontSize;
  final FontWeight fontWeighText1;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          text,
      style:GoogleFonts.poppins(textStyle:   TextStyle(color: textColor, fontSize: fontSize),)
        ),
        Text(
          text1,
        style:GoogleFonts.poppins(textStyle:   TextStyle(
              color: text1Color,
              fontWeight: fontWeighText1,
              fontSize: text1fontSize),)
        ),
      ],
    );
  }
}
