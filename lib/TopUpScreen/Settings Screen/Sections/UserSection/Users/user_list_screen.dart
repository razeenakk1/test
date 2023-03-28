import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Bloc/User/user_bloc.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/User/DeleteUserModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/User/EditUserModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/User/SingleViewUserModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/User/UserListModelClass.dart';
import 'package:topuptest/TopUpScreen/Widgets/Custom_Overlay_Loader/custom_overlay_loader.dart';
import '../../../../Constens/constens.dart';
import '../../../../Functions/exitbuttonfunction.dart';
import '../../../../Functions/floating_action_function.dart';
import '../../../../Widgets/appbar_widget.dart';
import '../../../../Widgets/search_widget.dart';
import 'add_and_edit_user_screen.dart';


class UserListScreen extends StatefulWidget {
   UserListScreen({Key? key}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {

  final TextEditingController searchController = TextEditingController();

   String userName = "";

   String password = "";
  late ProgressBar progressBar;

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
  String? customId;


  @override
  void initState() {
     BlocProvider.of<UserBloc>(context).add(ListUserEvent(search: ''));
     progressBar = ProgressBar();


     // TODO: implement initState
    super.initState();
  }
  late UserListModelClass userListModelClass;
  late SingleViewUserModelClass  singleViewUserModelClass ;
  late EditUserModelClass editUserModelClass ;
  late  DeleteUserModelClass deleteUserModelClass ;
  networkConnection()async{
   // final Connectivity _connectivity = Connectivity();

  }



  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;

    return MultiBlocListener(
      listeners: [
        BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state is SingleViewUserLoading) {
              const CircularProgressIndicator(
                color: Color(0xffB73312),
              );
            }
            if (state is SingleViewUserLoaded) {
              hideProgressBar();
              singleViewUserModelClass =
                  BlocProvider.of<UserBloc>(context)
                      .singleViewUserModelClass;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  AddAndEitUser(
                  type: 'Edit',
                  id: singleViewUserModelClass.data!.id,
                  name: singleViewUserModelClass.data!.firstName,
                  userName: singleViewUserModelClass.data!.username,
                  email: singleViewUserModelClass.data!.email,
                  phone: singleViewUserModelClass.data!.phone.toString(),
                  userRoleName: singleViewUserModelClass.data!.userRoleName.toString(),
                  userRolesId: singleViewUserModelClass.data!.userRoles,
                  isAdmin: singleViewUserModelClass.data!.isAdmin,
                  password: singleViewUserModelClass.data!.password,


                )),
              );

              BlocProvider.of<UserBloc>(context).add(ListUserEvent(search: ''));

              if (state is SingleViewUserError) {
                hideProgressBar();
                const Text("Something went wrong");
              }
            }
          },
        ),
        BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state is DeleteUserLoading) {
              const CircularProgressIndicator(
                color: Color(0xffB73312),
              );
            }
            if (state is DeleteUserLoaded) {
              hideProgressBar();
              BlocProvider.of<UserBloc>(context).add(ListUserEvent(search: ''));
              deleteUserModelClass =
                  BlocProvider.of<UserBloc>(context).deleteUserModelClass;
              if (deleteUserModelClass.statusCode == 6001) {
                msgBtmDialogueFunction(
                    context: context,
                    textMsg: deleteUserModelClass.message.toString());
              }

              if (state is DeleteUserError) {
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
              appBarTitle: 'Users'),
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
                      BlocProvider.of<UserBloc>(context)
                          .add(ListUserEvent(search: quary));
                    } else {
                      BlocProvider.of<UserBloc>(context).add(ListUserEvent(search: ''));
                    }
                  },
                ),
                SizedBox(height: mHeight * .01),
                Expanded(
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserListLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xffB73312),
                          ),
                        );
                      }
                      if (state is UserListLoaded) {
                        userListModelClass =
                            BlocProvider.of<UserBloc>(context)
                                .userListModelClass;
                        return ListView(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            userListModelClass.data!.isNotEmpty
                                ? ListView.builder(
                                shrinkWrap: true,
                                physics:
                                const NeverScrollableScrollPhysics(),
                                itemCount:
                                userListModelClass.data!.length,
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  userName =  userListModelClass.data![index].username.toString();
                                  password =  userListModelClass.data![index].password.toString();
                                  print("____________________________username$userName");
                                  print("________%%%%%%%%%%%%%%%%%%%%%%%%%%%____________________pswrd$password");
                                  return GestureDetector(
                                    onTap: () async {
                                      print("_____________%%%%%%%%%%%%%%%%%_______________username$userName");
                                     showProgressBar();
                                      BlocProvider.of<UserBloc>(context)
                                          .add(SingleViewUserEvent(
                                          id: userListModelClass
                                              .data![index].id
                                              .toString()));

                                      customId = userListModelClass
                                          .data![index].id
                                          .toString();
                                    },
                                    child: Dismissible(
                                      background: Container(
                                          color: Colors.red,
                                          child: const Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                          )),
                                      confirmDismiss: (DismissDirection
                                      direction) async {
                                        return await btmDialogueFunction(
                                            context: context,
                                            textMsg:
                                            'Are you sure delete ?',
                                            fistBtnOnPressed: () {
                                              Navigator.of(context)
                                                  .pop(false);
                                            },
                                            secondBtnPressed: () {
                                             showProgressBar();

                                              BlocProvider.of<UserBloc>(context)
                                                  .add(DeleteUserEvent(id: userListModelClass.data![index].id.toString()
                                              ));
                                              Navigator.of(context)
                                                  .pop(true);
                                            },
                                            secondBtnText: 'Delete');
                                      },
                                      key: Key(userListModelClass
                                          .data!.length
                                          .toString()),
                                      onDismissed: (direction) {
                                       showProgressBar();


                                        BlocProvider.of<UserBloc>(context)
                                            .add(DeleteUserEvent(id: userListModelClass.data![index].id.toString()
                                        ));
                                      },
                                      child: Card(
                                        elevation: 0,
                                        child: Container(
                                          height: mHeight * .1,
                                          decoration:
                                          listPageContainerDecorationVariable,
                                          child: Center(
                                            child: ListTile(
                                              title: Text(
                                                  userListModelClass
                                                      .data![index]
                                                      .username !=
                                                      null
                                                      ? userListModelClass
                                                      .data![index]
                                                      .username
                                                      .toString()
                                                      : "not found list name!",
                                                  style:
                                                  GoogleFonts.poppins(
                                                    textStyle:
                                                    const TextStyle(
                                                        fontWeight:
                                                        FontWeight
                                                            .bold),
                                                  )),
                                              subtitle: Text( userListModelClass
                                                  .data![index]
                                                  .email !=
                                                  null
                                                  ? userListModelClass
                                                  .data![index]
                                                  .email
                                                  .toString()
                                                  : "not found list mail!",
                                                  style:
                                                  GoogleFonts.poppins(
                                                    textStyle:
                                                    const TextStyle(
                                                        fontWeight:
                                                        FontWeight
                                                            .bold),
                                                  )),
                                              trailing: SizedBox(
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )))
                          ],
                        );
                      }
                      if (state is UserListError) {
                        Center(child: const Text("Something went wrong",style: TextStyle(color: Colors.red),));
                      }

                      return const Center(
                        child: SizedBox(),
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
                  MaterialPageRoute(builder: (context) =>  AddAndEitUser(type: 'Add',)),
                );

              })
      ),
    );
  }
}

