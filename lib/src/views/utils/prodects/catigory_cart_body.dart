import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import '../../../logic/services/api/api_calls.dart';
import '../../../logic/services/api/url.dart';
import '../../ui/single_prodect_page/prodect.dart';
import '../style/colors.dart';
import '../style/text_style.dart';

class CatigoryCartBody extends StatefulWidget {
  const CatigoryCartBody({Key? key, required this.index, required this.i})
      : super(key: key);
  final int index;
  final int i;
  @override
  State<CatigoryCartBody> createState() => _CatigoryCartBodyState();
}

class _CatigoryCartBodyState extends State<CatigoryCartBody> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Get.to(ProdectPage(index: widget.index));
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
            width: MediaQuery.of(context).size.width / 2.5,
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(10)),
            child: Column(children: [
              Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {});
                        if (BackEnd.Prodects3[widget.index].isFav == false)
                          BackEnd.Prodects3[widget.index].isFav = true;
                        else
                          BackEnd.Prodects3[widget.index].isFav = false;
                        print(BackEnd.favList);
                      },
                      child: BackEnd.Prodects3[widget.index].isFav == false
                          ? Icon(
                              Ionicons.heart,
                              color: Theme.of(context).highlightColor,
                              size: 30,
                            )
                          : Icon(Ionicons.heart,
                              color: Colorsapp.red, size: 30),
                      //     child:Icon(Ionicons.heart , color: Colors.red) ,
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Theme.of(context).cardColor,
                        fixedSize: const Size(26, 26),
                        shape: const CircleBorder(),
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width - 50,
                margin: const EdgeInsets.only(top: 0, right: 10, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                      Api.Domain +
                          BackEnd.categoryItems[widget.i][widget.index].banner,
                      fit: BoxFit.fitHeight),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 1, top: 5, right: 5),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                      textDirection: TextDirection.rtl,
                      BackEnd.Prodects3[widget.index].name.toString().substring(0,BackEnd.Prodects3[widget.index].name.toString().length >15?15:BackEnd.Prodects3[widget.index].name.toString().length) ,
                      //  "${BackEnd.Prodects3[prodects].title.substring(0, 6)}...",
                      style: Text_Style.getstyle(
                          fontsize: 16,
                          ColorText: Colors.black,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                      textDirection: TextDirection.rtl,
                      '${BackEnd.categoryItems[widget.i][widget.index].price.toString()} د.ع ',
                      style: Text_Style.getstyle(
                          fontsize: 17,
                          ColorText: Colors.black,
                          fontWeight: FontWeight.w400)),
                ),
              )
            ])),
      ),
    );
  }
}
