import 'package:flutter/material.dart';
import '../../Constens/constens.dart';
import '../../Widgets/appbar_widget.dart';
import '../../Widgets/search_widget.dart';
import '../dash_bord_screen.dart';

class TopCustomersListScreen extends StatelessWidget {
   TopCustomersListScreen({Key? key}) : super(key: key);
 final TextEditingController searchController = TextEditingController();
   final topCustomersList = [
     "Ibraheem Rahman",
     "Amirtha",
     "Athira",
   ];

   final topCustomersPlaceList = [
     "Palakkad",
     "Manjeri",
     "Palakkad",
   ];

   final topCustomersCountList = [
     " 9,100.00",
     " 9,130.00",
     " 8,100.00",
   ];


  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar(appBarTitle: "Top Customers"),
      backgroundColor: backGroundColor,
      body: Container(
        padding: EdgeInsets.only(
            left: mWidth * .02, right: mWidth * .02),
        height: mHeight,
        decoration:containerDecoration,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(height: mHeight * .01),
            Container(
                padding: EdgeInsets.only(top:  mHeight*.01,bottom:  mHeight*.01),
                child: SearchFieldWidget(mHeight: mHeight, hintText: 'Search', controller: searchController,)),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return CardWidget(
                    mHeight: mHeight,
                    mWidth: mWidth,
                    title: topCustomersList[index],
                    subtitle: topCustomersPlaceList[index],
                    trailingTitleOne: 'Purchased',
                    trailingTitleTwo: topCustomersCountList[index],
                  );
                }),


          ],
        ),
      ),

    );
  }
}
