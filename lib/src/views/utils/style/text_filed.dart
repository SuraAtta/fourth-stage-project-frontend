import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourth_stage/src/views/utils/style/text_style.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';


class Text_Field1 extends StatelessWidget {
  Text_Field1({
    Key? key,
    required this.MyController,
    required this.hintText,
    required this.icon,
    required this.labelText,
    required this.pass,
    required this.onChanged,
    this.keyboardType,
  }) : super(key: key);
  final TextEditingController MyController;
  final RxString hintText;
  final RxString labelText;
  final Widget icon;
  final bool pass;
  static String text1 = '';
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        width: 280,
        height: 50,
        child: TextFormField(
            textDirection: TextDirection.rtl,
            onChanged: (text) {
              onChanged!(text);
            },
            keyboardType: keyboardType,
            obscureText: pass,

            controller: MyController,
            decoration: InputDecoration(
                fillColor: Colorsapp.lGray,
                filled: true,
                hintTextDirection: TextDirection.rtl,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Colorsapp.themeColor, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.black26,
                  ),
                ),
                //errorBorder:InputDecoration.errorText,
                prefixIcon: icon,
                hintText: " $hintText   ",
                hintStyle:GoogleFonts.cairo(
                    textStyle:
                    Text_Style.getstyle(fontsize: 16, ColorText: Colorsapp.dGray, fontWeight:FontWeight.w500)),
                contentPadding: const EdgeInsets.only(top: 10, right: 12)),
            onTap: () {}),
      ),
    );
  }

}
