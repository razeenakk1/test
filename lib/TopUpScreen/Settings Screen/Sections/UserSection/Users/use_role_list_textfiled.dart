import 'package:flutter/material.dart';
import '../../../../Constens/constens.dart';
import '../../../../Widgets/appbar_widget.dart';
import '../../../../Widgets/search_widget.dart';

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
    return Scaffold(
      appBar: appBar(appBarTitle: ""),
      backgroundColor:backGroundColor,
      body: Container(
        padding: const EdgeInsets.all(10),
        height: mHeight,
        decoration: containerDecoration,
        child: ListView(
          children: [
            SizedBox(
              height: mHeight * .01,
            ),
            SearchFieldWidget(
              mHeight: mHeight,
              hintText: 'Search',
              controller: searchController,
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              height: mHeight * .8,
              child: ListView.builder(
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
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
