import 'package:flutter/material.dart';
import 'package:fourth_stage/src/views/utils/prodects/prodect_body.dart';

import '../../../logic/services/api/api_calls.dart';

class RelatedProdectBar extends StatefulWidget {
  const RelatedProdectBar({Key? key, required this.i}) : super(key: key);
  final int i;
  @override
  State<RelatedProdectBar> createState() => _RelatedProdectBarState();
}

class _RelatedProdectBarState extends State<RelatedProdectBar> {
  @override
  Widget build(BuildContext context) {
    return Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  itemCount: BackEnd.Prodects3.length,
                  itemBuilder: (BuildContext context, index) {
                    if(BackEnd.Prodects3[widget.i].category.name.toString() == BackEnd.Prodects3[index].category.name.toString() && widget.i != index){
                    return CartBody(index: index,);
                    }
                    return SizedBox( width: 0,height: 0,);
                  })
          )
        ]);
  }
}
