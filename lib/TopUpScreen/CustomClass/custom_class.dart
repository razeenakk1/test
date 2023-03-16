// import 'package:flutter/material.dart';
//
// import '../Widgets/bottom_sheet_button_widget.dart';
// import '../Widgets/text_field_widget.dart';
//
// class CustomClass {
//   void displayBottomSheet(
//       {required BuildContext context,
//         required String labelText,
//         required TextEditingController controller,
//         required  Function() onPressed, String? headingText,
//
//       }) {
//     showModalBottomSheet(
//         isScrollControlled: true,
//         isDismissible: false,
//         context: context,
//         builder: (ctx) {
//           final MediaQueryData mediaQueryData = MediaQuery.of(context);
//           return Padding(
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
//                       Text(headingText ?? "",style: const TextStyle(fontWeight: FontWeight.w900,fontSize: 18),),
//                       TextFieldWidget(controller: controller, labelText: labelText,
//                         validator: (val ) {
//                           if (val == null || val.isEmpty) {
//                             return 'Please enter name';
//                           }
//                           return null;
//                         },
//                       ),
//
//                       ButtonWidget(onPressed:onPressed,)
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         });
//   }
// }