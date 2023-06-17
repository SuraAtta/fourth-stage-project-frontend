import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourth_stage/src/logic/services/api/api_calls.dart';
import 'package:fourth_stage/src/views/utils/prodects/prodect_body.dart';


class HomeCatigoryProdectlist extends StatefulWidget {
  const HomeCatigoryProdectlist({Key? key, }) : super(key: key);

  @override
  State<HomeCatigoryProdectlist> createState() => _HomeCatigoryProdectlistState();
}

class _HomeCatigoryProdectlistState extends State<HomeCatigoryProdectlist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio:MediaQuery.of(context).size.width / 500,
          ),
          itemCount:BackEnd.Prodects3.length,
          itemBuilder: (BuildContext context, index) {
            return CartBody(index: index,);
            }
      ),
    );
  }
}

