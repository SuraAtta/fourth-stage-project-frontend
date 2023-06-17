import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/style/colors.dart';

class ProdectColors extends StatelessWidget {
  const ProdectColors({
    Key? key,
    required this.color,
    required this.p,
  }) : super(key: key);
  final int color;
  final int p;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      color: Colors.red,
      margin: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black26),
        //  color: Color(int.parse(BackEnd.Prodects3[p].colors[color].colorCode)),
          color: Colorsapp.themeColor,
          shape: BoxShape.circle
      ),
    );
  }
}
