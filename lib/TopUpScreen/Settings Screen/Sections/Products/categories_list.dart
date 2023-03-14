import 'package:flutter/material.dart';
import '../../../Constens/constens.dart';
import '../../../Functions/floating_action_function.dart';
import '../../../Widgets/appbar_widget.dart';
import '../../../Widgets/search_widget.dart';
import '../../Custom_Commen_Class_BottomSheet/commen_function.dart';
import '../Accounts/Ledgers_Secrion/ledgers_screen.dart';

class CategoryListScreen extends StatelessWidget {
   CategoryListScreen({Key? key}) : super(key: key);
   final CommonBottomSheetClass commonBottomSheetClass = CommonBottomSheetClass();
   final TextEditingController searchController = TextEditingController();

   @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: backGroundColor,
        appBar: appBar(
            appBarTitle: 'Categories'),
        body: Container(
          padding: EdgeInsets.only(left: mWidth * .02, right: mWidth * .02),
          height: mHeight,
          decoration: containerDecoration,
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
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                      // edit page navigation
                      },
                      child: Card(
                        elevation: 0,
                        child: Container(

                          height: mHeight * .1,
                          decoration: listPageContainerDecorationVariable,
                          child: Center(
                            child: ListTile(
                              title: Text(particulars[index],
                                style: const TextStyle(fontWeight: FontWeight.bold),),

                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(height: mHeight * .01,),
                                  const Text("Balance", style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff9C9C9C))),
                                  const Text("121.00", style: TextStyle(
                                    fontWeight: FontWeight.bold,))
                                ],
                              ),
                            ),
                          ),

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
              commonBottomSheetClass.settingsBottomSheetFunction(context: context, type: "Category");



            })
    );
  }

}
