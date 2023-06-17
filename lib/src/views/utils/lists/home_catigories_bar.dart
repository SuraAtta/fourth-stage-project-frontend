import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourth_stage/src/logic/services/api/api_calls.dart';
import '../style/text_style.dart';
import '../prodects/catigory_cart_body.dart';

class HomeCatigoryProdectBar extends StatefulWidget {
  const HomeCatigoryProdectBar({Key? key, required this.i}) : super(key: key);
  final int i;

  @override
  State<HomeCatigoryProdectBar> createState() => _HomeCatigoryProdectBarState();
}

class _HomeCatigoryProdectBarState extends State<HomeCatigoryProdectBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(BackEnd.apiCategory[widget.i].name,
                style: Text_Style.getstyle(
                    fontsize: 18,
                    ColorText: Colors.black,
                    fontWeight: FontWeight.w700)),
          ),
        ),
        Container(
          height: 250,
          child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      itemCount: BackEnd.categoryItems[widget.i].length,
                      itemBuilder: (BuildContext context, index) {
                        return CatigoryCartBody( i:widget.i,index:index);
                      }),
        ),
      ],
    );
  }
}
