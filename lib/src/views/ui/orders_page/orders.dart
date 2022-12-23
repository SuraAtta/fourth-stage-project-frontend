import 'package:flutter/material.dart';
import 'package:fourth_stage/src/views/utils/orders/orders_bar.dart';

import '../../utils/nav/back_arrow.dart';
import '../../utils/style/colors.dart';
import '../../utils/style/text_style.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorsapp.bgColor,
      body: SafeArea(

        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BackArrow(),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text('ألطلبات',style: Text_Style.getstyle(
                      fontsize: 20,
                      ColorText: Colorsapp.dGray,
                      fontWeight: FontWeight.w700)),
                ),
              ),
              Expanded(child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: OrdersBar(),
              )),
            ]
        ),
      ),
    );
  }
}
