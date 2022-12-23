import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/single_prodect_page/prodect.dart';


class CartBody extends StatefulWidget {
  const CartBody({Key? key}) : super(key: key);

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
      setState(() {
        //api!.makeAsClicked();
        Get.to(ProdectPage());
      });
    },
   child: Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 165,
        height: 223,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
      ),
    ),);
  }
}
