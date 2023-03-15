import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topuptest/TopUpScreen/DashBordScreen/SearchScreen/search_screen.dart';
import 'package:topuptest/TopUpScreen/ProfileScreen/profile_screen.dart';
import '../Constens/constens.dart';
import '../Functions/exitbuttonfunction.dart';
import '../Functions/floating_action_function.dart';
import 'List_Screens/top_customers_screen.dart';
import 'List_Screens/top_products_list_screen.dart';

class DashBordScreen extends StatelessWidget {
  DashBordScreen({Key? key}) : super(key: key);
  String dropDownValue = 'This Month';
  String dropDownValueOne = 'This Month';
  String dropDownValueTwo = 'This Month';
  String dropDownValueThree = 'This Month';

 final String name = "Savad Farooque";

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

 final List<Color> colors = [
    const Color(0xffFFF1DB),
    const Color(0xffE6F5E6),
    const Color(0xffE9E9E9),
  ];



 final String thisMonth = "This Month";

 final String orderStatus = "This Month";

final  bool isTrue = false;



  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: backGroundColor,
        appBar: AppBar(
          backgroundColor: backGroundColor,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(mHeight * .06),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(


                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Text(
                        "Hello,",
                        style:GoogleFonts.poppins(textStyle: const
                            TextStyle(fontSize: 15, color: Color(0xffA1A1A1))),
                      ),
                      Text(
                        name,
                        textAlign: TextAlign.end,
                        style:GoogleFonts.poppins(textStyle: const TextStyle(
                        color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w900),
                        )
                      )
                    ],
                  ),
                  SizedBox(
                    width: mWidth * .19,
                  ),
                  AppBarButtonWidget(
                      mHeight: mHeight,
                      mWidth: mWidth,
                      onPressed: () {
                        exitBtn(context);
                      },
                      widget: Image.asset(
                        "assets/LogoutImage/logout.png",
                      )),
                  SizedBox(
                    width: mWidth * .02,
                  ),
                  AppBarButtonWidget(
                    mHeight: mHeight,
                    mWidth: mWidth,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileScreen()),
                      );
                    },
                    widget: Image.asset("assets/profile_image/download.png"),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(
              left: mWidth * .03, right: mWidth * .03),
          height: mHeight,
          // color: Colors.blue,
          decoration: containerDecoration,
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(height: mHeight * .02),
              MainTitleWidget(
                mHeight: mHeight,
                mWidth: mWidth,
                text: 'Analytics',
                dropDownValue: dropDownValue,
                type: 1,
              ),
              Container(
                padding:
                    EdgeInsets.only(top: mHeight * .01, bottom: mHeight * .01),
                height: mHeight * .45,

                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    AnalyticsSectionContainer(
                      mWidth: mWidth,
                      mHeight: mHeight,
                      backgroundCircleAvatarColor: const Color(0xff327152),
                      text: 'Total Sales',
                      text1: '\$ 56,000,000.00',
                      colorPercentage: const Color(0xffB0F6C8),
                      onPressed: () {},
                      buttonText: 'Add Sales',
                      buttonColor: const Color(0xff327152),
                      percentageTextColor: Colors.green,
                      percentageText: '56%',
                      assetImage: 'assets/DashBordImage/Group 1167.png',
                    ),
                    AnalyticsSectionContainer(
                      mWidth: mWidth,
                      mHeight: mHeight,
                      backgroundCircleAvatarColor: const Color(0xffD17702),
                      text: 'Total Purchase',
                      text1: '\$ 45,000,000.00',
                      colorPercentage: const Color(0xffFFAFAC),
                      onPressed: () {},
                      buttonText: 'Add Purchase',
                      buttonColor: const Color(0xffD17702),
                      percentageTextColor: Colors.red,
                      percentageText: '56%',
                      assetImage: 'assets/DashBordImage/Group 1168.png',
                    ),
                    AnalyticsSectionContainer(
                      mWidth: mWidth,
                      mHeight: mHeight,
                      backgroundCircleAvatarColor: const Color(0xffC73C13),
                      text: 'Total Expense',
                      text1: '\$ 56,000,000.00',
                      colorPercentage: const Color(0xffB0F6C8),
                      onPressed: () {},
                      buttonText: 'Add Expense',
                      buttonColor: const Color(0xffC73C13),
                      percentageTextColor: Colors.green,
                      percentageText: '56%',
                      assetImage: 'assets/DashBordImage/Group 1169.png',
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: mHeight * .01),
                height: mHeight * .19,
                width: mWidth * .8,
                decoration: BoxDecoration(
                    color: const Color(0xffE6F5E6),
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            backgroundColor: Color(0xff2A912A),
                            radius: 20,
                            child: Icon(Icons.attach_money),
                          ),
                          SizedBox(
                            width: mWidth * .3,
                            // color: Colors.red,
                            child: Column(
                              children: [
                                 Text("Total Profit",
                              style:GoogleFonts.poppins(textStyle: const  TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 18)),),
                                ThisMonthWidget(
                                  mHeight: mHeight,
                                  mWidth: mWidth,
                                  color: const Color(0xffC6DEC6),
                                  //   onPressed: () {},
                                  textColor: Colors.green,
                                  type: 3,
                                  dropDownValue: dropDownValueOne,
                                  // textName: 'this month',
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: mWidth * .4,
                            height: mHeight * .07,
                            //color: Colors.green,
                            child: Image.asset(
                              "assets/DashBordImage/Group 1170.png",
                              fit: BoxFit.fitWidth,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                           Text('\$ 45,000,000.00',
                            style:GoogleFonts.poppins(textStyle: const  TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 18)),),
                          SizedBox(
                            width: mWidth * .02,
                          ),
                          Container(
                              height: mHeight * .033,
                              width: mWidth * .1,
                              decoration: BoxDecoration(
                                  color: const Color(0xffB0F6C8),
                                  borderRadius: BorderRadius.circular(15)),
                              child:  Center(
                                  child: Text(
                                "56%",
                                      style:GoogleFonts.poppins(textStyle: const  TextStyle(
                                    color: Colors.green, fontSize: 13),
                                      )))),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              MainTitleWidget(
                mHeight: mHeight,
                mWidth: mWidth,
                text: 'Order Status',
                dropDownValue: dropDownValueTwo,
                type: 2,
                // onPressed: () {
                //   //alertBoxOrderStatus(context);
                // },
                //textName: orderStatus,
              ),
              SizedBox(
                height: mHeight * .13,
                //  color: Colors.brown,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    OrderStatusContainerWidget(
                      mWidth: mWidth,
                      colors: const Color(0xffD2F0F5),
                      orderStatusText: 'Orders',
                      orderStatusCount: '123',
                      orderStatusTextColor: const Color(0xff006070),
                      mHeight: mHeight,
                    ),
                    OrderStatusContainerWidget(
                      mWidth: mWidth,
                      colors: const Color(0xffFFF1DB),
                      orderStatusText: 'Pending',
                      orderStatusCount: '72',
                      orderStatusTextColor: const Color(0xff7E4E02),
                      mHeight: mHeight,
                    ),
                    OrderStatusContainerWidget(
                      mWidth: mWidth,
                      colors: const Color(0xffD9FFEB),
                      orderStatusText: 'Delivered',
                      orderStatusCount: '51',
                      orderStatusTextColor: const Color(0xff005729),
                      mHeight: mHeight,
                    ),
                  ],
                ),
              ),
              HeadingTitleWidget(
                text: 'Top Products',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TopProductsListScreen()),
                  );
                },
              ),
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
                            color: colors[index],
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
                            child:  Text(
                              "ID7688",
                    style:GoogleFonts.poppins(textStyle: const  TextStyle(color: Color(0xffC73C13)),
                            ),
                          ),
                          ),
                          subtitle:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              Text(
                                "Yeezy 380 Alien",
                    style:GoogleFonts.poppins(textStyle: const  TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15,
                                    color: Colors.black),)
                              ),
                              Text(
                                "Red",
                                style:GoogleFonts.poppins(textStyle: const  TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),)
                              ),
                            ],
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                               Text("Sold",
                            style:GoogleFonts.poppins(textStyle: const  TextStyle(color: Color(0xff818181))),),
                              Text(topCustomersCountList[index],
                                style:GoogleFonts.poppins(textStyle: const  TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900)),)
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
              HeadingTitleWidget(
                text: 'Top Customers',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TopCustomersListScreen()),
                  );
                },
              ),
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
        floatingActionButton: floatingActionButton(
            context: context,
            color: const Color(0xffB73312),
            icon: Icons.search,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StockFinderScreen()),
              );
            }));
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.mHeight,
    required this.mWidth,
    required this.title,
    required this.subtitle,
    required this.trailingTitleOne,
    required this.trailingTitleTwo,
  });

  final double mHeight;
  final double mWidth;
  final String title;
  final String subtitle;
  final String trailingTitleOne;
  final String trailingTitleTwo;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        height: mHeight * .11,
        width: mWidth * .4,
        decoration: BoxDecoration(
            color: const Color(0xffF2F2F2),
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Padding(
            padding: EdgeInsets.only(top: mHeight * .02),
            child: Text(
              title,
    style:GoogleFonts.poppins(textStyle: const  TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
            ),
          ),),
          subtitle: Text(
            subtitle,
    style:GoogleFonts.poppins(textStyle: const  TextStyle(color: Color(0xff818181),fontWeight: FontWeight.w700),)
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                trailingTitleOne,
            style:GoogleFonts.poppins(textStyle: const  TextStyle(color: Color(0xff818181),fontWeight: FontWeight.w700),
              ),
              ),
              Text(trailingTitleTwo,
                style:GoogleFonts.poppins(textStyle: const TextStyle (
                      fontSize: 16, fontWeight: FontWeight.w900)),),
            ],
          ),
        ),
      ),
    );
  }
}

