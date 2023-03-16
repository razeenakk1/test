// import 'package:flutter/material.dart';
//
// import '../Widgets/bottom_sheet_button_widget.dart';
// import '../Widgets/text_field_widget.dart';
// class BottomSheetClass {
//   void displayBottomSheet({
//     required BuildContext context,
//     required String labelText,
//     required TextEditingController controller,
//     required Function() onPressed,
//     String? headingText}) {
//     showModalBottomSheet(
//
//         isScrollControlled: true,
//         isDismissible: true,
//         context: context,
//         constraints: BoxConstraints.tight(Size(MediaQuery.of(context).size.width,
//             MediaQuery.of(context).size.height * .6)),
//         builder: (ctx) {
//           final MediaQueryData mediaQueryData = MediaQuery.of(context);
//           return Padding(
//             padding: EdgeInsets.only(bottom: MediaQuery
//                 .of(context)
//                 .viewInsets
//                 .bottom),
//             child: SingleChildScrollView(
//               child: Container(
//                 padding:
//                 const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//                 child: Form(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         headingText ?? "",
//                         style: const TextStyle(
//                             fontWeight: FontWeight.w900, fontSize: 18),
//                       ),
//                       TextFieldWidget(
//                         controller: controller,
//                         labelText: labelText,
//                         validator: (val ) {
//                           if (val == null || val.isEmpty) {
//                             return 'Please enter name';
//                           }
//                           return null;
//                         },
//                       ),
//                       ButtonWidget(
//                         onPressed: onPressed,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         });
//   }
//
//
//    bottomSheet({
//     required BuildContext ctx,
//     required String labelText,
//     required TextEditingController controller,
//     required Function() onPressed,
//     required GlobalKey<ScaffoldState> scaffoldKey,
//     String? headingText}) {
//     scaffoldKey.currentState!.showBottomSheet((context) {
//
//
//       return     Text(
//         headingText ?? "",
//         style: const TextStyle(
//             fontWeight: FontWeight.w900, fontSize: 18),
//       );
//     });
//   }
//
// }
