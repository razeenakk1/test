import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../Constens/constens.dart';
import '../../../../../Widgets/appbar_widget.dart';
import '../../../../../Widgets/bottom_sheet_button_widget.dart';
import '../../../../../Widgets/text_form_field_widget.dart';


class EditAddresScreen extends StatelessWidget {
  EditAddresScreen({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController()..text = "Home";
  final  TextEditingController addressController = TextEditingController()
    ..text = "Kunnummal House \n"
        "karakkkunn \n"
        "malappuram \n"
        "kerala \n"
        "676123";
 final TextEditingController areaController = TextEditingController()..text = "Doha";
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: backGroundColor,
        appBar: appBar(appBarTitle: 'Edit Ledger'),
        body: Card(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            height: mHeight,
            child: Form(
              key: formKey,

              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                   Text(
                    "Add Address",
                style: GoogleFonts.poppins(textStyle: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                )),
                  TextFormFieldWidget(
                    readOnly: false,

                    textInputAction: TextInputAction.next,
                    validator: (val ) {
                      if (val == null || val.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    autoFocus: true,
                    obscureText: false,

                    controller: nameController,
                    labelText: 'Name',
                    textInputType: TextInputType.name,
                  ),
                  TextFormFieldWidget(
                    readOnly: false,

                    textInputAction: TextInputAction.next,
                    validator: (val ) {
                      if (val == null || val.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    obscureText: false,

                    controller: addressController,
                    labelText: 'Address',
                    textInputType: TextInputType.streetAddress,
                  ),
                  TextFormFieldWidget(
                    readOnly: false,

                    textInputAction: TextInputAction.done,
                    validator: (val ) {
                      if (val == null || val.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    obscureText: false,

                    controller: areaController,
                    labelText: 'Area',
                    textInputType: TextInputType.text,
                  ),
              ButtonWidget(onPressed: () {

                formKey.currentState!.validate() == true
                    ? Navigator.pop(context)
                    : const SizedBox();
              }
              ) ],
              ),
            ),
          ),
        ));
  }
}
