// import 'package:flutter/material.dart';
//
// class AppContent extends StatelessWidget {
//   final ValueNotifier<String> _textValue = ValueNotifier<String>('Default Text');
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Demo',),),
//       body: ChildWidget(_textValue),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog<String>(
//               context: context,
//               builder: (BuildContext dialogContext) {
//                 return Dialog(
//                   onValuePicked: (String value) {
//                     Navigator.pop(context, value);
//                   },
//                 );
//               }).then((String value) {
//             if (value != null && value.isNotEmpty) {
//               _textValue.value = value;
//             }
//           });
//         },
//       ),
//     );
//   }
// }
//
// class ChildWidget extends StatelessWidget {
//   final ValueNotifier<String> textValue;
//   ChildWidget(this.textValue);
//
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       builder: (BuildContext context, String value, Widget child) {
//         return Text(value);
//       },
//       valueListenable: textValue,
//     );
//   }
// }
//
// class Dialog extends StatelessWidget {
//   final ValueChanged<String> onValuePicked;
//   static const List<String> items = <String>[
//     'item 1',
//     'item 2',
//     'item 3',
//     'item 4'
//   ];
//   static String dropdownValue = items[0];
//
//   Dialog({ required this.onValuePicked}) : super();
//   final Function(String?) onValuePicked;
//
//   @override
//   Widget build(BuildContext context) => AlertDialog(
//     title: new Text('Item picker'),
//     content: DropdownButton<String>(
//       value: dropdownValue,
//       onChanged:
//       items: items.map<DropdownMenuItem<String>>(
//             (String value) {
//           return DropdownMenuItem<String>(
//             value: value,
//             child: Text(value),
//           );
//         },
//       ).toList(),
//     ),
//   );
// }