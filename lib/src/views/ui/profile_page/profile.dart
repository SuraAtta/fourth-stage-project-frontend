import 'dart:core';
import 'package:app_popup_menu/app_popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../logic/DarkMode/model.dart';
import '../../../logic/services/local_database/shared_preferences.dart';
import '../../utils/style/profile_button.dart';
import '../../utils/style/text_style.dart';
import '../orders_page/orders.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
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
                            ColorText: Theme.of(context).accentColor,
                            fontWeight: FontWeight.w700)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text( name(),style: Text_Style.getstyle(
                          fontsize: 22,
                          ColorText: Theme.of(context).accentColor,
                          fontWeight: FontWeight.w700),),
                    ),
                    ProfileButton(text: 'ألاعدادات', onPressed: () {

                    },),

                    ProfileButton(text: 'طلباتي', onPressed: () { Get.to(OrdersPage()); },),
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

 String name(){
  var name;
  if(Database2.box.read("first_name") != null )
    name= "${Database2.box.read("first_name")} ";
  if(Database2.box.read("first_name") == null)
    name= "زائر";
  return name;
}



