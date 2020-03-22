import 'package:flutter/material.dart';
class TextFieldDec {

  static InputDecoration inputDec(String labelText) {
  return InputDecoration(
    fillColor: Colors.white,
    filled: true,
    labelText: labelText,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.cyan, width: 2.0),
    ),
  );
}
}