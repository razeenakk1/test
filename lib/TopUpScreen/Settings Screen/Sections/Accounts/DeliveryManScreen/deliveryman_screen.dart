import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Constens/constens.dart';
import '../../../../Functions/floating_action_function.dart';
import '../../../../Widgets/appbar_widget.dart';
import '../../../../Widgets/search_widget.dart';
import '../Ledgers_Secrion/ledgers_screen.dart';
import 'add_and_edit_deliverman_screen.dart';



class DeliveryMan extends StatelessWidget {
   DeliveryMan({Key? key}) : super(key: key);

  final purpose = [
    "Assets",
    "Bank",
    "Expense",
    "Customer",
    "Supplier",
  ];
   final TextEditingController searchController = TextEditingController();


   @override
  Widget build(BuildContext context) {
     final mHeight = MediaQuery.of(context).size.height;
     final mWidth = MediaQuery.of(context).size.width;

     return Scaffold(
       resizeToAvoidBottomInset: false,

      backgroundColor: backGroundColor,

      appBar: appBar(
          appBarTitle: 'Delivery man'),
      body: Container(
        padding: EdgeInsets.only(left: mWidth * .02, right: mWidth * .02),
        height: mHeight,
        decoration:containerDecoration,
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(height: mHeight * .02),
            SearchFieldWidget(

              mHeight: mHeight,
              hintText: 'Search',
              controller: searchController,
            ),
            SizedBox(height: mHeight * .01),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (BuildContext context ,int index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  AddAndEditDeliveryMan(type: 'Edit',)));
                    },
                    child: Card(
                      elevation: 0,
                      child: Container(

                        height: mHeight*.1,
                        decoration: listPageContainerDecorationVariable,
                        child: ListTile(
                          title: Text(particulars[index],style: GoogleFonts.poppins(textStyle:   const TextStyle(fontWeight: FontWeight.bold),)),
                          subtitle: Text(purpose[index],style: GoogleFonts.poppins(textStyle:  const TextStyle(fontWeight: FontWeight.bold,color: Color(0xffB73312)))),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(height: mHeight*.01,),
                               Text("Balance",style: GoogleFonts.poppins(textStyle: const  TextStyle(fontWeight: FontWeight.bold,color: Color(0xff9C9C9C)))),
                               Text("121.00",style: GoogleFonts.poppins(textStyle: const TextStyle(fontWeight: FontWeight.bold,)))
                            ],
                          ),
                        ),

                      ),
                    ),
                  );

                }),
          ],
        ),
      ),
        floatingActionButton: floatingActionButton(context: context, color: const Color(0xffB73312), icon: Icons.add, onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  AddAndEditDeliveryMan(type: 'Add',)),
          );
        })
    );


  }
}
