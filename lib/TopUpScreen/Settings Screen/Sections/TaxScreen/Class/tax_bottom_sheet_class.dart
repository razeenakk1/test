import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Bloc/Tax/tax_bloc.dart';
import '../../../../TopUpApiSection/ModelClasses/TaxModelClasses/CreateTaxModelClass.dart';
import '../../../../Widgets/bottom_sheet_button_widget.dart';
import '../../../../Widgets/text_field_widget.dart';

class TaxBottomSheetClass {
  late CreateTaxModelClass createTaxModelClass;

  taxModelBottomSheet(
      {required BuildContext context,
      required String type,
      String? taxName,
      String? salesTax,
      String? purchaseTax,
      String? id}) {
    TextEditingController nameController = TextEditingController()
      ..text = taxName.toString();
    TextEditingController salesTaxController = TextEditingController()
      ..text = salesTax.toString();
    TextEditingController purchaseTaxController = TextEditingController()
      ..text = purchaseTax.toString();
    TextEditingController addNameTaxController = TextEditingController();
    TextEditingController addSaleTaxController = TextEditingController();
    TextEditingController addPurchaseTaxController = TextEditingController();

    final formKey = GlobalKey<FormState>();
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return MultiBlocListener(
          listeners: [
            BlocListener<TaxBloc, TaxState>(
              listener: (context, state) {
                if (state is TaxCreateLoading) {
                  const CircularProgressIndicator();
                }
                if (state is TaxCreateLoaded) {
                  createTaxModelClass =
                      BlocProvider.of<TaxBloc>(context).createTaxModelClass;
                  if (createTaxModelClass.statusCode == 6000) {
                    nameController.clear();
                    purchaseTaxController.clear();
                    salesTaxController.clear();
                    Navigator.pop(context);
                    BlocProvider.of<TaxBloc>(context)
                        .add(ListTaxEvent(search: ''));
                  }
                }
                if (state is TaxCreateError) {
                  const Text("Something went wrong");
                }
              },
            ),
            BlocListener<TaxBloc, TaxState>(
              listener: (context, state) {
                if (state is EditTaxLoading) {
                  const CircularProgressIndicator();
                }
                if (state is EditTaxLoaded) {
                  Navigator.pop(context);
                  BlocProvider.of<TaxBloc>(context)
                      .add(ListTaxEvent(search: ''));
                }
                if (state is EditTaxError) {
                  const Text("Something went wrong");
                }
              },
            ),
          ],
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "$type Vat",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 18),
                      ),
                    ),
                    TextFieldWidget(
                      controller:
                          type == "Add" ? addNameTaxController : nameController,
                      labelText: 'Name',
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    TextFieldWidget(
                      controller: type == "Add"
                          ? addSaleTaxController
                          : salesTaxController,
                      labelText: 'Sales Tax',
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Sales tax is empty';
                        }
                        return null;
                      },
                      textInputType:  const TextInputType.numberWithOptions(
                          decimal: true, signed: true),
                     list: [
                        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,8}')),
                      ],

                      textInputAction: TextInputAction.next,
                    ),
                    TextFieldWidget(
                      controller: type == "Add"
                          ? addPurchaseTaxController
                          : purchaseTaxController,
                      labelText: 'Purchase TAX',
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Purchase tax is empty';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                      textInputType:  const TextInputType.numberWithOptions(
                          decimal: true, signed: true),
                      list: [
                        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,8}')),
                      ],
                    ),
                    ButtonWidget(onPressed: () {
                      if (formKey.currentState!.validate() == true &&
                          type == "Add") {
                        BlocProvider.of<TaxBloc>(context).add(CreateTaxEvent(
                            texName: addNameTaxController.text,
                            purchaseTax: addPurchaseTaxController.text,
                            saleTax: addSaleTaxController.text));
                      }
                      if (formKey.currentState!.validate() == true &&
                          type == "Edit") {
                        BlocProvider.of<TaxBloc>(context).add(EditTaxEvent(
                            id: id.toString(),
                            texName: nameController.text,
                            purchaseTax: purchaseTaxController.text,
                            saleTax: salesTaxController.text));
                      } else {
                        null;
                      }
                    }

                        )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
