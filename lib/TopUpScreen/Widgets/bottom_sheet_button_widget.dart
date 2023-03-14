import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key, required this.onPressed
  });
  final Function() onPressed ;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("cancel", style: TextStyle(color: Color(0xffB53211)),
            )),
        TextButton(
            onPressed: onPressed,
            child: const Text("save", style: TextStyle(color: Color(0xffB53211)),)),
      ],
    );
  }
}