import 'package:app_popup_menu/app_popup_menu.dart';
import 'package:flutter/cupertino.dart';
import '../../utils/style/colors.dart';

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
              Column(
                children: [

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
