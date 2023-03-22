import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/SingleViewTaxModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/TaxListModelClass.dart';
import '../../../Constens/constens.dart';
import '../../../Functions/exitbuttonfunction.dart';
import '../../../Functions/floating_action_function.dart';
import '../../../Functions/roundoff_function.dart';
import '../../../TopUpApiSection/Bloc/Tax/tax_bloc.dart';
import '../../../Widgets/appbar_widget.dart';
import '../../../Widgets/search_widget.dart';
import 'Class/tax_bottom_sheet_class.dart';

class TaxListScreen extends StatefulWidget {
  const TaxListScreen({Key? key}) : super(key: key);

  @override
  State<TaxListScreen> createState() => _TaxListScreenState();
}

class _TaxListScreenState extends State<TaxListScreen> {
  final TaxBottomSheetClass taxBottomSheetClass = TaxBottomSheetClass();

  final TextEditingController searchController = TextEditingController();
  late TaxListModelClass taxListModelClass;
  late SingleViewTaxModelClass singleViewTaxModelClass;
  int? dupIndex;
  @override
  void initState() {
    BlocProvider.of<TaxBloc>(context).add(ListTaxEvent());

    // TODO: implement initState
    super.initState();
  }
  int? index;

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;

    return BlocListener<TaxBloc, TaxState>(
  listener: (context, state) {
    if(state is SingleViewTaxListLoading){
      const CircularProgressIndicator();
    }
    if (state is SingleViewTaxListLoaded) {
      singleViewTaxModelClass =
          BlocProvider.of<TaxBloc>(context).singleViewTaxModelClass;

      taxBottomSheetClass.taxModelBottomSheet(
          context: context,
          type: 'Edit',
          taxName: singleViewTaxModelClass.data!.first.taxTypeName,
          purchaseTax:  roundStringWith(singleViewTaxModelClass.data!.first.purchaseTax.toString()),

          salesTax:  roundStringWith(singleViewTaxModelClass.data!.first.saleTax.toString()),
          id: taxListModelClass.data!.first.id,);
      BlocProvider.of<TaxBloc>(context).add(ListTaxEvent());
      if (state is SingleViewTaxListError) {
        const Text("Something went wrong");
      }
    }
  },
  child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backGroundColor,
      appBar: appBar(appBarTitle: 'Tax Types',
      ),
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
            ),
            SizedBox(height: mHeight * .01),
            Expanded(
              child: BlocBuilder<TaxBloc, TaxState>(
  builder: (context, state) {
    if (state is TaxListLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
    }
    if(state is TaxListLoaded) {
      taxListModelClass =
                  BlocProvider.of<TaxBloc>(context).taxListModelClass;
              return ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: taxListModelClass.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: ()async {
                               BlocProvider.of<TaxBloc>(context).add(SingleViewTaxEvent(id:
                              taxListModelClass.data![index].id.toString()));

                               },
                          child: Dismissible(
                            background: Container(
                          color: Colors.red,
                          child: const Icon(Icons.delete,
                          color: Colors.white,
                          )),
                              confirmDismiss: (DismissDirection direction) async {
                                return await       btmDialogueFunction(context: context, textMsg: 'Are you sure delete ?',
                                    fistBtnOnPressed: () {
                                      Navigator.of(context).pop(false);
                                      }, secondBtnPressed: () {
                                      Navigator.of(context).pop(true);



                                    }, secondBtnText: 'Delete');
                              },
                            key: Key(taxListModelClass.data!.length.toString()),
                            onDismissed: (direction) {
                              setState(() {
                                taxListModelClass.data!.removeAt(index);

                              });

                            },
                            child: Card(
                                elevation: 0,
                                child: Container(
                                  height: mHeight * .07,
                                  decoration: listPageContainerDecorationVariable,
                                  child: Center(
                                    child: ListTile(
                                      title: Text(taxListModelClass.data![index]
                                          .taxTypeName.toString(),
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                          ),
                          );

                      }),
                ],
              );
    }
    if(state is TaxListError){
        const Text("Something went wrong");
    }


    return   const Center(
              child: CircularProgressIndicator(),
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
            taxBottomSheetClass.taxModelBottomSheet(
                context: context, type: 'Add');
          }),
    ));

  }
}
