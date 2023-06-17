import 'package:flutter/cupertino.dart';
import 'package:fourth_stage/src/views/ui/single_prodect_page/colors/prodect_colors.dart';

class ColorList extends StatelessWidget {
  const ColorList({Key? key, required this.prodect}) : super(key: key);
  final int prodect;
  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
        scrollDirection: Axis.horizontal,
        //itemCount:BackEnd.Prodects3[prodect].colors.length,
        itemCount:4,
        itemBuilder: (BuildContext context, int index) {
            return ProdectColors( p:0,color: index,);
        },
      );
  }
}
