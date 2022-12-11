import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartProdectBody extends StatefulWidget {
  const CartProdectBody({Key? key}) : super(key: key);

  @override
  State<CartProdectBody> createState() => _CartProdectBodyState();
}

class _CartProdectBodyState extends State<CartProdectBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.maxFinite,
        height: 140,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}
