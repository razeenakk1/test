import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Constens/constens.dart';
import '../../../../Functions/floating_action_function.dart';
import '../../../../Widgets/appbar_widget.dart';
import '../../../../Widgets/search_widget.dart';
import '../userRoleSection/add_and_edit_user_role_screen.dart';

class UseRoleListScreen extends StatelessWidget {
  UseRoleListScreen({Key? key}) : super(key: key);
  final particulars = [
    "Accountant",
    "SBI",
    "Rent",
    "Supplier",
    "Customer",
  ];
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar(appBarTitle: ""),
      backgroundColor:backGroundColor,
      body: Container(
        padding: EdgeInsets.only(left: mWidth * .02, right: mWidth * .02),
        height: mHeight,
        decoration: containerDecoration,
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: mHeight * .01,
            ),
            SearchFieldWidget(
              mHeight: mHeight,
              hintText: 'Search',
              controller: searchController,
            ),
            SizedBox(
              height: mHeight * .01,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      var items = [
                        "Accountant",
                        "SBI",
                        "Rent",
                        "Supplier",
                        "Customer",
                      ];
                      var groupId = [
                        1,
                        2,
                        3,
                        4,
                        5,
                      ];

                      Navigator.pop(context, [items[index], groupId[index]]);
                    },
                    child: Card(
                      elevation: 0,
                      child: Container(
                        height: mHeight * .05,
                        decoration: BoxDecoration(
                          color: const Color(0xffF5F5F5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              particulars[index],
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold),
                              ))),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
        floatingActionButton: floatingActionButton(context: context,
            color: const Color(0xffB73312),
            icon: Icons.add,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddAndEditUserole(type: 'Add',)),
              );

            })
    );
  }
}