class HeadingTitleWidget extends StatelessWidget {
  const HeadingTitleWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
        style:GoogleFonts.poppins(textStyle: const  TextStyle(fontWeight: FontWeight.w900, fontSize: 21),)
          ),
          TextButton(
              onPressed: onPressed,
              child:  Text(
                "View All",
                  style:GoogleFonts.poppins(textStyle: const  TextStyle(color: Color(0xff08589E)),)
              ))
        ],
      ),
    );
  }
}

class OrderStatusContainerWidget extends StatelessWidget {
  const OrderStatusContainerWidget({
    super.key,
    required this.mWidth,
    required this.colors,
    required this.orderStatusText,
    required this.orderStatusCount,
    required this.orderStatusTextColor,
    required this.mHeight,
  });

  final double mWidth;
  final double mHeight;
  final Color colors;

  final String orderStatusText;
  final Color orderStatusTextColor;
  final String orderStatusCount;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        margin: EdgeInsets.only(bottom: mHeight * .01),
        //  height: mHeight*.03,
        width: mWidth * .29,

        decoration: BoxDecoration(
            color: colors, borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                orderStatusText,
            style:GoogleFonts.poppins(textStyle:   TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: orderStatusTextColor),
              ),),
              Text(
                orderStatusCount,
                style:GoogleFonts.poppins(textStyle: const   TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnalyticsSectionContainer extends StatelessWidget {
  const AnalyticsSectionContainer({
    super.key,
    required this.mWidth,
    required this.mHeight,
    required this.backgroundCircleAvatarColor,
    required this.text,
    required this.text1,
    required this.colorPercentage,
    required this.onPressed,
    required this.buttonText,
    required this.buttonColor,
    required this.percentageTextColor,
    required this.percentageText,
    required this.assetImage,
  });

  final double mWidth;
  final double mHeight;
  final Color backgroundCircleAvatarColor;
  final String text;
  final String text1;
  final Color colorPercentage;
  final Function() onPressed;
  final String buttonText;
  final Color buttonColor;
  final Color percentageTextColor;
  final String percentageText;
  final String assetImage;

  // ValueNotifier<String> textValue = ValueNotifier<String>('This Month');
  final String dropDownValueFive = 'This Month';

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xffF2F2F2),
            borderRadius: BorderRadius.circular(10)),
        //  height: mHeight*.2,
        width: mWidth * .45,
        child: Container(
          padding: EdgeInsets.only(
              left: mWidth * .02,
              top: mHeight * .01,
              right: mWidth * .01,
              bottom: mHeight * .01),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: backgroundCircleAvatarColor,
                radius: 20,
                child: const Icon(Icons.attach_money),
              ),
              Text(text,
                  style:GoogleFonts.poppins(textStyle: const TextStyle(
                  fontWeight: FontWeight.w900, fontSize: 18)),),
              ThisMonthWidget(
                mHeight: mHeight,
                mWidth: mWidth,
                color: const Color(0xffE9E9E9),
                //  onPressed: () {},
                textColor: const Color(0xff818181),
                type: 4,
                dropDownValue: dropDownValueFive,
                //textName: 'this Month',
              ),
              SizedBox(
                height: mHeight * .08,
                width: mWidth * .5,
                // color: Colors.green,
                child: Image.asset(
                  assetImage,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Text(text1,
                style:GoogleFonts.poppins(textStyle: const  TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 18))),
              Container(
                  height: mHeight * .033,
                  width: mWidth * .1,
                  decoration: BoxDecoration(
                      color: colorPercentage,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    percentageText,
                          style:GoogleFonts.poppins(textStyle:  TextStyle(color: percentageTextColor, fontSize: 13),),
                  ))),
              SizedBox(
                height: mHeight * .06,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                    ),
                    onPressed: onPressed,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            height: mHeight * .03,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: Colors.white)),
                            child: const Icon(
                              Icons.add,
                              size: 22,
                            )),
                        Text(buttonText,style: GoogleFonts.poppins(),),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MainTitleWidget extends StatelessWidget {
  const MainTitleWidget({
    super.key,
    required this.mHeight,
    required this.mWidth,
    required this.text,
    required this.dropDownValue,
    required this.type,

    // required this.onPressed,
    //  required this.textName,
  });

  final double mHeight;
  final double mWidth;
  final String text;
  final int type;
  final String dropDownValue;

  // final String textName;
  // final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
        style:GoogleFonts.poppins(textStyle: const  TextStyle(fontWeight: FontWeight.w900, fontSize: 21),
          ),
          ),
          ThisMonthWidget(
            mHeight: mHeight,
            mWidth: mWidth,
            color: const Color(0xffE9E9E9),
            //  onPressed: onPressed,
            textColor: const Color(0xff818181),
            type: type,
            dropDownValue: dropDownValue,
            //textName: textName,
          )
        ],
      ),
    );
  }
}

