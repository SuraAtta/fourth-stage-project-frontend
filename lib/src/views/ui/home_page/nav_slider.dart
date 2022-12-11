import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourth_stage/src/views/ui/cart_page/cart.dart';
import 'package:fourth_stage/src/views/ui/favorite_page/favorite.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/nav/main_nav.dart';
import '../../utils/style/colors.dart';
import 'package:get/get.dart';
import '../catigories_page/catigories.dart';
import '../orders_page/orders.dart';
import 'home.dart';


class Navbar extends StatelessWidget {
  Navbar({Key? key}) : super(key: key);
  List<IconData> icons = [
    CupertinoIcons.person_solid,
    CupertinoIcons.rectangle_grid_2x2_fill,
    CupertinoIcons.square_list,
    CupertinoIcons.cart,
    CupertinoIcons.settings,
    CupertinoIcons.smiley,
    Icons.door_back_door_outlined
  ];
  List<String> texts = [
    "ألملف الشخصي",
    "ألأصناف",
    "ألطلبات",
    "ألسلة",
    "ألاعدادات",
    "من نحن؟",
    "تسجيل الخروج",
  ];
  List<dynamic> Goto=[
    MainNav(selectedIndex: 0),
    CatigoriesPage(),
    OrdersPage(),
    MainNav(selectedIndex: 3),
    FavoritePage(),
    FavoritePage(),
    CartPage()
  ];

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaY: 5,
        sigmaX: 5,
      ),
      child: Drawer(
        width: MediaQuery.of(context).size.width * 0.6,
        elevation: 0,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 60),
          decoration: BoxDecoration(
           color: Colorsapp.bgColor,
          ),
          child: Stack(
            children: [
              Positioned(
                child: Padding(
                  padding: EdgeInsets.only(left: 200),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      CupertinoIcons.clear,
                      size: 22,
                      color: Colorsapp.dGray,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      width: double.infinity,
                      height: double.infinity,
                      child: FadeInLeft(
                        child: ListView.builder(
                            itemCount: icons.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (ctx, i) {
                              return InkWell(
                                // ignore: avoid_print
                                onTap: () => Get.offAll(Goto[i],
                                    transition: Transition.noTransition,
                                    duration: Duration(seconds: 1)),
                                child: Container(
                                  margin: const EdgeInsets.only(left: 5,top: 5,bottom: 10),
                                  child: ListTile(
                                    title: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                          texts[i],
                                          style: GoogleFonts.cairo(
                                            textStyle: TextStyle(
                                                fontSize: 16,
                                                color: Colorsapp.dGray,
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                    ),
                                    trailing: Icon(
                                    icons[i],
                                    color: Colorsapp.dGray,
                                    size: 30,
                                  ),),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}