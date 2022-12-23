import 'package:app_popup_menu/app_popup_menu.dart';
import 'package:flutter/material.dart';
import '../../utils/style/button1.dart';
import '../../utils/style/button2.dart';
import '../../utils/style/colors.dart';
import '../../utils/style/profile_button.dart';
import '../../utils/style/text_style.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorsapp.bgColor,
      body: SafeArea(
        child: Expanded(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20,left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text('ألملف الشخصي',style: Text_Style.getstyle(
                            fontsize: 20,
                            ColorText: Colorsapp.dGray,
                            fontWeight: FontWeight.w700)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text('أسم المستخدم',style: Text_Style.getstyle(
                          fontsize: 22,
                          ColorText: Colorsapp.dGray,
                          fontWeight: FontWeight.w700),),
                    ),
                    ProfileButton(text: 'ألاعدادات', onPressed: () {  },),
                    ProfileButton(text: 'طلباتي', onPressed: () {  },),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
