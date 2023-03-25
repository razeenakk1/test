import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Bloc/Area/area_bloc.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Area/AreaListModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Area/DeleteAreaModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Area/SingleViewAreaModelClass.dart';
import '../../../Constens/constens.dart';
import '../../../Functions/exitbuttonfunction.dart';
import '../../../Functions/floating_action_function.dart';
import '../../../Widgets/Custom_Overlay_Loader/custom_overlay_loader.dart';
import '../../../Widgets/appbar_widget.dart';
import '../../../Widgets/search_widget.dart';
import '../../Custom_Commen_Class_BottomSheet/commen_function.dart';

class AreaListScreen extends StatefulWidget {
  AreaListScreen({Key? key}) : super(key: key);

  @override
  State<AreaListScreen> createState() => _AreaListScreenState();
}

class _AreaListScreenState extends State<AreaListScreen> {
  final CommonBottomSheetClass commonBottomSheetClass = CommonBottomSheetClass();

  final TextEditingController searchController = TextEditingController();

  late  AreaListModelClass areaListModelClass;

  late  DeleteAreaModelClass deleteAreaModelClass ;

  late SingleViewAreaModelClass singleViewAreaModelClass ;
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
    BlocProvider.of<AreaBloc>(context).add(ListAreaEvent(search: ''));
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
        BlocListener<AreaBloc, AreaState>(
          listener: (context, state) {
            if (state is AreaSingleViewLoading) {
              const CircularProgressIndicator(
                color: Color(0xffB73312),
              );
            }
            if (state is AreaSingleViewLoaded) {
              hideProgressBar();
              singleViewAreaModelClass =
                  BlocProvider.of<AreaBloc>(context)
                      .singleViewAreaModelClass;

              commonBottomSheetClass .settingsBottomSheetFunction(
                  context: context, type: "Area", addOrEdit: 'Edit',
                  typeName:singleViewAreaModelClass.data!.areaName, id: customId);

              BlocProvider.of<AreaBloc>(context)
                  .add(ListAreaEvent(search: ''));
              if (state is AreaSingleViewError) {
                hideProgressBar();
                const Text("Something went wrong");
              }
            }
          },
        ),
        BlocListener<AreaBloc, AreaState>(
          listener: (context, state) {
            if (state is AreaDeleteLoading) {
              const CircularProgressIndicator(
                color: Color(0xffB73312),
              );
            }
            if (state is AreaDeleteLoaded) {
              hideProgressBar();
              BlocProvider.of<AreaBloc>(context).add(ListAreaEvent(search: ''));
              deleteAreaModelClass =
                  BlocProvider.of<AreaBloc>(context).deleteAreaModelClass;
              if (deleteAreaModelClass.statusCode == 6001) {
                msgBtmDialogueFunction(
                    context: context,
                    textMsg: deleteAreaModelClass.message.toString());
              }

              if (state is AreaDeleteError) {
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
              appBarTitle: 'Areas'),
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
                      BlocProvider.of<AreaBloc>(context)
                          .add(ListAreaEvent(search: quary));
                    } else {
                      BlocProvider.of<AreaBloc>(context).add(ListAreaEvent(search: ''));
                    }
                  },
                ),
                SizedBox(height: mHeight * .01),
                Expanded(
                  child: BlocBuilder<AreaBloc, AreaState>(
                    builder: (context, state) {
                      if (state is AreaListLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xffB73312),
                          ),
                        );
                      }
                      if (state is AreaListLoaded) {
                        areaListModelClass =
                            BlocProvider.of<AreaBloc>(context)
                                .areaListModelClass;
                        return ListView(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            areaListModelClass.data!.isNotEmpty
                                ? ListView.builder(
                                shrinkWrap: true,
                                physics:
                                const NeverScrollableScrollPhysics(),
                                itemCount:
                                areaListModelClass.data!.length,
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () async {
                                      showProgressBar();
                                      BlocProvider.of<AreaBloc>(context)
                                          .add(SingleViewAreaEvent(
                                          id: areaListModelClass
                                              .data![index].id
                                              .toString()));

                                      customId = areaListModelClass
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

                                              BlocProvider.of<AreaBloc>(context)
                                                  .add(DeleteAreaEvent(id: areaListModelClass.data![index].id.toString()
                                              ));
                                              Navigator.of(context)
                                                  .pop(true);
                                            },
                                            secondBtnText: 'Delete');
                                      },
                                      key: Key(areaListModelClass
                                          .data!.length
                                          .toString()),
                                      onDismissed: (direction) {
                                        showProgressBar();


                                        BlocProvider.of<AreaBloc>(context)
                                            .add(DeleteAreaEvent(id: areaListModelClass.data![index].id.toString()
                                        ));
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
                                                  areaListModelClass
                                                      .data![index]
                                                      .areaName !=
                                                      null
                                                      ? areaListModelClass
                                                      .data![index]
                                                      .areaName
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
                      if (state is AreaListError) {
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
                commonBottomSheetClass.
                settingsBottomSheetFunction(context: context, type: "Area", addOrEdit: 'Add');
              })),
    );
  }
}
