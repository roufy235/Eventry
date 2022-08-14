
import 'package:eventry/utils/colors.dart';
import 'package:flutter/material.dart';

const String boxName = 'eventryBox';
const String boxIsOnboardingViewed = 'isOnboardingViewed';

Color getBgColor(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.light) {
    return colorWhite;
  }
  return brandColorDark;
}

Color getFadedBgColor(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.light) {
    return brandColorFaded;
  }
  return brandColorDarkFaded;
}

Color getTextColor(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.light) {
    return brandColor;
  }
  return brandColorD;
}

bool validateString(BuildContext context, String text, String valStr) {
  if(valStr.isNotEmpty) return true;
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: const Duration(seconds: 4),
      )
  );
  return false;
}

void customSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: const Duration(seconds: 4),
      )
  );
}
