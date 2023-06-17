import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:fourth_stage/src/views/ui/single_prodect_page/prodect_counter.dart';
import 'package:fourth_stage/src/views/utils/lists/related_prodects_bar.dart';
import '../../../logic/services/api/api_calls.dart';
import '../../../logic/services/api/url.dart';
import '../../utils/lists/cart_prodect_bar.dart';
import '../../utils/nav/back_arrow.dart';
import '../../utils/nav/main_nav.dart';
import '../../utils/style/button2.dart';
import '../../utils/style/colors.dart';
import '../../utils/style/text_style.dart';
import 'package:get/get.dart';
import '../cart_page/cart.dart';
import '../orders_page/orders.dart';

class ProdectPage extends StatefulWidget {
  const ProdectPage({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<ProdectPage> createState() => _StateProdectPage();
}

class _StateProdectPage extends State<ProdectPage> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Theme.of(context).backgroundColor, animate: true);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
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
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0, right: 0,top: 10,bottom: 10),
                              child: Image.network(
                                  Api.Domain +
                                      BackEnd.Prodects3[widget.index].banner,
                                  fit: BoxFit.contain),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, right: 15, left: 15),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 0, left: 10),
                                      child: ProdectCounter(
                                        prodect: 0,
                                        index: widget.index,
                                        container_color: Theme.of(context).backgroundColor,
                                        button_color: Theme.of(context).backgroundColor,
                                        left_border: 35,
                                        right_border: 35,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Text(
                                            textDirection: TextDirection.rtl,
                                            BackEnd.Prodects3[widget.index].name
                                                .toString(),
                                            style: Text_Style.getstyle(
                                                fontsize: 16,
                                                ColorText: Theme.of(context).indicatorColor,
                                                fontWeight: FontWeight.w700)),
                                      ),
                                    ),
                                  ])),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, right: 15),
                                child: Text(
                                    '${BackEnd.Prodects3[widget.index].price.toString()} د.ع ',
                                    textDirection: TextDirection.rtl,
                                    style: Text_Style.getstyle(
                                        fontsize: 16,
                                        ColorText: Theme.of(context).indicatorColor,
                                        fontWeight: FontWeight.w700)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, right: 15, left: 15),
                                child: Container(
                                  height: 120,
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                      textDirection: TextDirection.rtl,
                                      BackEnd
                                          .Prodects3[widget.index].description
                                          .toString()
                                          .substring(
                                              0,
                                              BackEnd.Prodects3[widget.index]
                                                          .description
                                                          .toString()
                                                          .length >
                                                      170
                                                  ? 170
                                                  : BackEnd
                                                      .Prodects3[widget.index]
                                                      .description
                                                      .toString()
                                                      .length),
                                      style: Text_Style.getstyle(
                                          fontsize: 13,
                                          ColorText: Theme.of(context).accentColor,
                                          fontWeight: FontWeight.w700)),
                                ),
                              ),
                              /*              Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Container(
                                        height: 40,
                                        child: Center(
                                            child: ColorList(
                                              prodect: 0,
                                            )),
                                      ),
                                    ),*/
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, right: 15),
                                child: Text('أخرى',
                                    style: Text_Style.getstyle(
                                        fontsize: 16,
                                        ColorText: Theme.of(context).accentColor,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 0, bottom: 20, right: 8),
                        child: Container(
                          height: 250,
                          width: double.maxFinite,
                          child: RelatedProdectBar(
                            i: widget.index,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height-100,
              left: 45,
              child: Center(
                child: Button2(
                  text: 'أضافة الى السلة',
                  onPressed: () {
                    if (cart_check() == true) {
                      CartProdectBar.cartList
                          .add(BackEnd.Prodects3[widget.index]);
                      Get.offAll(
                          MainNav(
                            selectedIndex: 3,
                          ),
                          transition: Transition.noTransition,
                          duration: Duration(seconds: 1));
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool cart_check() {
    bool f = true;
    for (int i = 0; i < CartProdectBar.cartList.length; i++) {
      if (BackEnd.Prodects3[widget.index].id == CartProdectBar.cartList[i].id) {
        f = false;
      }
    }
    if (f == false) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        messageText: Text("متواجد في السلة! ",
            textDirection: TextDirection.rtl,
            style: Text_Style.getstyle(
                fontsize: 20,
                ColorText: Colors.white,
                fontWeight: FontWeight.w400)),
      ));
    }
    return f;
  }
}
