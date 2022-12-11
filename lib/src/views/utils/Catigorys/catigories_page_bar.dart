import 'package:flutter/material.dart';

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
          itemCount: 7,
          itemBuilder: (BuildContext context, index) {
            //if(BackEnd.favList[index].isFav == true){
            return CatigoryBody();
            //}
            //return SizedBox(height: 0,width: 0,);
          }
      ),
    );
  }
}
