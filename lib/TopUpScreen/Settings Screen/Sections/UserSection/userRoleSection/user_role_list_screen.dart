import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Bloc/UserRole/user_role_bloc.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Userole/DeleteUseroleModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Userole/SingleViewUseroleModelClass.dart';

import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Userole/UserRoleListModelClass.dart';
import 'package:topuptest/TopUpScreen/Widgets/Custom_Overlay_Loader/custom_overlay_loader.dart';


import '../../../../Constens/constens.dart';
import '../../../../Functions/exitbuttonfunction.dart';
import '../../../../Functions/floating_action_function.dart';
import '../../../../Widgets/appbar_widget.dart';
import '../../../../Widgets/search_widget.dart';
import 'add_and_edit_user_role_screen.dart';

class UserRoleListScreen extends StatefulWidget {
   const UserRoleListScreen({Key? key}) : super(key: key);

  @override
  State<UserRoleListScreen> createState() => _UserRoleListScreenState();
}

class _UserRoleListScreenState extends State<UserRoleListScreen> {
  final TextEditingController searchController = TextEditingController();
  late ProgressBar progressBar;
  late SingleViewUseroleModelClass singleViewUseroleModelClass ;
  late  DeleteUseroleModelClass deleteUseroleModelClass;

  void showProgressBar() {
    progressBar.show(context);
  }

  void hideProgressBar() {
    progressBar.hide();
  }

  @override
  void dispose() {
    progressBar.hide();
    super.dispose();
  }

  @override
  void initState() {
    progressBar = ProgressBar();
    BlocProvider.of<UserRoleBloc>(context).add(UserRoleListEvent(search: ""));
    // TODO: implement initState
    super.initState();
  }
  String? customId;

   late  UserRoleListModelClass userRoleListModelClass;

   @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;

    return MultiBlocListener(
      listeners: [

        BlocListener<UserRoleBloc, UserRoleState>(
          listener: (context, state) {
            if (state is UserRoleSingleViewLoading) {
              const CircularProgressIndicator(
                color: Color(0xffB73312),
              );
            }
            if (state is UserRoleSingleViewLoaded) {
              hideProgressBar();
              singleViewUseroleModelClass =
                  BlocProvider.of<UserRoleBloc>(context).singleViewUseroleModelClass;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddAndEditUserole(type: 'Edit',
                  id: customId,selectedItem:
                  singleViewUseroleModelClass.data!.first.userRoleName,
                  isSale: singleViewUseroleModelClass.data!.first.sale,
                  isPurchase: singleViewUseroleModelClass.data!.first.purchase,
                  isStockUpdate: singleViewUseroleModelClass.data!.first.stockUpdate,
                  isReports: singleViewUseroleModelClass.data!.first.reports,
                )),
              );


              BlocProvider.of<UserRoleBloc>(context).add(UserRoleListEvent(search: ""));
              if (state is UserRoleSingleViewError) {
                hideProgressBar();
                const Text("Something went wrong");
              }
            }
          },
        ),
        BlocListener<UserRoleBloc, UserRoleState>(
          listener: (context, state) {
            if (state is UserRoleDeleteLoading) {

              const CircularProgressIndicator(
                color: Color(0xffB73312),
              );
            }
            if (state is UserRoleDeleteLoaded) {
              hideProgressBar();
              BlocProvider.of<UserRoleBloc>(context).add(UserRoleListEvent(search: ""));

              if (state is UserRoleDeleteError) {
                hideProgressBar();
              }
            }
          },
        )

      ],
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: backGroundColor,
          appBar: appBar(
              appBarTitle: 'User Roles'),
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
                                    onTap: () async {
                                      showProgressBar();
                                      BlocProvider.of<UserRoleBloc>(context).add(
                                      SingleViewUseroleEvent(id: userRoleListModelClass.data![index].id.toString()));
                                      customId = userRoleListModelClass.data![index].id.toString();



                                    },
                                    child: Dismissible(
                                      background: Container(
                                          color: Colors.red,
                                          child: const Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                          )),
                                      confirmDismiss:
                                          (DismissDirection direction) async {
                                        return await btmDialogueFunction(
                                            context: context,
                                            textMsg: 'Are you sure delete ?',
                                            fistBtnOnPressed: () {
                                              Navigator.of(context)
                                                  .pop(false);
                                            },
                                            secondBtnPressed: () {
                                              showProgressBar();

                                              BlocProvider.of<UserRoleBloc>(
                                                  context)
                                                  .add(DeleteUseroleEvent(
                                                  id: userRoleListModelClass
                                                      .data![index].id
                                                      .toString()));
                                              Navigator.of(context).pop(true);
                                            },
                                            secondBtnText: 'Delete');
                                      },
                                      key: Key(userRoleListModelClass.data!.length
                                          .toString()),
                                      onDismissed: (direction) {
                                        showProgressBar();

                                        BlocProvider.of<UserRoleBloc>(
                                            context)
                                            .add(DeleteUseroleEvent(
                                            id: userRoleListModelClass
                                                .data![index].id
                                                .toString()));
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
          floatingActionButton: floatingActionButton(context: context,
              color: const Color(0xffB73312),
              icon: Icons.add,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddAndEditUserole(type: 'Add',)),
                );

              })
      ),
    );
  }
}
