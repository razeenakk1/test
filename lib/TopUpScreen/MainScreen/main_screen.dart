import 'package:flutter/material.dart';

import '../Constens/constens.dart';
import '../DashBordScreen/dash_bord_screen.dart';
import '../Menu/menu.dart';
import '../MenuScreen/menu_screen.dart';
import '../ProfileScreen/profile_screen.dart';
import '../Settings Screen/settings_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final PageController pageController = PageController(initialPage: 0);
  final ValueNotifier<int> selectedIndex = ValueNotifier(0);
  final scaffoldKey = GlobalKey<ScaffoldState>();


  final List page = [
    DashBordScreen(),
    const MenuScreen(),
    const Menu(),
    const ProfileScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;

    return ValueListenableBuilder(
        valueListenable: selectedIndex,
        builder: (BuildContext context, int newIndex, _) {
          return Scaffold(
            backgroundColor: backGroundColor,
            bottomNavigationBar: Container(
              height: mHeight * .1,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: BottomAppBar(
                  notchMargin: 7,
                  color: const Color(0xff1c1f26),
                  child: BottomNavigationBar(
                    key: scaffoldKey,
                    currentIndex: newIndex,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.white,
                    selectedFontSize: 0,
                    items: [
                      BottomNavigationBarItem(
                          backgroundColor: Colors.white,
                          icon: newIndex == 0
                              ? const BottomNavigationContainerWidget(
                                  assetImage:
                                      'assets/BottomNavigationImages/dashboard.png',
                                )
                              : Image.asset(
                                  "assets/BottomNavigationImages/dashboard.png",
                                  color: Colors.grey,
                                  height: mHeight * .05,
                                  width: mWidth * .06,
                                  fit: BoxFit.fitWidth),
                          label: ''),
                      BottomNavigationBarItem(
                          icon: newIndex == 1
                              ? const BottomNavigationContainerWidget(
                                  assetImage:
                                      'assets/BottomNavigationImages/menu.png',
                                )
                              : Image.asset(
                                  "assets/BottomNavigationImages/menu.png",
                                  height: mHeight * .05,
                                  width: mWidth * .06,
                                  fit: BoxFit.fitWidth),
                          label: ""),
                      BottomNavigationBarItem(
                          icon: newIndex == 2
                              ? const BottomNavigationContainerWidget(
                                  assetImage:
                                      'assets/BottomNavigationImages/piecahrt.png',
                                )
                              : Image.asset(
                                  "assets/BottomNavigationImages/piecahrt.png",
                                  height: mHeight * .05,
                                  width: mWidth * .06,
                                  fit: BoxFit.fitWidth),
                          label: ""),
                      BottomNavigationBarItem(
                          icon: newIndex == 3
                              ? const BottomNavigationContainerWidget(
                                  assetImage:
                                      'assets/BottomNavigationImages/persons.png',
                                )
                              : Image.asset(
                                  "assets/BottomNavigationImages/persons.png",
                                  height: mHeight * .05,
                                  width: mWidth * .06,
                                  fit: BoxFit.fitWidth),
                          label: ""),
                      BottomNavigationBarItem(
                          icon: newIndex == 4
                              ? const BottomNavigationContainerWidget(
                                  assetImage:
                                      'assets/BottomNavigationImages/settings.png',
                                )
                              : Image.asset(
                                  "assets/BottomNavigationImages/settings.png",
                                  height: mHeight * .05,
                                  width: mWidth * .06,
                                  fit: BoxFit.fitWidth),
                          label: ""),
                    ],
                    onTap: (index) {
                      //  print(index);
                      selectedIndex.value = index;
                    },
                  ),
                ),
              ),
            ),
            body: page[newIndex],
          );
        });
  }
}

class BottomNavigationContainerWidget extends StatelessWidget {
  const BottomNavigationContainerWidget({
    super.key,
    required this.assetImage,
  });

  final String assetImage;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xffA42910),
        ),
        height: MediaQuery.of(context).size.height * .07,
        width: MediaQuery.of(context).size.width * .14,
        child: Image.asset(
          assetImage,
          color: Colors.white,
        ));
  }
}
