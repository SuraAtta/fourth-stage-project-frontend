import 'package:flutter/cupertino.dart';
import 'package:fourth_stage/src/views/utils/prodects/cart_prodect_body.dart';
import 'package:get/get.dart';

import '../../../logic/services/api/api_calls.dart';
class CartProdectBar extends StatelessWidget {
  const CartProdectBar({Key? key}) : super(key: key);
  static List cartList = [];

  @override
  Widget build(BuildContext context) {
    return Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: CartProdectBar.cartList.length,
                  itemBuilder: (BuildContext context, index) {
                      for(int i=0;i<=BackEnd.Prodects3.length;i++){
                    if(CartProdectBar.cartList[index].id == CartProdectBar.cartList[i].id)
                    return CartProdectBody(index:index);
                  }
                   return SizedBox(width: 0,height: 0,);
                    }
                    )
          )
        ]);
  }
  Rx<double> getCartTotalPrice() {
    Rx<double> total = 0.0.obs;
    for(int i = 0 ; i < CartProdectBar.cartList.length; i++){
        total += CartProdectBar.cartList[i].price * CartProdectBar.cartList[i].quantity;
    }
    return total;

  }
}
