import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import '../../utils/Catigorys/catigorys_bar.dart';
import '../../utils/prodects/home_prodects_bar.dart';
import '../../utils/style/colors.dart';
import '../../utils/style/text_style.dart';
import 'nav_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colorsapp.bgColor, animate: true);
    return Scaffold(
      backgroundColor: Colorsapp.bgColor,
      body: SafeArea(
        child: Expanded(
          child: ListView(
            children: [
              Column(
               children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Container(
                           height:100,
                           width: double.maxFinite,
                              child: CatigoryButtonsBar(),
                 ),
                     ),
                 Align(
                   alignment: Alignment.centerRight,
                   child: Padding(
                     padding: const EdgeInsets.only(right: 20),
                     child: Text('الرائج',style: Text_Style.getstyle(
                         fontsize: 18,
                         ColorText: Colors.black,
                         fontWeight: FontWeight.w700)),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                     height: 223,
                     width: double.maxFinite,
                     child: HomeProdectsBar(),
                   ),
                 ),
                 Align(
                   alignment: Alignment.centerRight,
                   child: Padding(
                     padding: const EdgeInsets.only(right: 20),
                     child: Text('ألصنف',style: Text_Style.getstyle(
                         fontsize: 18,
                         ColorText: Colors.black,
                         fontWeight: FontWeight.w700)),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                     height: 223,
                     width: double.maxFinite,
                     child: HomeProdectsBar(),
                   ),
                 ),
                 Align(
                   alignment: Alignment.centerRight,
                   child: Padding(
                     padding: const EdgeInsets.only(right: 20),
                     child: Text('ألصنف',style: Text_Style.getstyle(
                         fontsize: 18,
                         ColorText: Colors.black,
                         fontWeight: FontWeight.w700)),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                     height: 223,
                     width: double.maxFinite,
                     child: HomeProdectsBar(),
                   ),
                 ),
               ],
            ),
          ]),
        ),
      ),
    );
  }
}
