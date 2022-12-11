import 'package:flutter/material.dart';

import '../style/colors.dart';
import '../style/text_style.dart';

class OrdersBody extends StatefulWidget {
  const OrdersBody({Key? key}) : super(key: key);

  @override
  State<OrdersBody> createState() => _OrdersBodyState();
}

class _OrdersBodyState extends State<OrdersBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.maxFinite,
        height: 200,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10,top: 10),
              child: Text(': رقم  الطلب ',style: Text_Style.getstyle(
                  fontsize: 16,
                  ColorText: Colorsapp.dGray,
                  fontWeight: FontWeight.w700)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10,top: 5),
              child: Text(': تاريخ الطلب ',style: Text_Style.getstyle(
                  fontsize: 16,
                  ColorText: Colorsapp.dGray,
                  fontWeight: FontWeight.w700)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10,top: 5),
              child: Text(': تاريخ ألاستلام ',style: Text_Style.getstyle(
                  fontsize: 16,
                  ColorText: Colorsapp.dGray,
                  fontWeight: FontWeight.w700)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10,top: 5),
              child: Text(': ألسعر الكلي ',style: Text_Style.getstyle(
                  fontsize: 16,
                  ColorText: Colorsapp.dGray,
                  fontWeight: FontWeight.w700)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10,top: 5),
              child: Text(': أسم المستلم ',style: Text_Style.getstyle(
                  fontsize: 16,
                  ColorText: Colorsapp.dGray,
                  fontWeight: FontWeight.w700)),
            ),
          ],
        ),
      ),
    );
  }
}
