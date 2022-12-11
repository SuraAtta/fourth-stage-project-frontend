import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
class Text_Style {
  static TextStyle? getstyle(
      {required double? fontsize,
        required Color? ColorText,
        required FontWeight? fontWeight}
      )
  {
    return GoogleFonts.cairo(
      textStyle: TextStyle(
          fontSize: fontsize,
          color: ColorText,
          letterSpacing: 1,
          fontWeight: fontWeight),
    );
  }
}
