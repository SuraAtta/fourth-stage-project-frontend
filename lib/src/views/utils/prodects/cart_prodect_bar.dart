import 'package:flutter/cupertino.dart';
import 'package:fourth_stage/src/views/utils/prodects/cart_prodect_body.dart';

class CartProdectBar extends StatefulWidget {
  const CartProdectBar({Key? key}) : super(key: key);

  @override
  State<CartProdectBar> createState() => _CartProdectBarState();
}

class _CartProdectBarState extends State<CartProdectBar> {
  @override
  Widget build(BuildContext context) {
    return Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, index) {
                    return CartProdectBody();
                  })
          )
        ]);
  }
}
