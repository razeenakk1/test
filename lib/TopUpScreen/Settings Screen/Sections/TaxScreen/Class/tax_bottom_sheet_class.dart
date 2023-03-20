import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Widgets/bottom_sheet_button_widget.dart';
import '../../../../Widgets/text_field_widget.dart';

class TaxBottomSheetClass {
  TextEditingController nameController = TextEditingController();
  TextEditingController salesTaxController = TextEditingController();
  TextEditingController purchaseTaxController = TextEditingController();

  taxModelBottomSheet({required BuildContext context, required String type}) {
    final formKey = GlobalKey<FormState>();
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                    controller: nameController,
                    labelText: 'Name',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter name';
                      }
                      return null;
                    }, textInputAction: TextInputAction.next,
                  ),
                  TextFieldWidget(
                    controller:  salesTaxController  ,
                    labelText: 'Sales Tax',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Sales tax is empty';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  TextFieldWidget(
                    controller: purchaseTaxController,
                    labelText: 'Purchase TAX',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Purchase tax is empty';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                  ),
                  ButtonWidget(onPressed: () {
                    /// edit and add tax api check with type
                    formKey.currentState!.validate() == true
                        ? Navigator.pop(context)
                        : const SizedBox();
                  })
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
