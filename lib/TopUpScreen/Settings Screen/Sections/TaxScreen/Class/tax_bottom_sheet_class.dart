import 'package:flutter/material.dart';
import '../../../../Widgets/bottom_sheet_button_widget.dart';
import '../../../../Widgets/text_field_widget.dart';

class TaxBottomSheetClass {
  TextEditingController nameController = TextEditingController();
  TextEditingController salesTaxController = TextEditingController();
  TextEditingController purchaseTaxController = TextEditingController();

  taxModelBottomSheet(   {required BuildContext context }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Add Vat",
                  style: TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 18),
                ),
                TextFieldWidget(
                    controller: nameController, labelText: 'Name'),
                TextFieldWidget(
                    controller: salesTaxController,
                    labelText: 'Sales Tax'),
                TextFieldWidget(
                    controller: purchaseTaxController,
                    labelText: 'Purchase TAX'),
                ButtonWidget(onPressed: () {})
              ],
            ),
          ),
        );
      },
    );
  }

}
