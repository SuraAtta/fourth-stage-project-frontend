import 'package:app_popup_menu/app_popup_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import '../../utils/prodects/fav_prodects_bar.dart';
import '../../utils/style/colors.dart';
import '../../utils/style/text_style.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
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
                child: Text('المفضلات',style: Text_Style.getstyle(
                    fontsize: 20,
                    ColorText: Colorsapp.dGray,
                    fontWeight: FontWeight.w700)),
              ),
            ),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FavProdectsBar(),
            )),
        ]
        ),
        ),
    );
  }
}
