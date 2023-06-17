import 'package:flutter/material.dart';
import '../../utils/Catigorys/catigories_page_bar.dart';
import '../../utils/lists/fav_prodects_bar.dart';
import '../../utils/style/colors.dart';
import '../../utils/style/text_style.dart';
import 'package:get/get.dart';


class CatigoriesPage extends StatefulWidget {
  const CatigoriesPage({Key? key}) : super(key: key);

  @override
  State<CatigoriesPage> createState() => _CatigoriesPageState();
}

class _CatigoriesPageState extends State<CatigoriesPage> {
  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.only(left: 10),
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
                  padding: const EdgeInsets.only(right: 0,left: 20),
                  child: Text(
                      'ألأصناف',
                      style: Text_Style.getstyle(
                      fontsize: 18,
                      ColorText: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w700)),
                ),
              ),
              Expanded(child: Padding(
                padding: const EdgeInsets.only(right: 10,left: 10),
                child: CatigoriesPageBar(),
              )),
            ]
        ),
      ),
    );
  }
}
