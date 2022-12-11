import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_fonts/google_fonts.dart';

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
              itemCount: 20,
              itemBuilder: (BuildContext context, index) {
                return CatigoryButtons(
                  text: 'صنف',
                  onPressed: () {
                    setState(() {
                    });
                    },
                );
                index = index1.value;
              }),
        ),
      ],
    );
  }
}
