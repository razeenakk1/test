import 'package:flutter/material.dart';
import '../../Widgets/bottom_sheet_button_widget.dart';
import '../../Widgets/text_field_widget.dart';

class ProfileBottomSheetClass {

  profileModelBottomSheet(
      {required BuildContext context, required String type,required String data}) {
    final formKey = GlobalKey<FormState>();

    TextEditingController controller = TextEditingController()
      ..text = data;
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
                  TextFieldWidget(
                    textInputAction: TextInputAction.done,
                    controller: controller,
                    labelText:   "Enter your $type",
                    validator: (val ) {
                      if (val == null || val.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),

                  ButtonWidget(
                    onPressed: () {
                      /// check type and pass apis
                      formKey.currentState!.validate() ? Navigator.pop(context): const SizedBox();
                      // check type and pass each suit controller  in api
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  passwordModelBottomSheet({
    required BuildContext context,
    required String labelText,
    required TextEditingController controller,
    required Function() onPressed,
    required String headingText,
    required String labelTextOne,
    required TextEditingController controllerOne,
    required Key formKey,
  }) {
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
              key: formKey ,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    headingText,
                    style:
                    const TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                  ),
                  TextFieldWidget(
                    textInputAction: TextInputAction.next,
                    controller: controller,
                    labelText: labelText,
                    validator: (val ) {
                      if (val == null || val.isEmpty) {
                        return 'This field is required';
                      }  if (val.length < 8 ) {
                        return 'Too short';
                      }
                      return null;
                    },
                  ),
                  TextFieldWidget(
                      textInputAction: TextInputAction.done,
                    controller: controllerOne,
                    labelText: labelTextOne,

                      validator: (val ) {
                        if (val == null || val.isEmpty) {
                          return 'This field is required';
                        }
                        if (val.length < 8) {
                          return 'Too short';
                        }
                        return null;
                      }

                  ),
                  ButtonWidget(onPressed: onPressed)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
