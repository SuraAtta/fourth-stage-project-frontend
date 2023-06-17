import 'package:flutter/material.dart';
import 'package:fourth_stage/src/logic/services/api/api_calls.dart';

import 'catigories_body.dart';

class CatigoriesPageBar extends StatefulWidget {
  const CatigoriesPageBar({Key? key}) : super(key: key);

  @override
  State<CatigoriesPageBar> createState() => _CatigoriesPageBarState();
}

class _CatigoriesPageBarState extends State<CatigoriesPageBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio:MediaQuery.of(context).size.width / 500,
          ),
          itemCount: BackEnd.apiCategory.length,
          itemBuilder: (BuildContext context, index) {
            return CatigoryBody(index:index, text:BackEnd.apiCategory[index].name.toString(), onPressed: () {  } ,);
          }
      ),
    );
  }
}
