import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Bloc/Category/category_bloc.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Bloc/Group/group_bloc.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Group/GroupListModelClass.dart';
import '../../../Constens/constens.dart';
import '../../../Functions/exitbuttonfunction.dart';
import '../../../Functions/floating_action_function.dart';
import '../../../TopUpApiSection/ModelClasses/Group/DeleteGroupModelClass.dart';
import '../../../TopUpApiSection/ModelClasses/Group/SingleViewGroupModelClass.dart';
import '../../../Widgets/Custom_Overlay_Loader/custom_overlay_loader.dart';
import '../../../Widgets/appbar_widget.dart';
import '../../../Widgets/search_widget.dart';
import '../../Custom_Commen_Class_BottomSheet/commen_function.dart';

class GroupListScreen extends StatefulWidget {
  const GroupListScreen({Key? key}) : super(key: key);

  @override
  State<GroupListScreen> createState() => _GroupListScreenState();
}

class _GroupListScreenState extends State<GroupListScreen> {
  final CommonBottomSheetClass commonBottomSheetClass = CommonBottomSheetClass();

  final TextEditingController searchController = TextEditingController();

  late GroupListModelClass groupListModelClass;
  late SingleViewGroupModelClass singleViewGroupModelClass;
  late DeleteGroupModelClass deleteGroupModelClass;


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

  @override
  void initState() {
    BlocProvider.of<GroupBloc>(context).add(ListGroupEvent(search: ''));
    progressBar = ProgressBar();

    // TODO: implement initState
    super.initState();
  }

  String? customId;


  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;

    return MultiBlocListener(
      listeners: [
        BlocListener<GroupBloc, GroupState>(
          listener: (context, state) {
            if (state is GroupSingleViewLoading) {
              const CircularProgressIndicator(
                color: Color(0xffB73312),
              );
            }
            if (state is GroupSingleViewLoaded) {
              hideProgressBar();
              singleViewGroupModelClass =
                  BlocProvider.of<GroupBloc>(context)
                      .singleViewGroupModelClass;

              commonBottomSheetClass .settingsBottomSheetFunction(
                  context: context, type: "Group", addOrEdit: 'Edit',
                  typeName:singleViewGroupModelClass.data!.first.productGroupName, id: customId);

              BlocProvider.of<GroupBloc>(context).add(ListGroupEvent(search: ''));
              if (state is GroupSingleViewError) {
                hideProgressBar();
                const Text("Something went wrong");
              }
            }
          },
        ),
        BlocListener<GroupBloc, GroupState>(
          listener: (context, state) {
            if (state is GroupDeleteLoading) {
              const CircularProgressIndicator(
                color: Color(0xffB73312),
              );
            }
            if (state is GroupDeleteLoaded) {
              hideProgressBar();
              BlocProvider.of<GroupBloc>(context).add(ListGroupEvent(search: ''));
             deleteGroupModelClass  =
                  BlocProvider.of<GroupBloc>(context).deleteGroupModelClass;
              if (deleteGroupModelClass.statusCode == 6001) {
                msgBtmDialogueFunction(
                    context: context,
                    textMsg: deleteGroupModelClass.message.toString());
              }

              if (state is GroupDeleteError) {}
              hideProgressBar();
            }
          },
        )
      ],
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: backGroundColor,
          appBar: appBar(
              appBarTitle: 'Groups'),
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
                      BlocProvider.of<GroupBloc>(context)
                          .add(ListGroupEvent(search: quary));
                    } else {
                      BlocProvider.of<GroupBloc>(context)
                          .add(ListGroupEvent(search: ""));
                    }
                  },
                ),
                SizedBox(height: mHeight * .01),
                Expanded(
                  child: BlocBuilder<GroupBloc, GroupState>(
                    builder: (context, state) {
                      if (state is GroupListLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xffB73312),
                          ),
                        );
                      }
                      if (state is GroupListLoaded) {
                        groupListModelClass =
                            BlocProvider.of<GroupBloc>(context)
                                .groupListModelClass;
                        return ListView(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            groupListModelClass.data!.isNotEmpty
                                ? ListView.builder(
                                shrinkWrap: true,
                                physics:
                                const NeverScrollableScrollPhysics(),
                                itemCount:
                                groupListModelClass.data!.length,
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () async {
                                      showProgressBar();
                                      BlocProvider.of<GroupBloc>(context)
                                          .add(SingleViewGroupEvent(id: groupListModelClass.data![index].id.toString()));

                                      customId = groupListModelClass
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

                                              BlocProvider.of<GroupBloc>(context)
                                                  .add(DeleteGroupEvent(id: groupListModelClass.data![index].id.toString()
                                              ));
                                              Navigator.of(context)
                                                  .pop(true);
                                            },
                                            secondBtnText: 'Delete');
                                      },
                                      key: Key(groupListModelClass
                                          .data!.length
                                          .toString()),
                                      onDismissed: (direction) {
                                        showProgressBar();


                                        BlocProvider.of<GroupBloc>(context)
                                            .add(DeleteGroupEvent(id: groupListModelClass.data![index].id.toString()));

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
                                                  groupListModelClass
                                                      .data![index]
                                                      .productGroupName !=
                                                      null
                                                      ? groupListModelClass
                                                      .data![index]
                                                      .productGroupName
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
                      if (state is CategoryListError) {
                        const Text("Something went wrong");
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
          floatingActionButton: floatingActionButton(
              context: context,
              color: const Color(0xffB73312),
              icon: Icons.add,
              onPressed: () {
                commonBottomSheetClass .settingsBottomSheetFunction(context: context, type: "Group", addOrEdit: 'Add');
              })),
    );
  }
}
