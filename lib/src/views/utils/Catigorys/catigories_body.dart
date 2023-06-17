import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/services/api/api_calls.dart';
import '../../../logic/services/api/url.dart';
import '../../ui/single_catigory_page/catigory.dart';
import '../style/colors.dart';
import '../style/text_style.dart';

class CatigoryBody extends StatefulWidget {
  const CatigoryBody({Key? key, required this.index, required this.text, required this.onPressed}) : super(key: key);
  final int index;
  final String text;
  final void Function() onPressed;
  @override
  State<CatigoryBody> createState() => _CatigoryBodyState();
}

class _CatigoryBodyState extends State<CatigoryBody> {
  @override
  Widget build(BuildContext context) {
    return
      TextButton(
        onPressed: () {
            setState(() {
              Get.to(CatigoryPage(index: widget.index));
            }
            );

          madeAsClicked();
          widget.onPressed();
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 10),
              child: Container(
                width: double.maxFinite,
                height: 90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Image.network(Api.Domain +
                    BackEnd.apiCategory[widget.index].image.toString()),
              ),
            ),
            Text(widget.text, style: Text_Style.getstyle(
                fontsize: 14,
                ColorText: Theme.of(context).accentColor,
                fontWeight: FontWeight.w700)),
          ],
        ),
      );
  }

  bool? clicked = false;

  madeAsClicked() {
    if (clicked == false) {
      clicked = true;
    } else
      clicked = false;
  }
}