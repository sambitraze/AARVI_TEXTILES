import 'package:flutter/material.dart'; 
class TextFieldDec {
  static InputDecoration inputDec(String labelText) {
    return InputDecoration(
      fillColor: Colors.grey[200],
      filled: true,
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.black),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
      ),
    );
  }
}
