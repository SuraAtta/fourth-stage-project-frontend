import 'package:flutter/material.dart';
import 'package:fourth_stage/src/views/utils/orders/orders_bar.dart';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {
                        print("object");
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: Color.fromRGBO(178, 35, 35, 1),
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
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
