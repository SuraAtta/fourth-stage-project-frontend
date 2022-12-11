import 'package:flutter/material.dart';

import 'orders_body.dart';

class OrdersBar extends StatefulWidget {
  const OrdersBar({Key? key}) : super(key: key);

  @override
  State<OrdersBar> createState() => _OrdersBarState();
}

class _OrdersBarState extends State<OrdersBar> {
  @override
  Widget build(BuildContext context) {
    return Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 2,
                  itemBuilder: (BuildContext context, index) {
                    return OrdersBody();
                  })
          )
        ]);  }
}
