
import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.trailing,
    required this.widget,
    required this.labelText,
    required this.controller,
    required this.inputBorder,
  });

  final Widget widget;
  final String labelText;
  final IconButton trailing;
  final TextEditingController controller;
  // final FocusNode focusNode;
  final InputBorder inputBorder;

  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;
    return Container(
      height: MediaQuery.of(context).size.height * .08,
      padding: EdgeInsets.only(left: mWidth * .03, right: mWidth * .01),
      child: ListTile(
        leading: Padding(
            padding: EdgeInsets.only(top: mHeight * .01), child: widget),
        title: Transform(
            transform: Matrix4.translationValues(-16, 0.0, 0.0),
            child: TextFormField(
              style: const TextStyle(
                  fontWeight: FontWeight.bold
              ),
              readOnly: true,
              controller: controller,
              decoration: InputDecoration(
                labelText: labelText,
                    labelStyle: const TextStyle(color: Colors.grey),
                  border: inputBorder,
              ),
            )),
        trailing: Padding(
            padding: EdgeInsets.only(top: mHeight * .01), child: trailing),
      ),
    );
  }
}
