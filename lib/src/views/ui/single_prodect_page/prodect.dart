import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:fourth_stage/src/views/utils/prodects/related_prodects_bar.dart';
import '../../utils/nav/back_arrow.dart';
import '../../utils/style/button2.dart';
import '../../utils/style/colors.dart';
import '../../utils/style/text_style.dart';
import 'package:get/get.dart';

import '../landing_page/landing.dart';
import '../orders_page/orders.dart';


class ProdectPage extends StatefulWidget {
  const ProdectPage({Key? key}) : super(key: key);

  @override
  State<ProdectPage> createState() => _StateProdectPage();
}

class _StateProdectPage extends State<ProdectPage> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colorsapp.bgColor, animate: true);
    return Scaffold(
      backgroundColor: Colorsapp.bgColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BackArrow(),
                Expanded(
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 300,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('data'),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('أسم المنتج',style: Text_Style.getstyle(
                                        fontsize: 24,
                                        ColorText: Colors.black,
                                        fontWeight: FontWeight.w700)),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text('40 د.ع',style: Text_Style.getstyle(
                                          fontsize: 22,
                                          ColorText: Colors.black,
                                          fontWeight: FontWeight.w700)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text('    ...الوصف',style: Text_Style.getstyle(
                                          fontsize: 19,
                                          ColorText: Colorsapp.dGray,
                                          fontWeight: FontWeight.w700)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                        child: Text('أخرى',style: Text_Style.getstyle(
                                            fontsize: 19,
                                            ColorText: Colorsapp.dGray,
                                            fontWeight: FontWeight.w700)),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],

                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8,bottom: 20,right: 8),
                        child: Container(
                          height: 223,
                          width: double.maxFinite,
                          child: RelatedProdectBar(),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
        Positioned(
          top: 720,
          left: 45,
          child:Center(
            child: Button2(
                text: 'أتمام الطلب',
                onPressed: () {
                  print("تسجيل الدخول");
                  Get.offAll(OrdersPage(),
                      transition: Transition.noTransition,
                      duration: Duration(seconds: 1));
                },
              ),
          ),)
          ],
        ),
      ),
    );
  }
}
