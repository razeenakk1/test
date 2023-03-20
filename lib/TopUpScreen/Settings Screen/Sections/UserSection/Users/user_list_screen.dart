import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Constens/constens.dart';
import '../../../../Functions/floating_action_function.dart';
import '../../../../Widgets/appbar_widget.dart';
import '../../../../Widgets/search_widget.dart';
import '../../Accounts/Ledgers_Secrion/ledgers_screen.dart';
import 'add_and_edit_user_screen.dart';


class UserListScreen extends StatelessWidget {
   UserListScreen({Key? key}) : super(key: key);

  final TextEditingController searchController = TextEditingController();


   String userName = "savad";

   String password = "123456";

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backGroundColor,
        appBar: appBar(
            appBarTitle: 'Users'),
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
                    return Card(
                      elevation: 0,
                      child: Container(
                        height: mHeight * .1,
                        decoration: listPageContainerDecorationVariable,
                        child: Center(
                          child: ListTile(
                            title: GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const AddAndEitUser(type: 'Edit',)),
                                );
                              },
                              child: SizedBox(
                               // color: Colors.blue,
                                height: mHeight * .1,
                                width: mWidth*.4,
                                child: Text(particulars[index],
                                  style:GoogleFonts.poppins(textStyle: const TextStyle(fontWeight: FontWeight.bold),)),
                              ),
                            ),
                            trailing: Column(
                            children: [
                              const Icon(Icons.share),
                              SizedBox(
                               height: mHeight*.04,
                                child: IconButton(
                                  onPressed: (){
                                    shareFunction(context, userName, password);
                                  },
                                  icon: Image.asset(
                                    "assets/settingsimage/share.png",
                                    height: mHeight * .02,
                                  ),
                                ),
                              ),
                            ],
                              ),


                          ),
                        ),

                      ),
                    );
                  }),
              // Container(
              //   height: mHeight*.1,
              //   color: Colors.red,
              //   child: GestureDetector(
              //       onTap: (){
              //
              //         shareFunction(context, userName, password);
              //
              //
              //       },
              //       child: share_button_widget(mHeight: mHeight, mWidth: mWidth,)),
              // )
            ],
          ),
        ),
        floatingActionButton: floatingActionButton(context: context,
            color: const Color(0xffB73312),
            icon: Icons.add,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddAndEitUser(type: 'Add',)),
              );

            })
    );
  }
}

