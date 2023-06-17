import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourth_stage/src/views/ui/favorite_page/favorite.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import '../../../logic/services/api/api_calls.dart';
import '../../../logic/services/api/url.dart';
import '../../ui/single_prodect_page/prodect.dart';
import '../lists/fav_prodects_bar.dart';
import '../nav/main_nav.dart';
import '../style/colors.dart';
import '../style/text_style.dart';

class FavCart extends StatefulWidget {
  const FavCart({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<FavCart> createState() => _FavCartState();
}

class _FavCartState extends State<FavCart> {
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
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(children: [
              Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: ElevatedButton(
                      onPressed: () {
                        BackEnd.sendPostRequest(
                            BackEnd.wishlist[widget.index].product.id);
                        print(BackEnd.wishlist[widget.index].product.id);
                        Future.delayed(const Duration(seconds: 0), () {
                          Get.to(MainNav(selectedIndex: 1,));
                        });
                        if (FavProdectsBar.favList[widget.index].isFav ==
                            false) {
                          FavProdectsBar.favList[widget.index].isFav = true;
                          BackEnd.wishlist[widget.index].product.isFav = true;
                          BackEnd.Prodects3[widget.index].isFav = true;
                        } else {
                          BackEnd.wishlist[widget.index].product.isFav = false;
                          BackEnd.Prodects3[widget.index].isFav = false;
                          FavProdectsBar.favList[widget.index].isFav = false;
                          FavProdectsBar.favList
                              .remove(FavProdectsBar.favList[widget.index]);
                        }
                       setState(() {
                       });
                      },
                      child: FavProdectsBar.favList[widget.index].isFav == false
                          ? Icon(
                              Ionicons.heart,
                              color: Colorsapp.lGray,
                              size: 30,
                            )
                          : Icon(Ionicons.heart,
                              color: Colorsapp.red, size: 30),
                      //: Icon(Ionicons.heart, color: Color(0XFFFF0000)),
                      //     child:Icon(Ionicons.heart , color: Colors.red) ,
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.white,
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
                      Api.Domain + FavProdectsBar.favList[widget.index].banner,
                      fit: BoxFit.fitHeight),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 1, top: 5, right: 5),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                      textDirection: TextDirection.rtl,
                      FavProdectsBar.favList[widget.index].name
                          .toString()
                          .substring(
                              0,
                              FavProdectsBar.favList[widget.index].name
                                          .toString()
                                          .length >
                                      10
                                  ? 10
                                  : FavProdectsBar.favList[widget.index].name
                                      .toString()
                                      .length),
                      //  "${FavProdectsBar.favList[prodects].title.substring(0, 6)}...",
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
                      '${FavProdectsBar.favList[widget.index].price.toString()} د.ع ',
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
