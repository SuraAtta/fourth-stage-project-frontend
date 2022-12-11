import 'package:app_popup_menu/app_popup_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:fourth_stage/src/views/ui/landing_page/landing.dart';
import '../../utils/prodects/cart_prodect_bar.dart';
import '../../utils/style/button2.dart';
import '../../utils/style/colors.dart';
import '../../utils/style/text_style.dart';
import 'package:get/get.dart';


class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colorsapp.bgColor, animate: true);
    return Scaffold(
      backgroundColor: Colorsapp.bgColor,
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text('السلة',
                      style: Text_Style.getstyle(
                          fontsize: 20,
                          ColorText: Colorsapp.dGray,
                          fontWeight: FontWeight.w700)),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CartProdectBar(),
              )
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Container(
                  width: double.maxFinite,
                  height:50 ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                         '66'+ 'د.ع',
                          style: Text_Style.getstyle(fontsize: 20, ColorText: Colorsapp.dGray, fontWeight:FontWeight.w700)
                      ),
                      Text(
                          'السعر الكلي',
                          style: Text_Style.getstyle(fontsize: 20, ColorText: Colorsapp.dGray, fontWeight:FontWeight.w700)
                      ),
                    ],
                  ),
                ),
              ),
              Button2(
                text: 'أتمام الطلب',
                onPressed: () {
                  print("تسجيل الدخول");
                  Get.offAll(Landing(),
                      transition: Transition.noTransition,
                      duration: Duration(seconds: 1));
                },
              ),
            ]

        ),
      ),
    );
  }
}
