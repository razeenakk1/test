import 'package:flutter/material.dart';

Widget toggleButton(
    {required bool value, required void Function(bool) onChanged}) {
  return Switch(
      activeTrackColor: const Color(0xffCC3E14),
      inactiveThumbColor: const Color(0xffCC3E14),
      inactiveTrackColor: Colors.grey.shade400,
      activeColor: Colors.white,
      value: value,
      onChanged: onChanged);
}
