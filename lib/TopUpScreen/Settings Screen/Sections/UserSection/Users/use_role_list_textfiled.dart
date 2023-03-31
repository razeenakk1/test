import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Userole/UserRoleListModelClass.dart';
import '../../../../Constens/constens.dart';
import '../../../../Functions/floating_action_function.dart';
import '../../../../TopUpApiSection/Bloc/UserRole/user_role_bloc.dart';
import '../../../../Widgets/appbar_widget.dart';
import '../../../../Widgets/search_widget.dart';
import '../userRoleSection/add_and_edit_user_role_screen.dart';

class UseRoleListScreen extends StatefulWidget {
  UseRoleListScreen({Key? key}) : super(key: key);

  @override
  State<UseRoleListScreen> createState() => _UseRoleListScreenState();
}

class _UseRoleListScreenState extends State<UseRoleListScreen> {


  final TextEditingController searchController = TextEditingController();

  late  UserRoleListModelClass userRoleListModelClass;
  @override
  void initState() {
    BlocProvider.of<UserRoleBloc>(context).add(UserRoleListEvent(search: ""));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar(appBarTitle: "Userole List"),
      backgroundColor:backGroundColor,
      body: Container(
        decoration: containerDecoration,
        padding: EdgeInsets.only(left: mWidth * .04, right: mWidth * .04),
        height: mHeight,
        // color: Colors.white,

        child: Column(
          children: [
            SizedBox(height: mHeight * .02),
            SearchFieldWidget(
              mHeight: mHeight,
              hintText: 'Search',
              controller: searchController,
              onChanged: (quary) {
                if (quary.isNotEmpty) {
                  BlocProvider.of<UserRoleBloc>(context)
                      .add(UserRoleListEvent(search: quary));
                } else {
                  BlocProvider.of<UserRoleBloc>(context)
                      .add(UserRoleListEvent(search: ""));
                }
              },
            ),
            SizedBox(height: mHeight * .01),
            Expanded(
              child: BlocBuilder<UserRoleBloc, UserRoleState>(
                builder: (context, state) {
                  if (state is UserRoleListLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xffB73312),
                      ),
                    );
                  }
                  if (state is UserRoleListLoaded) {
                    userRoleListModelClass =
                        BlocProvider.of<UserRoleBloc>(context).userRoleListModelClass;
                    return ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        userRoleListModelClass.data!.isNotEmpty
                            ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: userRoleListModelClass.data!.length,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: (){
                                  Navigator.pop(context, [userRoleListModelClass.data![index].userRoleName,
                                    userRoleListModelClass.data![index].id]);
                             //     Navigator.pop(context, [items[index], groupId[index]]);
                                },
                                child: Card(
                                  elevation: 0,
                                  child: Container(
                                    height: mHeight * .07,
                                    decoration:
                                    listPageContainerDecorationVariable,
                                    child: Center(
                                      child: ListTile(
                                        title: Text(
                                            userRoleListModelClass
                                                .data![index]
                                                .userRoleName !=
                                                null
                                                ? userRoleListModelClass
                                                .data![index]
                                                .userRoleName
                                                .toString()
                                                : "not found list name!",
                                            style: GoogleFonts.poppins(
                                              textStyle:
                                              const TextStyle(
                                                  fontWeight:
                                                  FontWeight
                                                      .bold),
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            })
                            : SizedBox(
                            height: mHeight * .7,
                            child: const Center(
                                child: Text(
                                  "Items not found !",
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold),
                                )))
                      ],
                    );
                  }
                  if (state is UserRoleListError) {
                    const Text("Something went wrong");
                  }

                  return const Center(
                    child: SizedBox(),
                    // child: CircularProgressIndicator(
                    //   color:  Color(0xffB73312),
                    // ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}
// var items = [
//   "Accountant",
//   "SBI",
//   "Rent",
//   "Supplier",
//   "Customer",
// ];
// var groupId = [
//   1,
//   2,
//   3,
//   4,
//   5,
// ];
//
// Navigator.pop(context, [items[index], groupId[index]]);