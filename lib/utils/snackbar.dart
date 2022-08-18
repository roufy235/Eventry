import 'package:flutter/material.dart';

extension BuildContextSnackbar on BuildContext {
  bool validateString(String errMsg, String variable) {
    if(variable.isNotEmpty) return true;
    ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          content: Text(errMsg),
          duration: const Duration(seconds: 4),
        )
    );
    return false;
  }
}

extension BuildContextCustomSnackbar on BuildContext {
  void customSnackBar(String text) {
    ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          content: Text(text),
          duration: const Duration(seconds: 4),
        )
    );
  }
}