class ThisMonthWidget extends StatefulWidget {
  ThisMonthWidget({
    super.key,
    required this.mHeight,
    required this.mWidth,
    required this.color,
    required this.textColor,
    required this.type,
    required this.dropDownValue,
  });

  final double mHeight;
  final double mWidth;
  final Color color;
  final Color textColor;
  final int type;
  late String dropDownValue;

  @override
  State<ThisMonthWidget> createState() => _ThisMonthWidgetState();
}

class _ThisMonthWidgetState extends State<ThisMonthWidget> {
  final items = [
    'This Week',
    'This Month',
    'This Year',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.mHeight * .037,
        width: widget.mWidth * .25,
        decoration: BoxDecoration(
            color: widget.color, borderRadius: BorderRadius.circular(15)),
        child: Container(
          padding: EdgeInsets.only(left: widget.mWidth * .04),
          child: DropdownButton(
            underline: Container(),
            isExpanded: true,
            value: widget.dropDownValue,
            style: const TextStyle(
                fontSize: 13,
                color: Color(0xff818181),
                fontWeight: FontWeight.w600),
            icon: const SizedBox.shrink(),
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items , style:GoogleFonts.poppins() ),
              );
            }).toList(),
            onChanged: (newValue) {
              //  print(newValue);
              //  print(widget.dropDownValue);
              if (widget.type == 1) {
                setState(() {
                  widget.dropDownValue = newValue.toString();
                });
              } else if (widget.type == 2) {
                setState(() {
                  widget.dropDownValue = newValue.toString();
                });
              } else if (widget.type == 3) {
                setState(() {
                  widget.dropDownValue = newValue.toString();
                });
              } else {
                setState(() {
                  widget.dropDownValue = newValue.toString();
                });
              }
            },
          ),
        ));
  }
}

class AppBarButtonWidget extends StatelessWidget {
  const AppBarButtonWidget({
    super.key,
    required this.mHeight,
    required this.mWidth,
    required this.onPressed,
    required this.widget,
  });

  final double mHeight;
  final double mWidth;
  final void Function() onPressed;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: mHeight * .05,
        width: mWidth * .09,
        decoration: BoxDecoration(
            color: const Color(0xffE2E2E2),
            borderRadius: BorderRadius.circular(10)),
        child: IconButton(onPressed: onPressed, icon: widget));
  }
}
