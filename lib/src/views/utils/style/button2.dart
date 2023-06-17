import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourth_stage/src/views/utils/style/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';



class Button2 extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  Button2 ({Key? key,
    required this.text, required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 10 ,left: 30,right: 30),
        width: 230,
        height: 35,
        child:  RawMaterialButton(
          onPressed: () {
            onPressed();
          },
          fillColor:  Colorsapp.themeColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Text(
                text,
                style: Text_Style.getstyle(fontsize: 18, ColorText: Colors.white, fontWeight:FontWeight.w700)
            ),
          ),
        ));

  }}
