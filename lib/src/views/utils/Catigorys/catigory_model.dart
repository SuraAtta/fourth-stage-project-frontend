import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../style/text_style.dart';

class CatigoryButtons extends StatefulWidget {
  final String text;
  final void Function() onPressed;
  // final RxBool isClicked = false.obs;
  CatigoryButtons({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CatigoryButtons> createState() => _CatigoryButtonsState();
}

class _CatigoryButtonsState extends State<CatigoryButtons> {
  @override
  Widget build(BuildContext context) {
    RxBool isClicked = false.obs;
    return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8, left: 8),
        child: Column(
          children: [
            Container(
              height: 45,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                onPressed: () {
                  setState(() {});
                  madeAsClicked();
                  widget.onPressed();
                },
                child: Container(
                  height: 10,
                  width: 10,
                ),
              ),
            ),
            Text(widget.text,
                style: Text_Style.getstyle(
                    fontsize: 13,
                    ColorText: Colors.black,
                    fontWeight: FontWeight.w700)),
          ],

          // child: RawMaterialButton(
          //   onPressed: () {
          //     onPressed();
          //
          //
          //   },
          //   fillColor: Colors.white,
          //   elevation: 0,
          //   shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(12)),
          //   child: Text(
          //     text,
          //     style: GoogleFonts.inter(
          //         fontSize: 16,
          //         color: Colors.black,
          //         fontWeight: FontWeight.bold),
          //   ),
          // )
        ));
  }

  bool? clicked = false;

  madeAsClicked() {
    if (clicked == false) {
      clicked = true;
    } else
      clicked = false;
  }
}
