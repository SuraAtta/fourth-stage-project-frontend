import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

import '../../utils/style/colors.dart';
import '../../utils/style/text_style.dart';
import '../home_page/home.dart';
import 'filters.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key, required this.searchController, required this.onPressed, this.onChanged, this.TextField1}) : super(key: key);
  final TextEditingController searchController;
  final void Function() onPressed;
  final void Function(String)? onChanged;
  final Widget? TextField1;
  @override
  State<SearchBar> createState() => _SearchBarState(searchController);
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController searchController;

  _SearchBarState(this.searchController);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Container(
            margin: EdgeInsets.only(left: 5),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colorsapp.lGray,width: 1),
                color: Colors.white,
                borderRadius: BorderRadius.circular(16)),
            child: IconButton(
              onPressed: () {
                onPressed();
              },
              icon: Icon(UniconsLine.filter),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 60,
            child: TextField(
              autofocus: false,
              onChanged: (text) {
                widget.onChanged!(text);
              },
              textDirection: TextDirection.rtl,
              controller: widget.searchController,
              style: Text_Style.getstyle(fontsize: 14, ColorText: Colors.black, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(style: BorderStyle.none),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide:  BorderSide(
                      color: Colorsapp.lGray,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                    color: widget.searchController.text.isEmpty
                        ? Color.fromRGBO(129, 129, 129, 1)
                        : Color(0xff45B9EE),
                  ),
                  hintText: "     بحث...",
                  hintStyle: Text_Style.getstyle(fontsize: 15, ColorText: Colors.black, fontWeight: FontWeight.w600)),
            ),
          ),
        ),
      ],
    );
  }
}
void onPressed() {
  Get.to(SearchFilters());

}
