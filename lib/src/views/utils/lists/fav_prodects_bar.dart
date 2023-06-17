import 'package:flutter/cupertino.dart';
import '../../../logic/services/api/api_calls.dart';
import '../prodects/fav_cart.dart';

class FavProdectsBar extends StatelessWidget {
  const FavProdectsBar({Key? key}) : super(key: key);
  static List favList = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio:MediaQuery.of(context).size.width / 500,
          ),
          itemCount:FavProdectsBar.favList.length,
          itemBuilder: (BuildContext context, index) {
              return FavCart(index: index,);
          }
      ),
    );
  }
}
