import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Constens/constens.dart';
import '../Widgets/appbar_widget.dart';
import 'Custom_Commen_Class_BottomSheet/commen_function.dart';
import 'Sections/Accounts/DeliveryManScreen/add_deliverman_screen.dart';
import 'Sections/Accounts/DeliveryManScreen/deliveryman_screen.dart';
import 'Sections/Accounts/Ledgers_Secrion/create_ledger_screen.dart';
import 'Sections/Accounts/Ledgers_Secrion/ledgers_screen.dart';
import 'Sections/Location/area_list_screen.dart';
import 'Sections/Products/categories_list.dart';
import 'Sections/Products/groups_list_screen.dart';
import 'Sections/TaxScreen/Class/tax_bottom_sheet_class.dart';
import 'Sections/TaxScreen/tax_list_screeen.dart';
import 'Sections/UserSection/Users/add_user_screen.dart';
import 'Sections/UserSection/Users/user_list_screen.dart';
import 'Sections/UserSection/userRoleSection/add_user_role_screen.dart';
import 'Sections/UserSection/userRoleSection/user_role_list_screen.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  final TaxBottomSheetClass taxBottomSheetClass = TaxBottomSheetClass();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final CommonBottomSheetClass commonBottomSheetClass = CommonBottomSheetClass();

  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: scaffoldKey,
      // resizeToAvoidBottomInset : false,
      backgroundColor: const Color(0xffF2F2F2),
      appBar: appBar(appBarTitle: 'Settings'),
      body: Container(
        padding: EdgeInsets.only(
            left: mWidth * .05,),
        height: mHeight,
        decoration: containerDecoration,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(height: mHeight * .01),
            SectionOneWidget(
              mWidth: mWidth,
              mHeight: mHeight,
              image: Image.asset(
                "assets/settingsimage/tax.png",
                height: 15,
              ),
              title: 'Tax',
              subTitle: 'TAX Types',
              onTap: () {
                taxBottomSheetClass.taxModelBottomSheet(
                  context: context);

              },
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TaxListScreen()),
                );
              },
            ),
            SectionTwoWidget(
              onTapp: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  CreateLedgerScreen(type: 'Create',)),
                );
              },
              mWidth: mWidth,
              mHeight: mHeight,
              image: Image.asset(
                "assets/settingsimage/accounts.png",
                height: 20,
              ),
              title: 'Accounts',
              subTitle: 'Ledgers',
              subTitle1: "Delivery man",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LedgersScreen()),
                );
              },
              onPressedd: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeliveryMan()),
                );
              },
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddDeliveryManScreen()),
                );
              },
            ),
            SectionTwoWidget(
              mWidth: mWidth,
              mHeight: mHeight,
              image: Image.asset(
                "assets/settingsimage/products.png",
                height: 20,
              ),
              title: 'Products',
              subTitle: 'Categories',
              subTitle1: "Groups",
              onPressed: () {
                // category list navigation onPressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryListScreen()),
                );
              },
              onPressedd: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GroupListScreen()),
                );
              },
              onTap: () {
                commonBottomSheetClass.settingsBottomSheetFunction(
                    context: context, type: "Group");
              },
              onTapp: () {
                // onTap for category
                commonBottomSheetClass.settingsBottomSheetFunction(
                    context: context,
                    type: "Category",
                    );
              },
            ),
            SectionTwoWidget(
                mWidth: mWidth,
                mHeight: mHeight,
                image: const Icon(
                  Icons.person_3_rounded,
                  color: Color(0xff707070),
                ),
                title: "Users",
                subTitle: "Users",
                subTitle1: "User Roles",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  UserListScreen()),
                  );
                },
                onPressedd: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  UserRoleListScreen()),
                  );
                },
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddUserRoleScreen()),
                  );
                },
                onTapp: () {
                  // navigation for user screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddUserScreen()),
                  );
                }),
            SectionOneWidget(
              mWidth: mWidth,
              mHeight: mHeight,
              image: const Icon(Icons.my_location_rounded,
                  color: Color(0xff707070)),
              title: 'Location',
              subTitle: 'Areas',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AreaListScreen()),
                );
              },
              onTap: () {
                //   areaBottomSheetClass.areaBottomSheetFunction(context: context, type: 1);
                commonBottomSheetClass.settingsBottomSheetFunction(
                    context: context, type: "Area",);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTwoWidget extends StatelessWidget {
  SectionTwoWidget({
    super.key,
    required this.mWidth,
    required this.mHeight,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.subTitle1,
    required this.onPressed,
    required this.onPressedd,
    required this.onTap,
    required this.onTapp,
  });

  final double mWidth;
  final double mHeight;

  final Widget image;
  final String title;
  final String subTitle;
  final String subTitle1;
  final Function() onPressed;
  final Function() onPressedd;
  final Function() onTap;
  final Function() onTapp;

  final addButton = Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50.0)),
        border: Border.all(color: const Color(0xffB53211)),
      ),
      child: const Icon(
        Icons.add,
        color: Color(0xffB53211),
      ));

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 30, top: 10, bottom: 10),
      // color: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              image,
              SizedBox(
                width: mWidth * .01,
              ),
              SizedBox(
                width: mWidth * .02,
              ),
              Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xff000000)),
              ),
            ],
          ),
          SizedBox(
            height: mHeight * .02,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //  SizedBox(width: mWidth*.01,),
                  InkWell(
                    onTap: onPressed,
                    child: Container(
                        padding:  EdgeInsets.only(top: mHeight*.01,left: mWidth*.075),
                     // color: Colors.yellow,
                        width: mWidth*.62,
                        height: mHeight*.05,
                        child: Text(
                          subTitle,
                            style:GoogleFonts.poppins(textStyle: const  TextStyle(
                              color: Color(0xff707070),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )),
                    )),

                  InkWell(
                    onTap: onTapp,
                    child: AddIconButton(mHeight: mHeight, mWidth: mWidth),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //  SizedBox(width: mWidth*.01,),
                  InkWell(
                    onTap: onPressedd,
                    child: Container(
                        padding:  EdgeInsets.only(top: mHeight*.01,left: mWidth*.075),
                        child: Text(
                          subTitle1,
                            style:GoogleFonts.poppins(textStyle: const  TextStyle(
                              color: Color(0xff707070),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )),
                    )),

                  InkWell(
                    onTap: onTap,
                    child: AddIconButton(mHeight: mHeight, mWidth: mWidth),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SectionOneWidget extends StatelessWidget {
  SectionOneWidget({
    super.key,
    required this.mWidth,
    required this.mHeight,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed,
    this.onTap,
  });

  final double mWidth;
  final double mHeight;
  final Widget image;
  final String title;
  final String subTitle;
  final Function() onPressed;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 30, top: 10, bottom: 10),
      // color: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              image,
              SizedBox(
                width: mWidth * .02,
              ),
              Text(
                title,
                style:GoogleFonts.poppins(textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xff000000)),
                ) ),
            ],
          ),
          SizedBox(
            height: mHeight * .01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //  SizedBox(width: mWidth*.01,),
              InkWell(
                onTap: onPressed,
                child: Container(
                //    color: Colors.blue,
                    width: mWidth*.62,
                   height: mHeight*.05,
                    padding:  EdgeInsets.only(top: mHeight*.01,left: mWidth*.075),
                    child: Text(
                        subTitle,textAlign: TextAlign.start,
                        style:GoogleFonts.poppins(textStyle: const  TextStyle(
                            color: Color(0xff707070),
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                        ) ),
                ),
              ),
              InkWell(
                onTap: onTap,
                child: AddIconButton(mHeight: mHeight, mWidth: mWidth),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class AddIconButton extends StatelessWidget {
  const AddIconButton({
    super.key,
    required this.mHeight,
    required this.mWidth,
  });

  final double mHeight;
  final double mWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: mWidth*.02),
      height: mHeight*.05,
        width: mWidth*.2,
        decoration: BoxDecoration(
         // color: Colors.green,
          image: DecorationImage(
              scale: 1.4,
            image: AssetImage("assets/Add_icon/plus-circle-line.png",)
          )
        ),
        // child: Image.asset("assets/Add_icon/plus-circle-line.png",width: mWidth*.06,height: mHeight*.06,)
    );
  }
}

