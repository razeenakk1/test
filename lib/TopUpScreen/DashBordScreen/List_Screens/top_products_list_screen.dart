import 'package:flutter/material.dart';

import '../../Constens/constens.dart';
import '../../Widgets/appbar_widget.dart';
import '../../Widgets/search_widget.dart';

class TopProductsListScreen extends StatelessWidget {
  TopProductsListScreen({Key? key}) : super(key: key);
 final TextEditingController searchController = TextEditingController();

  final topCustomersCountList = [
    " 9,100.00",
    " 9,130.00",
    " 8,100.00",
    " 8,100.00",
    " 8,100.00",
  ];

  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar(appBarTitle: "Top Products"),
      backgroundColor:backGroundColor,
      body: Container(
          padding: EdgeInsets.only(
              left: mWidth * .02, right: mWidth * .02),
          height: mHeight,
          decoration: containerDecoration,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(height: mHeight * .01),
              Container(
                  padding: EdgeInsets.only(
                      top: mHeight * .01, bottom: mHeight * .01),
                  child: SearchFieldWidget(
                    mHeight: mHeight,
                    hintText: 'Search',
                    controller: searchController,
                  )),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      // color: Color(0xffF2F2F2),
                      elevation: 0,
                      child: Container(
                        height: mHeight * .12,
                        width: mWidth * .4,
                        decoration: BoxDecoration(
                            color: const Color(0xffE9E9E9),
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          leading: Container(
                            padding: EdgeInsets.only(bottom: mHeight * .01),
                            width: mWidth * .15,
                            //color: Colors.red,
                            child: Image.asset(
                                "assets/profile_image/download.png"),
                          ),
                          title: Padding(
                            padding: EdgeInsets.only(top: mHeight * .01),
                            child: const Text(
                              "ID7688",
                              style: TextStyle(color: Color(0xffC73C13)),
                            ),
                          ),
                          subtitle: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Yeezy 380 Alien",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    color: Colors.black),
                              ),
                              Text(
                                "Red",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text("Sold",
                                  style: TextStyle(color: Color(0xff818181))),
                              Text(topCustomersCountList[index],
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900)),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          )),
    );
  }
}
