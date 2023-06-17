import 'package:flutter/material.dart';

import '../../../logic/services/api/api_calls.dart';
import '../prodects/prodect_body.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount:BackEnd.Prodects3.length,
        itemBuilder: (BuildContext context, int index) {
      if( BackEnd.Prodects3[index].name.toLowerCase().contains(widget.text.toLowerCase())){
        return CartBody(index: index);
      }
      return SizedBox(height: 0);
    },
      ));
  }
}
