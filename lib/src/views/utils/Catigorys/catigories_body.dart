import 'package:flutter/material.dart';

import '../style/colors.dart';
import '../style/text_style.dart';

class CatigoryBody extends StatefulWidget {
  const CatigoryBody({Key? key}) : super(key: key);

  @override
  State<CatigoryBody> createState() => _CatigoryBodyState();
}

class _CatigoryBodyState extends State<CatigoryBody> {
  @override
  Widget build(BuildContext context) {
    return 
      Column(
        children: [
          Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: double.maxFinite,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
          ),
    ),
          Text('صنف',style: Text_Style.getstyle(
              fontsize: 14,
              ColorText: Colorsapp.dGray,
              fontWeight: FontWeight.w700)),
        ],
      );
  }
}
