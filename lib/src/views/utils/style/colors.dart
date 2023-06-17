import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fourth_stage/src/logic/services/api/api_calls.dart';
class Colorsapp{
  static Color themeColor = Color(int.parse(BackEnd.apicolorLogo[0].colorCode));
 //static Color themeColor = Color.fromRGBO(117, 117, 118, 1);
  static Color bgColor = Color.fromRGBO(239, 244, 255, 1);
  static Color lGray = Color.fromRGBO(221, 224, 238, 1);
  static Color dGray = Color.fromRGBO(117, 117, 118, 1);
  static Color red = Color(0XFFFF0000);
}
// import 'dart:ui';


class Colorsapp2 {

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.red,
      primaryColor: isDarkTheme ? Colors.black : Colors.white,
      accentColor:isDarkTheme? Color.fromRGBO(221, 224, 238, 1):Color.fromRGBO(117, 117, 118, 1),
      backgroundColor: isDarkTheme ? Color.fromRGBO(49, 57, 69, 1) : Color.fromRGBO(239, 244, 255, 1),
      indicatorColor: isDarkTheme ? Color.fromRGBO(221, 224, 238, 1): Colors.black,
      buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),

      hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),

      highlightColor: isDarkTheme ? Colors.white : Color.fromRGBO(221, 224, 238, 1),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ?  Color.fromRGBO(85, 94, 118, 1): Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ), textSelectionTheme: TextSelectionThemeData(selectionColor: isDarkTheme ? Colors.black : Colors.black),
    );

  }
}