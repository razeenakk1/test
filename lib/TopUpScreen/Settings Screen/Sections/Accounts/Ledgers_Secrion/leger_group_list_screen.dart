import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Bloc/Ledger/ledger_bloc.dart';

import '../../../../Constens/constens.dart';
import '../../../../TopUpApiSection/ModelClasses/Ledger/LedgerGroupListModelClass.dart';
import '../../../../Widgets/appbar_widget.dart';
import '../../../../Widgets/search_widget.dart';


class LedgerGroupListScreen extends StatefulWidget {
   LedgerGroupListScreen({Key? key}) : super(key: key);

  @override
  State<LedgerGroupListScreen> createState() => _LedgerGroupListScreenState();
}

class _LedgerGroupListScreenState extends State<LedgerGroupListScreen> {
  late LedgerGroupListModelClass ledgerGroupListModelClass;

  @override
  void initState() {
    BlocProvider.of<LedgerBloc>(context).add(ListLedgerGroupEvent(search: ''));
    // TODO: implement initState
    super.initState();
  }


  final TextEditingController searchController = TextEditingController();


   @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar(appBarTitle: ""),
      backgroundColor: backGroundColor,
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
                      .add(ListLedgerGroupEvent(search: quary));
                } else {
                  BlocProvider.of<LedgerBloc>(context).add(ListLedgerGroupEvent(search: ''));
                }
              },
            ),
            SizedBox(height: mHeight * .01),
            Expanded(
              child: BlocBuilder<LedgerBloc, LedgerState>(
                builder: (context, state) {
                  if (state is LedgerGroupListLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xffB73312),
                      ),
                    );
                  }
                  if (state is LedgerGroupListLoaded) {
                    ledgerGroupListModelClass =
                        BlocProvider.of<LedgerBloc>(context)
                            .ledgerGroupListModelClass;
                    return ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        ledgerGroupListModelClass.data!.isNotEmpty
                            ? ListView.builder(
                            shrinkWrap: true,
                            physics:
                            const NeverScrollableScrollPhysics(),
                            itemCount:
                            ledgerGroupListModelClass.data!.length,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: (){

     print(ledgerGroupListModelClass.data![index]);
     print("${ledgerGroupListModelClass.data![index].id}");
     Navigator.pop(context, [ledgerGroupListModelClass.data![index].accountGroupName,
       ledgerGroupListModelClass.data![index].accountGroupID],);


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
                                            ledgerGroupListModelClass
                                                .data![index]
                                                .accountGroupName !=
                                                null
                                                ? ledgerGroupListModelClass
                                                .data![index]
                                                .accountGroupName
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
                                        subtitle: Text(
                                            ledgerGroupListModelClass
                                                .data![index]
                                                .groupCode !=
                                                null
                                                ? ledgerGroupListModelClass
                                                .data![index]
                                                .groupCode
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
                  if (state is LedgerGroupListError) {
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





    );
  }
}
// onTap: (){
// var items = [
//   "Supplier",
//   "Customer",
//   "Rent",
//   "Savad farooque",
//   "Asna",
// ];
// var groupId = [
//   2,
//   3,
//   1,
//   5,
//   4,
// ];
// print(items[index]);
// print("${groupId[index]}");
// Navigator.pop(context, [items[index],groupId[index]],);
// },
