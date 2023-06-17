import 'package:app_popup_menu/app_popup_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import '../../../logic/whatsapp/whatsapp_main_page.dart';
import '../../utils/lists/cart_prodect_bar.dart';
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
  String text =
      "\nمرحباً ارغب بشراء المنتجات الاتية :     \n\n ${CartProdectBar.cartList.map((e) => ({
    "اسم الامنتج :${e.name}\n"
        "العدد :${1}\n"
        "السعر الكلي  :${" 2000000 " "دينار عراقي"}\n"
        "\n"
        "\n"
  }))}";
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Theme.of(context).backgroundColor, animate: true);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child:
        CartProdectBar.cartList.length == 0 ?
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("images/R2.png"),
              Padding(
                padding: const EdgeInsets.only(top: 30,left: 30),
                child: Text(
                  textAlign: TextAlign.center,
                  "لا يوجد منتجات في السلة ",
                  style: Text_Style.getstyle(
                      fontsize: 25,
                      ColorText: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ):
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: Text('السلة',
                      style: Text_Style.getstyle(
                          fontsize: 20,
                          ColorText: Theme.of(context).accentColor,
                          fontWeight: FontWeight.w700)),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 5),
                child: CartProdectBar(),
              )
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Container(
                  width: double.maxFinite,
                  height:45 ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          CartProdectBar().getCartTotalPrice().value.ceil().toString()+ 'د.ع',
                          style: Text_Style.getstyle(fontsize: 18, ColorText: Theme.of(context).accentColor, fontWeight:FontWeight.w700)
                      ),
                      Text(
                          'السعر الكلي',
                          style: Text_Style.getstyle(fontsize: 18, ColorText: Theme.of(context).accentColor, fontWeight:FontWeight.w700)
                      ),
                    ],
                  ),
                ),
              ),
              Button2(
                text: 'أتمام الطلب',
                onPressed: () {
                  setState(()  {
                    print(CartProdectBar.cartList[0].quantity);
                    print(CartProdectBar.cartList[0].name);
                    text=(  "\nمرحباً ارغب بشراء المنتجات الاتية :     \n\n ${CartProdectBar.cartList.map((e) => ({
                      "اسم الامنتج :${e.name}\n"
                          "العدد :${1}\n"
                          "السعر الكلي  :${CartProdectBar().getCartTotalPrice().value.ceil().toString()+"دينار عراقي"}\n"
                          "\n"
                          "\n"
                    }))}");

                  });
                  Get.to(whatsapp_main_page(
                    text: text,
                  ));
                },
              ),
            ]

        ),
      ),
    );
  }

}
