import 'package:flutter/material.dart';

import '../../Widgets/bottom_sheet_button_widget.dart';
import '../../Widgets/text_field_widget.dart';




class CommonBottomSheetClass {
  TextEditingController controller = TextEditingController()
    ..text = "controller";
  final formKey = GlobalKey<FormState>();



  settingsBottomSheetFunction(  {required BuildContext context, required String type , required String addOrEdit}) {
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
              key:formKey ,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextWidget(text: "$addOrEdit $type"),
                  TextFieldWidget(
                    controller: controller,
                    labelText: 'Enter $type Name',
                    validator: (val ) {
                      if (val == null || val.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    }, textInputAction: TextInputAction.done,
                  ),
                  ButtonWidget(
                    onPressed: () {
                      /// check type an addOrEdit type and pass suit apis
                      formKey.currentState!.validate() ? Navigator.pop(context):const SizedBox();

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



















  //
  // openCommonBottomSheetController(
  //     {required BuildContext context,
  //     required String type,
  //     required GlobalKey<ScaffoldState> scaffoldKey}) {
  //   scaffoldKey.currentState!.showBottomSheet((BuildContext ctx) {
  //     return Padding(
  //       padding:
  //           EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
  //       child: SingleChildScrollView(
  //         child: Container(
  //          // color: Colors.white,
  //           padding:
  //               const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
  //           child: Form(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.stretch,
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 TextWidget(
  //                     text: type == "Area" ? "Add Area" : "Create $type"),
  //                 TextFieldWidget(
  //                   controller: controller,
  //                   labelText: 'Enter $type Name',
  //                 ),
  //                 ButtonWidget(
  //                 onPressed:   () {
  //                   // check type and pass each suit controller  in api
  //                 },
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     );
  //   });
  // }


  // void commonFloatingActionButtonBottomSheetFunction(
  //     {required BuildContext context, required String type}) {
  //   showModalBottomSheet(
  //     elevation: 30,
  //       isScrollControlled: true,
  //       isDismissible: true,
  //       context: context,
  //       builder: (ctx) {
  //         final MediaQueryData mediaQueryData = MediaQuery.of(context);
  //         return
  //           Padding(
  //             padding: mediaQueryData.viewInsets,
  //             child: SingleChildScrollView(
  //               child: Container(
  //                 padding: const EdgeInsets.symmetric(
  //                     horizontal: 20.0, vertical: 20.0),
  //                 child: Form(
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.stretch,
  //                     mainAxisSize: MainAxisSize.min,
  //                     children: [
  //                       TextWidget(text: type == "Area" ? "Add Area" :"Create $type"),
  //                       TextFieldWidget(
  //                         controller: controller,
  //                         labelText: 'Enter $type Name',
  //                       ),
  //                       ButtonWidget(
  //                         onPressed: () {
  //
  //
  //                         },
  //                       )
  //
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           );
  //       });
  // }
}

class TextWidget extends StatelessWidget {
  final String text;

  const TextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
    );
  }
}
