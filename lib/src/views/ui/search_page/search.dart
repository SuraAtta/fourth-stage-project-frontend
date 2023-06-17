import 'package:app_popup_menu/app_popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:fourth_stage/src/views/ui/home_page/home.dart';
import 'package:fourth_stage/src/views/ui/search_page/search_bar.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';
import '../../../logic/services/api/api_calls.dart';
import '../../utils/lists/Home_Catigories_list.dart';
import '../../utils/lists/search_result.dart';
import '../../utils/prodects/prodect_body.dart';
import '../../utils/style/colors.dart';
import '../../utils/style/text_style.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController =
      TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController =
        TextEditingController(text: "");
    final RxBool isEmpty1 = true.obs;
    final RxString text = searchController.text.obs;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Obx(() {
        return Padding(
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
                  print(text.value);
                  text.value = text1;
                  if (text.value == "") {
                    isEmpty1.value = true;
                  } else {
                    isEmpty1.value = false;
                  }
                  print(text.value);
                },
              ),
              if (isEmpty1.value == false)
                Flexible(
                  child: Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio:
                            MediaQuery.of(context).size.width / 540,
                      ),
                      itemCount: BackEnd.Prodects3.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (BackEnd.Prodects3[index].name
                            .toLowerCase()
                            .contains(text.value.toLowerCase())) {
                          return CartBody(index: index);
                        }
                        return SizedBox(
                          height: 10,
                          width: 10,
                        );
                      },
                    ),
                  ),
                )
            ],
          ),
        );
      }),
    ));
  }
}
