import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourth_stage/src/logic/services/api/api_calls.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ui/single_catigory_page/catigory.dart';
import 'catigory_model.dart';



class CatigoryButtonsBar extends StatefulWidget {
  const CatigoryButtonsBar({Key? key,}) : super(key: key);

  @override
  State<CatigoryButtonsBar> createState() => _CatigoryButtonsBarState();
}

class _CatigoryButtonsBarState extends State<CatigoryButtonsBar> {
  @override
  static RxInt index1 = 0.obs;

  _CatigoryButtonsBarState();
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              reverse: true,
              itemCount: BackEnd.apiCategory.length,
              itemBuilder: (BuildContext context, index) {
                return CatigoryButtons(
                  text: BackEnd.apiCategory[index].name.toString(),
                  index: index,
                  onPressed: () {
                    setState(() {
                      Get.to(CatigoryPage(index: index));
                      print(BackEnd.apicolorLogo[0].colorCode);
                    }
                    );
                  },
                );
                index = index1.value;
              }),
        ),
      ],
    );
  }
}
