import 'package:flutter/material.dart';

import '../../../../../Constens/constens.dart';
import '../../../../../Widgets/appbar_widget.dart';
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
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const Text(
                  "Add Address",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                ),
                TextFormFieldWidget(
                  autoFocus: true,
                  obscureText: false,

                  controller: nameController,
                  labelText: 'Name',
                  textInputType: TextInputType.name,
                ),
                TextFormFieldWidget(
                  obscureText: false,

                  controller: addressController,
                  labelText: 'Address',
                  textInputType: TextInputType.streetAddress,
                ),
                TextFormFieldWidget(
                  obscureText: false,

                  controller: areaController,
                  labelText: 'Area',
                  textInputType: TextInputType.text,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel",
                            style: TextStyle(color: Color(0xffB53211)))),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Save",
                            style: TextStyle(color: Color(0xffB53211))))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
