import 'package:flutter/material.dart';
import 'package:fourth_stage/src/views/utils/prodects/prodect_body.dart';

class RelatedProdectBar extends StatefulWidget {
  const RelatedProdectBar({Key? key}) : super(key: key);

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
                  itemCount: 20,
                  itemBuilder: (BuildContext context, index) {
                    return CartBody();
                  })
          )
        ]);
  }
}
