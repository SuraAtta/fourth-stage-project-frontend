import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import '../../../logic/services/api/api_calls.dart';
import '../../utils/lists/catigory_list.dart';
import '../../utils/lists/fav_prodects_bar.dart';
import '../../utils/style/colors.dart';
import '../../utils/style/text_style.dart';

class CatigoryPage extends StatefulWidget {
  const CatigoryPage({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<CatigoryPage> createState() => _CatigoryPageState();
}

class _CatigoryPageState extends State<CatigoryPage> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Theme.of(context).backgroundColor, animate: true);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: IconButton(
                      onPressed: () {
                        print("object");
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: Colors.grey,
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
                  child: Text(BackEnd.apiCategory[widget.index].name.toString(),
                      style: Text_Style.getstyle(
                          fontsize: 20,
                          ColorText: Theme.of(context).accentColor,
                          fontWeight: FontWeight.w700)),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CatigoryProdectsBar(i: widget.index,),
              )),
            ]),
      ),
    );
  }
}
