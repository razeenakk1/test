import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Bloc/Ledger/ledger_bloc.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Ledger/LedgerListModelClass.dart';

import '../../../../Constens/constens.dart';
import '../../../../Functions/exitbuttonfunction.dart';
import '../../../../Functions/floating_action_function.dart';
import '../../../../Widgets/appbar_widget.dart';
import '../../../../Widgets/search_widget.dart';
import 'create_and_edit_ledger_screen.dart';

final particulars = [
  "Cash in hand",
  "SBI",
  "Rent",
  "Savad farooque",
  "Asna",
];

class LedgersScreen extends StatefulWidget {
 const LedgersScreen({Key? key}) : super(key: key);

  @override
  State<LedgersScreen> createState() => _LedgersScreenState();
}

class _LedgersScreenState extends State<LedgersScreen> {
  @override
  void initState() {
    BlocProvider.of<LedgerBloc>(context).add(ListLedgerEvent(search: ''));
    super.initState();
  }

  final TextEditingController searchController = TextEditingController();
  late LedgerListModelClass ledgerListModelClass;


  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,

        backgroundColor: backGroundColor,
        appBar: appBar( appBarTitle: 'Ledgers',
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back))),
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
                    BlocProvider.of<LedgerBloc>(context)
                        .add(ListLedgerEvent(search: quary));
                  } else {
                    BlocProvider.of<LedgerBloc>(context).add(ListLedgerEvent(search: ''));
                  }
                },
              ),
              SizedBox(height: mHeight * .01),
              Expanded(
                child: BlocBuilder<LedgerBloc, LedgerState>(
                  builder: (context, state) {
                    if (state is LedgerListLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xffB73312),
                        ),
                      );
                    }
                    if (state is LedgerListLoaded) {
                      ledgerListModelClass =
                          BlocProvider.of<LedgerBloc>(context)
                              .ledgerListModelClass;
                      return ListView(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          ledgerListModelClass.data!.isNotEmpty
                              ? ListView.builder(
                              shrinkWrap: true,
                              physics:
                              const NeverScrollableScrollPhysics(),
                              itemCount:
                              ledgerListModelClass.data!.length,
                              itemBuilder:
                                  (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () async {
                                  //  showProgressBar();
                                  //   BlocProvider.of<LedgerBloc>(context)
                                  //       .add(SingleViewLedgerEvent(
                                  //       id: areaListModelClass
                                  //           .data![index].id
                                  //           .toString()));
                                  //
                                  //   customId = areaListModelClass
                                  //       .data![index].id
                                  //       .toString();
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
                                            // showProgressBar();
                                            //
                                            // BlocProvider.of<LedgerBloc>(context)
                                            //     .add(DeleteLedgerEvent(id: areaListModelClass.data![index].id.toString()
                                            // ));
                                            Navigator.of(context)
                                                .pop(true);
                                          },
                                          secondBtnText: 'Delete');
                                    },
                                    key: Key(ledgerListModelClass
                                        .data!.length
                                        .toString()),
                                    onDismissed: (direction) {
                                      // showProgressBar();
                                      //
                                      //
                                      // BlocProvider.of<LedgerBloc>(context)
                                      //     .add(DeleteLedgerEvent(id: areaListModelClass.data![index].id.toString()
                                      // ));
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
                                                ledgerListModelClass
                                                    .data![index]
                                                    .ledgerName !=
                                                    null
                                                    ? ledgerListModelClass
                                                    .data![index]
                                                    .ledgerName
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
                                            subtitle: Text( ledgerListModelClass
                                                .data![index]
                                                .balance !=
                                                null
                                                ? ledgerListModelClass
                                                .data![index]
                                                .balance
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
                    if (state is LedgerListError) {
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  const CreateAndEditLedger(type: 'Create',)),
              );
            }));
  }
}

/// google font style is pending
