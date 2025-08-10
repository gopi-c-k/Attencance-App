import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

TextStyle SafeGoogleFont(
    String fontFamily, {
      TextStyle? textStyle,
      Color? color,
      Color? backgroundColor,
      double? fontSize,
      FontWeight? fontWeight,
      FontStyle? fontStyle,
      double? letterSpacing,
      double? wordSpacing,
      TextBaseline? textBaseline,
      double? height,
      Locale? locale,
      Paint? foreground,
      Paint? background,
      List<Shadow>? shadows,
      List<FontFeature>? fontFeatures,
      TextDecoration? decoration,
      Color? decorationColor,
      TextDecorationStyle? decorationStyle,
      double? decorationThickness,
    }) {
  // Ensure fontSize is never 0 or null
  double safeFontSize = fontSize ?? 14.0;
  if (safeFontSize <= 0) safeFontSize = 14.0;

  // Ensure height is never NaN or invalid
  double? safeHeight = height;
  if (safeHeight != null && (safeHeight.isNaN || safeHeight <= 0)) {
    safeHeight = 1.2;
  }

  return GoogleFonts.getFont(
    fontFamily,
    textStyle: textStyle,
    color: color,
    backgroundColor: backgroundColor,
    fontSize: safeFontSize,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    height: safeHeight,
    locale: locale,
    foreground: foreground,
    background: background,
    shadows: shadows,
    fontFeatures: fontFeatures,
    decoration: decoration,
    decorationColor: decorationColor,
    decorationStyle: decorationStyle,
    decorationThickness: decorationThickness,
  );
}

// TextStyle SafeGoogleFont(
//   String fontFamily, {
//   TextStyle? textStyle,
//   Color? color,
//   Color? backgroundColor,
//   double? fontSize,
//   FontWeight? fontWeight,
//   FontStyle? fontStyle,
//   double? letterSpacing,
//   double? wordSpacing,
//   TextBaseline? textBaseline,
//   double? height,
//   Locale? locale,
//   Paint? foreground,
//   Paint? background,
//   List<Shadow>? shadows,
//   List<FontFeature>? fontFeatures,
//   TextDecoration? decoration,
//   Color? decorationColor,
//   TextDecorationStyle? decorationStyle,
//   double? decorationThickness,
// }) {
//   try {
//     return GoogleFonts.getFont(
//       fontFamily,
//       textStyle: textStyle,
//       color: color,
//       backgroundColor: backgroundColor,
//       fontSize: fontSize,
//       fontWeight: fontWeight,
//       fontStyle: fontStyle,
//       letterSpacing: letterSpacing,
//       wordSpacing: wordSpacing,
//       textBaseline: textBaseline,
//       height: height,
//       locale: locale,
//       foreground: foreground,
//       background: background,
//       shadows: shadows,
//       fontFeatures: fontFeatures,
//       decoration: decoration,
//       decorationColor: decorationColor,
//       decorationStyle: decorationStyle,
//       decorationThickness: decorationThickness,
//     );
//   } catch (ex) {
//     return GoogleFonts.getFont(
//       "Source Sans Pro",
//       textStyle: textStyle,
//       color: color,
//       backgroundColor: backgroundColor,
//       fontSize: fontSize,
//       fontWeight: fontWeight,
//       fontStyle: fontStyle,
//       letterSpacing: letterSpacing,
//       wordSpacing: wordSpacing,
//       textBaseline: textBaseline,
//       height: height,
//       locale: locale,
//       foreground: foreground,
//       background: background,
//       shadows: shadows,
//       fontFeatures: fontFeatures,
//       decoration: decoration,
//       decorationColor: decorationColor,
//       decorationStyle: decorationStyle,
//       decorationThickness: decorationThickness,
//     );
//   }
// }
