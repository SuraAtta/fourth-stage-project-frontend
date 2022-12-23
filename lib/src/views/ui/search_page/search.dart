import 'package:app_popup_menu/app_popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:fourth_stage/src/views/ui/home_page/home.dart';
import 'package:fourth_stage/src/views/ui/search_page/search_bar.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

import '../../utils/style/colors.dart';
import '../../utils/style/text_style.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key, required this.searchController, required this.onPressed, this.onChanged, this.TextField1}) : super(key: key);
  final TextEditingController searchController;
  final void Function() onPressed;
  final void Function(String)? onChanged;
  final Widget? TextField1;
  @override
  State<SearchPage> createState() => _SearchPageState(searchController);
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController;

  _SearchPageState(this.searchController);
  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController =
    TextEditingController(text: "");
    final RxBool isEmpty1 = true.obs;
    final RxString text = searchController.text.obs;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colorsapp.bgColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SearchBar(
                searchController: searchController,
                onPressed: () {
                  Get.to(HomePage());
                },
                onChanged: (String text1) {
                  text.value = text1;
                  if (text.value == "") {
                    isEmpty1.value = true;
                  } else {
                    isEmpty1.value = false;
                  }
                },
              ),
             ]
          ),
        ),
      ),
    );
  }
}
