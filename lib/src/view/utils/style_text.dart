import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: FontConstant.fontFamily,
    color: color,
  );
}
//light style

TextStyle getLightStyle({
  double fontSize = FontSize.s12,
  FontWeight fontWeight = FontWeighManager.light,
  required Color color,
}) {
  return _getTextStyle(fontSize, fontWeight, color);
}

// regular style
TextStyle getRegularStyle({
  double fontSize = FontSize.s12,
  FontWeight fontWeight = FontWeighManager.regular,
  required Color color,
}) {
  return _getTextStyle(fontSize, fontWeight, color);
}
// regular style
TextStyle getMediumStyle({
  double fontSize = FontSize.s16,
  FontWeight fontWeight = FontWeighManager.medium,
  required Color color,
}) {
  return _getTextStyle(fontSize, fontWeight, color);
}

// bold style
TextStyle getBoldStyle({
  double fontSize = FontSize.s18,
  FontWeight fontWeight = FontWeighManager.bold,
  required Color color,
}) {
  return _getTextStyle(fontSize, fontWeight, color);
}

// semiBold style
TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s16,
  FontWeight fontWeight = FontWeighManager.semiBold,
  required Color color,
}) {
  return _getTextStyle(fontSize, fontWeight, color);
}

