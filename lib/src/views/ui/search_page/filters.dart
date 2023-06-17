import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fourth_stage/src/views/ui/search_page/search.dart';
import 'package:get/get.dart';
import '../../../logic/services/api/api_calls.dart';
import '../../utils/nav/back_arrow.dart';
import '../../utils/style/button1.dart';
import '../../utils/style/colors.dart';
import '../../utils/style/text_filed.dart';
import '../../utils/style/text_style.dart';

class SearchFilters extends StatefulWidget {
  const SearchFilters({Key? key}) : super(key: key);

  @override
  State<SearchFilters> createState() => _SearchFiltersState();
}

class _SearchFiltersState extends State<SearchFilters> {
  static TextEditingController money_from = TextEditingController();
  static TextEditingController money_to = TextEditingController();
  RxString typed_from = ''.obs;
  RxString typed_to = ''.obs;
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BackArrow(),
              Padding(
                padding: const EdgeInsets.only(top: 0, right: 15, left: 25),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,

                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Text(
                          "فلاتر البحث",
                          style:  Text_Style.getstyle(fontsize: 26, ColorText: Theme.of(context).accentColor, fontWeight:FontWeight.w700),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                    Obx(() {
                      return Text_Field1(
                        keyboardType: TextInputType.number,
                        MyController: money_from,
                        onChanged: (text) {
                          typed_from.value = text;
                          print(typed_from);
                        },
                        hintText: 'السعر من :'.obs,
                        icon: Icon(
                          Icons.monetization_on,
                          color: typed_from.value.isEmpty
                              ? Colors.black38
                              :  Colorsapp.themeColor,
                        ),
                        labelText: "".obs,
                        pass: false,
                      );
                    }),
                    Obx(() {
                      return Text_Field1(
                        keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                        MyController: money_to,
                        onChanged: (text) {
                          typed_to.value = text;
                          print(text);
                        },
                        hintText: 'السعر الى :'.obs,
                        icon: Icon(
                          Icons.monetization_on,
                          color: typed_to.value.isEmpty
                              ? Colors.black38
                              :  Colorsapp.themeColor,
                        ),
                        labelText: "".obs,
                        pass: false,
                      );
                    }),
                    Container(
                      width: 280,
                      height: 45,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Row(
                            children: [
                              Icon(
                                Icons.arrow_drop_down_sharp,
                                size: 30,
                                color: Colors.black,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 3),
                                  child: Text(
                                    '  اختار الفئة ',
                                    textDirection: TextDirection.rtl,
                                    style: Text_Style.getstyle(fontsize: 20, ColorText: Colorsapp.dGray, fontWeight:FontWeight.w700),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          items: BackEnd.apiCategory
                              .map((item) => DropdownMenuItem<String>(
                            alignment: Alignment.centerRight,
                            value: item.name,
                            child: Text(
                              textDirection: TextDirection.rtl,
                              ("  ${item.name}    "),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(117, 117, 118, 1),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value as String;
                              print(selectedValue);
                            });
                          },
                          icon: const Icon(
                            Icons.list,
                          ),
                          iconSize: 24,
                          iconEnabledColor: Colors.black,
                          iconDisabledColor: Colorsapp.dGray,
                          buttonHeight: 50,
                          buttonWidth: 200,
                          buttonPadding:
                          const EdgeInsets.only(left: 14, right: 20),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colorsapp.dGray,
                              width: 1.5
                            ),
                            color:  Colorsapp.lGray,
                          ),
                          buttonElevation: 2,
                          itemHeight: 40,
                          itemPadding:
                          const EdgeInsets.only(left: 14, right: 14),
                          dropdownMaxHeight: 200,
                          dropdownWidth: 280,
                          dropdownPadding: null,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Theme.of(context).cardColor,
                          ),
                          dropdownElevation: 8,
                          scrollbarRadius: const Radius.circular(40),
                          scrollbarThickness: 6,
                          scrollbarAlwaysShow: true,
                          offset: const Offset(0, 0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Button1(
                        text: 'بحث',
                        onPressed: () {
                          // print("من: $typedfrom");
                          // print("الي: $typedTo");
                          // print("الفئة: $catigory");
                          // print(number_length_check());
                          // if (number_length_check() == true) {
                          //   Get.to(SearchPage(searchController: money_from, onPressed: () {  },
                          //
                          //   ));
                          // }

                        },
                      ),
                    ),
                    // Image.asset(
                    //   "photo/search.png",
                    //   width: 150,
                    //   height: 150,
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: NavigationBar_defult()
    );
  }

RxString get typedfrom {
  RxString Empty = "".obs;
  return typed_from.value.isEmpty ? Empty : typed_from;
}

RxString get typedTo {
  RxString Empty = "".obs;
  return typed_to.value.isEmpty ? Empty : typed_to;
}

String? get catigory {
  return selectedValue;
}

number_length_check() {
  RxBool flag = false.obs;
  if (typed_from.isEmpty||typed_to.isEmpty) {
    return Get.showSnackbar(GetSnackBar(
      backgroundColor: Colors.red,
      duration: Duration(seconds: 2),
      messageText: Text(" النص فارغ ",
          textDirection: TextDirection.rtl,
          style: Text_Style.getstyle(fontsize: 18, ColorText: Colors.white, fontWeight: FontWeight.w400)),
    )
    );
    flag = false.obs;
  } else if (!typed_from.contains(RegExp(r'^[0-9]+$')) ||
      !typed_to.contains(RegExp(r'^[0-9]+$'))) {
    return Get.showSnackbar(GetSnackBar(
      backgroundColor: Colors.red,
      duration: Duration(seconds: 2),
      messageText: Text("النص يجب ان يحتوي على ارقام فقط ",
          textDirection: TextDirection.rtl,
          style: Text_Style.getstyle(fontsize: 18, ColorText: Colors.white, fontWeight: FontWeight.w400)),
    ));
    flag = false.obs;
  } else {
    flag = true.obs;
    return flag;
  }
}
}
