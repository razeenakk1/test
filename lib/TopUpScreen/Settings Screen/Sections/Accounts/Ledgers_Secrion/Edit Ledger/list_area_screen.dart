import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../Constens/constens.dart';
import '../../../../../Widgets/appbar_widget.dart';
import '../../../../../Widgets/search_widget.dart';

class ListAreaScreeen extends StatelessWidget {
   ListAreaScreeen({Key? key}) : super(key: key);


  final particulars = [
    "Malappuram",
    "Saudi",
    "Dubai",
    "Qatar",
    "Oman",
  ];
  final TextEditingController searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar(appBarTitle: ""),
      backgroundColor: backGroundColor,
      body: Container(
        padding: EdgeInsets.only(left: mWidth * .02, right: mWidth * .02),
        height: mHeight,
        decoration:containerDecoration,
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(height: mHeight*.02,),
            SearchFieldWidget(mHeight: mHeight, hintText: 'Search', controller: searchController,),
            SizedBox(height: mHeight * .01),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: particulars.length,
                itemBuilder: (BuildContext context ,int index){
                  return GestureDetector(
                    onTap: (){
                      var items = [
                        "Malappuram",
                        "Saudi",
                        "Dubai",
                        "Qatar",
                        "Oman",
                      ];
                      var groupId = [
                        1,
                        2,
                        3,
                        4,
                        5,
                      ];
                      print(items[index]);
                      print("${groupId[index]}");
                      Navigator.pop(context, [items[index],groupId[index]],);
                    },

                    child: Card(
                      elevation: 0,
                      child: Container(
                          height: mHeight*.1,
                          decoration: BoxDecoration(
                            color: const Color(0xffF5F5F5),
                            borderRadius: BorderRadius.circular(10),),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Text(particulars[index],textAlign: TextAlign.start,  style: GoogleFonts.poppins(textStyle: const TextStyle(fontWeight: FontWeight.bold),)),

                          ) ),
                    ),
                  );
                }),
          ],
        ),
      ),





    );
  }
}
