import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../logic/services/api/api_calls.dart';
import '../../../logic/services/api/url.dart';
import '../style/text_style.dart';

class CatigoryButtons extends StatefulWidget {
  final String text;
  final void Function() onPressed;
  final int index;
  // final RxBool isClicked = false.obs;
  CatigoryButtons({
    Key? key,
    required this.text,
    required this.onPressed, required this.index,
  }) : super(key: key);

  @override
  State<CatigoryButtons> createState() => _CatigoryButtonsState();
}

class _CatigoryButtonsState extends State<CatigoryButtons> {
  @override
  Widget build(BuildContext context) {
    RxBool isClicked = false.obs;
    return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8, left: 8),
        child: Column(
          children: [
            Container(
              height: 45,
              width: 55,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                onPressed: () {
                  setState(() {});
                  madeAsClicked();
                  widget.onPressed();
                },
                child: Container(
                  height: 40,
                  width: 55,
                  child:
                  Image.network(
                      Api.Domain+BackEnd.apiCategory[widget.index].image.toString(),
                    fit:BoxFit.fill,
                      ),
                ),
              ),
            ),
            Text(widget.text,
                style: Text_Style.getstyle(
                    fontsize: 13,
                    ColorText: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w700)),
          ],
        ));
  }

  bool? clicked = false;

  madeAsClicked() {
    if (clicked == false) {
      clicked = true;
    } else
      clicked = false;
  }
}
