// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

abstract final class AppConstants {
  //  General
  static const double verticalSpaceSmall = 8;
  static const double horizontalSpaceSmall = 8;

  //  Colors
  static const int maxChannelBrightness = 256; // 1-256
  static const int alphaBackground = 255; // 0-255
  static const int initialRChannelValue = 0; // 0-255
  static const int initialGChannelValue = 0; // 0-255
  static const int initialBChannelValue = 0; // 0-255
  static const double luminanceThreshold = 0.4;

  //  Card
  static const double cardBackgroundOpacity = 0.2;
  static const double cardBorderRadius = 20;
  static const double cardPaddingHorizontal = 30;
  static const double cardPaddingVertical = 20;
  static const double copyIconSize = 14;
  static const int snackBarDurationSeconds = 2;

  //  Strings
  static const String titleText = 'Hello there';
  static const String hintText = 'Tap anywhere to change color';
  static const String hexCopiedText = 'HEX copied to clipboard';

  //  Text styles
  static const double titleFontSize = 32;
  static const double rgbFontSize = 16;
  static const double hintFontSize = 14;
  static const double hintOpacity = 0.7;

  static TextStyle titleStyle(Color color) => TextStyle(
    fontSize: titleFontSize,
    fontWeight: FontWeight.bold,
    color: color,
  );

  static TextStyle rgbStyle(Color color) => TextStyle(
    fontSize: rgbFontSize,
    color: color,
  );

  static TextStyle hintStyle(Color color) => TextStyle(
    fontSize: hintFontSize,
    color: color.withValues(alpha: hintOpacity),
  );
}
