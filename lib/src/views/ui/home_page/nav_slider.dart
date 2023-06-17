import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourth_stage/src/views/ui/cart_page/cart.dart';
import 'package:fourth_stage/src/views/ui/favorite_page/favorite.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../logic/services/auth_service/auth.dart';
import '../../utils/nav/main_nav.dart';
import '../../utils/style/colors.dart';
import 'package:get/get.dart';
import '../catigories_page/catigories.dart';
import '../landing_page/landing.dart';
import '../orders_page/orders.dart';


class Navbar extends StatelessWidget {
  Navbar({Key? key}) : super(key: key);
  List<IconData> icons = [
    CupertinoIcons.person_solid,
    CupertinoIcons.rectangle_grid_2x2_fill,
    //CupertinoIcons.square_list,
    CupertinoIcons.cart,
    CupertinoIcons.settings,
    CupertinoIcons.smiley,
    Icons.door_back_door_outlined
  ];
  List<String> texts = [
    "ألملف الشخصي",
    "ألأصناف",
   // "ألطلبات",
    "ألسلة",
    "ألاعدادات",
    "من نحن؟",
    "تسجيل الخروج",
  ];
  List<dynamic> Goto=[
    MainNav(selectedIndex: 0),
    CatigoriesPage(),
   // OrdersPage(),
    MainNav(selectedIndex: 3),
    FavoritePage(),
    FavoritePage(),
    CartPage()
  ];

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaY: 5,
        sigmaX: 5,
      ),
      child:
      Drawer(
        width: 250,
        child: Material(
          color: Theme.of(context).backgroundColor,

          child: ListView(
            children: <Widget>[
              Container(
                padding: padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 20),
                    buildMenuItem(
                      icon:  CupertinoIcons.person_solid,
                      text: 'ألملف الشخصي',
                      onClicked: () => selectedItem(context, 0),
                        context: context

                    ),
                    const SizedBox(height: 10),
                    buildMenuItem(
                      text: 'ألأصناف',
                      icon: CupertinoIcons.rectangle_grid_2x2_fill,
                      onClicked: () => selectedItem(context, 1),
                        context: context

                    ),
                    // const SizedBox(height: 16),
                    // buildMenuItem(
                    //   text: 'ألطلبات',
                    //   icon: CupertinoIcons.square_list,
                    //   onClicked: () => selectedItem(context, 2),
                    // ),
                   // const SizedBox(height: 16),
                   //  buildMenuItem(
                   //    text: 'ألاعدادات',
                   //    icon: CupertinoIcons.settings,
                   //    onClicked: () => selectedItem(context, 3),
                   //  ),
                    //Divider(color: Colors.white70),
                    const SizedBox(height: 10),
                    buildMenuItem(
                      text: 'من نحن؟',
                      icon: CupertinoIcons.smiley,
                      onClicked: () => selectedItem(context, 4),
                      context: context
                    ),
                    const SizedBox(height: 10),
                    buildMenuItem(
                      text: 'تسجيل الخروج',
                      icon: Icons.door_back_door_outlined,
                      onClicked: () => {
                      Future.delayed(const Duration(seconds: 2), () {
                        AuthService.signOut();
                        Get.to(Landing(),transition: Transition.noTransition,duration: Duration(seconds: 1));
                      })},
                        context: context
                    ),
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
Widget buildSearchField(BuildContext context) {
  final color = Theme.of(context).accentColor;
  return TextField(
    style: TextStyle(color: color),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      hintText: 'Search',
      hintStyle: TextStyle(color: color),
      prefixIcon: Icon(Icons.search, color: color),
      filled: true,
      fillColor: Colors.white12,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: color.withOpacity(0.7)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: color.withOpacity(0.7)),
      ),
    ),
  );
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
  required BuildContext context
}) {
  final color = Theme.of(context).accentColor;
  final hoverColor =  Colorsapp.lGray;

  return
    ListTile(
    title:  Align(
      alignment: Alignment.centerRight,
      child: Text(text, style: GoogleFonts.cairo(
          textStyle: TextStyle(
          fontSize: 16,
          color: color,
          letterSpacing: 1,
          fontWeight: FontWeight.bold),
          ),
        ),
    ),
      trailing: Icon(icon,size: 25, color: Theme.of(context).accentColor),
    hoverColor: hoverColor,
    onTap: onClicked,
    );
}

void selectedItem(BuildContext context, int index) {
  Navigator.of(context).pop();

  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MainNav(selectedIndex: 4,),
      ));
      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CatigoriesPage(),
      ));
      break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => OrdersPage(),
      ));
      break;
    case 3:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MainNav(selectedIndex: 3,),
      ));
      break;
    case 4:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MainNav(selectedIndex: 4,),
      ));
      break;
  }
}
