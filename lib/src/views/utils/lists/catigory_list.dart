import 'package:flutter/cupertino.dart';
import '../../../logic/services/api/api_calls.dart';
import '../prodects/catigory_cart_body.dart';
import '../prodects/prodect_body.dart';

class CatigoryProdectsBar extends StatefulWidget {
  const CatigoryProdectsBar({Key? key, required this.i}) : super(key: key);
  final int i;
  @override
  State<CatigoryProdectsBar> createState() => _CatigoryProdectsBarState();
}

class _CatigoryProdectsBarState extends State<CatigoryProdectsBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio:MediaQuery.of(context).size.width / 500,
          ),
          itemCount:BackEnd.categoryItems[widget.i].length,
          itemBuilder: (BuildContext context, index) {
            return CatigoryCartBody(index: index, i: widget.i,);
            //}
            //return SizedBox(height: 0,width: 0,);
          }
      ),
    );
  }
}
