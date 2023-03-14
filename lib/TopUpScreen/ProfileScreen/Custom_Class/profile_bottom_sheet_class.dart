import 'package:flutter/material.dart';
import '../../Widgets/bottom_sheet_button_widget.dart';
import '../../Widgets/text_field_widget.dart';

class ProfileBottomSheetClass {
  profileModelBottomSheet(
      {required BuildContext context, required String type,required String data}) {
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFieldWidget(
                  controller: controller,
                  labelText:   "Enter your $type",
                ),

                ButtonWidget(
                  onPressed: () {
                    // check type and pass each suit controller  in api
                  },
                )
              ],
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
                  controller: controller,
                  labelText: labelText,
                ),
                TextFieldWidget(
                  controller: controllerOne,
                  labelText: labelTextOne,
                ),
                ButtonWidget(onPressed: onPressed)
              ],
            ),
          ),
        );
      },
    );
  }
}
