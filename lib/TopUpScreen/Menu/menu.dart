import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constens/constens.dart';
import '../MenuScreen/menu_screen.dart';
import '../Widgets/appbar_widget.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backGroundColor,
      appBar: appBar(appBarTitle: 'Menu'),
      body: Container(
        padding: EdgeInsets.only(
            left: mWidth * .05, right: mWidth * .05, ),
        height: mHeight,
        decoration: containerDecoration,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(height: mHeight * .02,),
            MenuTitleWidget(text: "Inventory", mHeight: mHeight,),
            ContainerWidget(mWidth: mWidth, mHeight: mHeight, title: "Product Report", onPressed: () {  },),
            ContainerWidget(mWidth: mWidth, mHeight: mHeight, title: "Stock adjustment Report", onPressed: () {  },),
            MenuTitleWidget(text: "Sales", mHeight: mHeight,),
            ContainerWidget(mWidth: mWidth, mHeight: mHeight, title: "Sales Report", onPressed: () {  },),
            MenuTitleWidget(text: "Purchase", mHeight: mHeight,),
            ContainerWidget(mWidth: mWidth, mHeight: mHeight, title: "Purchase Report", onPressed: () {  },),
            MenuTitleWidget(text: "Finance", mHeight: mHeight,),
            ContainerWidget(mWidth: mWidth, mHeight: mHeight, title: "Customer Report", onPressed: () {  },),
            ContainerWidget(mWidth: mWidth, mHeight: mHeight, title: "Deliver Report", onPressed: () {  },),
            MenuTitleWidget(text: "Finance", mHeight: mHeight,),
            ContainerWidget(mWidth: mWidth, mHeight: mHeight, title: "Payment/Receipt Report", onPressed: () {  },),
            ContainerWidget(mWidth: mWidth, mHeight: mHeight, title: "Profit and loss account", onPressed: () {  },),
            ContainerWidget(mWidth: mWidth, mHeight: mHeight, title: "Balance Sheet", onPressed: () {  },),
            ContainerWidget(mWidth: mWidth, mHeight: mHeight, title: "Expense Report", onPressed: () {  },),
            ContainerWidget(mWidth: mWidth, mHeight: mHeight, title: "VAT Report", onPressed: () {  },),
          ],
        ),
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.mWidth,
    required this.mHeight, required this.title, required this.onPressed,
  });

  final double mWidth;
  final double mHeight;
  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: mHeight*.01,bottom: mHeight*.01 ),
      child: GestureDetector(
        onTap: onPressed(),
        child: Container(
          padding: EdgeInsets.only(left: mWidth*.05,right: mWidth*.05),
          height: mHeight*.08,
          decoration: BoxDecoration(
              color:  const Color(0xffF2F2F2),

              borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style:GoogleFonts.poppins(textStyle:  const TextStyle(fontWeight: FontWeight.bold),)),
              const Icon(Icons.arrow_forward_ios,size: 10,color: Colors.black,)
            ],
          ),


        ),
      ),
    );
  }
}
