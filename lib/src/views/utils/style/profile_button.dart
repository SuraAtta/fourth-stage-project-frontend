import 'package:flutter/material.dart';
import 'package:fourth_stage/src/views/utils/style/text_style.dart';

import 'colors.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({Key? key, required this.text, required this.onPressed}) : super(key: key);
  final String text;
  final void Function() onPressed;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(width: 2, color: Colorsapp.lGray),
          )),
          backgroundColor: MaterialStateProperty.all(Colorsapp.lGray),
          shadowColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.onSurface),
        ),
        onPressed: () {
          print("Account Settings1111");
          onPressed();
        },
        child: Container(
          width: double.infinity,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colorsapp.dGray,
                    size: 24,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      text,
                      style: Text_Style.getstyle(
                          fontsize: 18,
                          ColorText: Colorsapp.dGray,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
