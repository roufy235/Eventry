
import 'package:eventry/utils/colors.dart';
import 'package:flutter/material.dart';

Color getBgColor(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.light) {
    return colorWhite;
  }
  return brandColorDark;
}

Color getTextColor(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.light) {
    return brandColor;
  }
  return brandColorD;
}
