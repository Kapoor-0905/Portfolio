import 'package:flutter/material.dart';

class Styles {
  final String fontFamilyLight;
  final String fontFamilyRegular;
  final String fontFamilyMedium;
  final String fontFamilySemiBold;
  final String fontFamilyBold;
  final String fontFamilyExtraBold;
  final String fontFamilyBlack;

  Styles._({
    required this.fontFamilyLight,
    required this.fontFamilyRegular,
    required this.fontFamilyMedium,
    required this.fontFamilySemiBold,
    required this.fontFamilyBold,
    required this.fontFamilyExtraBold,
    required this.fontFamilyBlack,
  });

  Styles.nunito()
      : this._(
          fontFamilyLight: "NunitoLight",
          fontFamilyRegular: "NunitoRegular",
          fontFamilyMedium: "NunitoMedium",
          fontFamilySemiBold: "NunitoSemiBold",
          fontFamilyBold: "NunitoBold",
          fontFamilyExtraBold: "NunitoExtraBold",
          fontFamilyBlack: "NunitoBlack",
        );

  TextStyle lightText({required double fontSize, Color color = Colors.white}) {
    return TextStyle(
      fontFamily: fontFamilyLight,
      fontSize: fontSize,
      color: color,
    );
  }

  TextStyle regularText(
      {required double fontSize, Color color = Colors.white}) {
    return TextStyle(
      fontFamily: fontFamilyRegular,
      fontSize: fontSize,
      color: color,
    );
  }

  TextStyle mediumText({required double fontSize, Color color = Colors.white}) {
    return TextStyle(
      fontFamily: fontFamilyMedium,
      fontSize: fontSize,
      decoration: TextDecoration.none,
      color: color,
    );
  }

  TextStyle semiBoldText(
      {required double fontSize, Color color = Colors.white}) {
    return TextStyle(
      fontFamily: fontFamilySemiBold,
      fontSize: fontSize,
      color: color,
    );
  }

  TextStyle boldText({
    required double fontSize,
    Color color = Colors.white,
    double letterSpacing = 0.7,
  }) {
    return TextStyle(
      fontFamily: fontFamilyBold,
      letterSpacing: letterSpacing,
      fontSize: fontSize,
      color: color,
    );
  }

  TextStyle extraBoldText({
    required double fontSize,
    Color color = Colors.white,
    double letterSpacing = 0.7,
  }) {
    return TextStyle(
      fontFamily: fontFamilyExtraBold,
      letterSpacing: letterSpacing,
      fontSize: fontSize,
      color: color,
    );
  }

  TextStyle blackText({required double fontSize, Color color = Colors.white}) {
    return TextStyle(
      fontFamily: fontFamilyBlack,
      fontSize: fontSize,
      color: color,
    );
  }
}
