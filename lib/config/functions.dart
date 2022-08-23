import 'package:flutter/material.dart';
import 'package:eventry/config/config.dart';

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

Color getScaffoldColor(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.light) {
    return colorWhiteV2;
  }
  return brandColorDarkFaded;
}

Color getEventDetailAppBarBgColor(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.light) {
    return brandColor;
  }
  return brandColorDarkFaded;
}


Color getTextColor(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.light) {
    return brandColor;
  }
  return brandColorD;
}

Color getQRCodeBgColor(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.light) {
    return colorWhite;
  }
  return brandColorD;
}
