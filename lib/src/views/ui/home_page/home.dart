import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import '../../utils/Catigorys/catigorys_bar.dart';
import '../../utils/lists/Home_Catigories_list.dart';
import '../../utils/lists/home_catigories_bar.dart';
import '../../utils/lists/home_prodects_bar.dart';
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
  void initState() {
    print('مناا');
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Theme.of(context).backgroundColor, animate: true);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return  Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8,left: 8),
                   child: Container(
                    height:90,
                    width: double.maxFinite,
                    child: CatigoryButtonsBar(),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text('المنجات',style: Text_Style.getstyle(
                        fontsize: 18,
                        ColorText: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w700)),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Container(
                //     color: Colors.teal,
                //     height: 250,
                //     width: double.maxFinite,
                //     child: HomeProdectsBar(),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8),
                  child: Container(
                    height: 545,
                    width: double.maxFinite,
                    child:
                    HomeCatigoryProdectlist(),
                  ),
                ),

              ],
            );
          },
        ),
      ),
    );
  }
}
