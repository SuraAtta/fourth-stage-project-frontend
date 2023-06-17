import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourth_stage/src/logic/models/model.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import '../../../logic/services/api/api_calls.dart';
import '../../../logic/services/api/test.dart';
import '../../../logic/services/api/url.dart';
import '../../../logic/services/local_database/shared_preferences.dart';
import '../../ui/single_prodect_page/prodect.dart';
import '../lists/fav_prodects_bar.dart';
import '../style/colors.dart';
import '../style/text_style.dart';

class CartBody extends StatefulWidget {
  const CartBody({Key? key, required this.index}) : super(key: key);
  static List<Produect> favList = [];

  final int index;
  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  late int pId;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Get.to(()=>ProdectPage(index: widget.index));
          print(widget.index);
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
            width: MediaQuery.of(context).size.width / 2.5,
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10)),
            child: Column(children: [
              Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: ElevatedButton(
                      onPressed: () async{
                         setState(() {

                         });
                         BackEnd.sendPostRequest(BackEnd.Prodects3[widget.index].id);
                         BackEnd.getWishList();
                         if(BackEnd.Prodects3[widget.index].isFav == false){
                           BackEnd.Prodects3[widget.index].isFav = true;
                           FavProdectsBar.favList.add(BackEnd.Prodects3[widget.index]);
                         }
                        else {
                           BackEnd.Prodects3[widget.index].isFav = false;
                           FavProdectsBar.favList.remove(BackEnd.Prodects3[widget.index]);
                         }
                        print(CartBody.favList);
                      },
                      child: BackEnd.Prodects3[widget.index].isFav == false
                          ? Icon(
                              Ionicons.heart,
                              color: Theme.of(context).highlightColor,
                              size: 30,
                            )
                          : Icon(Ionicons.heart,
                              color: Colorsapp.red, size: 30),
                      //: Icon(Ionicons.heart, color: Color(0XFFFF0000)),
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
                  color: Color.fromRGBO(0, 0, 0, 0)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                        Api.Domain + BackEnd.Prodects3[widget.index].banner,
                        fit: BoxFit.fitHeight),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 1, top: 5, right: 5),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                      textDirection: TextDirection.rtl,
                      BackEnd.Prodects3[widget.index].name.toString().substring(0,BackEnd.Prodects3[widget.index].name.toString().length >10?10:BackEnd.Prodects3[widget.index].name.toString().length) ,
                      //  "${BackEnd.Prodects3[widget.index].title.substring(0, 6)}...",
                      style: Text_Style.getstyle(
                          fontsize: 16,
                          ColorText: Theme.of(context).accentColor,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                      textDirection: TextDirection.rtl,
                      '${BackEnd.Prodects3[widget.index].price.toString()} د.ع ',
                      style: Text_Style.getstyle(
                          fontsize: 17,
                          ColorText: Theme.of(context).accentColor,
                          fontWeight: FontWeight.w400)),
                ),
              )
            ])),
      ),
    );
  }
}
