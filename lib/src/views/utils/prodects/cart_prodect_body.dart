import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourth_stage/src/logic/services/api/api_calls.dart';
import 'package:get/get.dart';
import '../../../logic/services/api/url.dart';
import '../../ui/single_prodect_page/prodect.dart';
import '../lists/cart_prodect_bar.dart';
import '../nav/main_nav.dart';
import '../style/colors.dart';
import '../style/text_style.dart';

class CartProdectBody extends StatefulWidget {
  const CartProdectBody({Key? key,  required this.index}) : super(key: key);
final int index;
  @override
  State<CartProdectBody> createState() => _CartProdectBodyState();
}

class _CartProdectBodyState extends State<CartProdectBody> {

  int _n = 1;
  void add() {
      CartProdectBar.cartList[widget.index].quantity = CartProdectBar.cartList[widget.index].quantity + 1;
      setState(() {
        Get.offAll(MainNav(selectedIndex: 3,),
            transition: Transition.noTransition,
            duration: Duration(seconds: 0));
      });
  }

  void minus() {
      if(CartProdectBar.cartList[widget.index].quantity > 1)
        CartProdectBar.cartList[widget.index].quantity = CartProdectBar.cartList[widget.index].quantity - 1;
      setState(() {
        Get.offAll(MainNav(selectedIndex: 3,),
            transition: Transition.noTransition,
            duration: Duration(seconds: 0));
      });
  }
  @override
  Widget build(BuildContext context) {
    bool f= false;
    return GestureDetector(
        onTap: () {

          //
          // setState(() {
          //   Get.to(ProdectPage(index: widget.index,));
          // });
        },
        child: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 5),
            child: Container(
                height: 115,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          child:
                          OutlinedButton(
                              child:Icon(Icons.add,
                                color: Colorsapp.themeColor,size: 18,) ,
                              style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.only(right: 1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  )
                              ),
                              onPressed: (){
                                add();
                                setState(() {
                                });
                              }),
                        ),
                        Container(
                          width: 30,
                          child: Center(
                            child: Text('${CartProdectBar.cartList[widget.index].quantity.toString()}',
                                style: new TextStyle(fontSize: 20,color: Theme.of(context).accentColor)),
                          ),
                        ),
                        Container(
                          height: 25,
                          width: 25,
                          child:  OutlinedButton(
                              child:Icon(Icons.remove,
                              color: Colorsapp.themeColor,size: 18,) ,
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.red,
                                  padding: EdgeInsets.only(right: 1),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  )
                              ),
                              onPressed: (){
                                minus();
                                setState(() {
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 10),
                    child: Column(
                      children: [
                       Container(
                         height: 40,
                         width: 100,
                         //color: Colors.teal,
                         child: Padding(
                           padding: const EdgeInsets.only(bottom: 1,top: 5,right: 5),
                           child: Align(
                             alignment: Alignment.centerRight,
                             child: Text(
                                 textDirection: TextDirection.rtl,
                                 CartProdectBar.cartList[widget.index].name.toString(),
                                 //  "${BackEnd.Prodects3[prodects].title.substring(0, 6)}...",
                                 style: Text_Style.getstyle(
                                     fontsize: 16,
                                     ColorText: Theme.of(context).accentColor,
                                     fontWeight: FontWeight.w500)),
                           ),
                         ),
                       ),
                        Container(
                          height: 30,
                          width: 100,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                  textDirection: TextDirection.rtl,
                                  '${CartProdectBar.cartList[widget.index].price.toString()} د.ع ',
                                  // '${BackEnd.Prodects3[prodects].price} د.ع ',
                                  style: Text_Style.getstyle(fontsize: 17, ColorText: Theme.of(context).accentColor, fontWeight: FontWeight.w400)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 90,
                    //width: MediaQuery.of(context).size.width - 100,
                    margin: const EdgeInsets.only(top: 0, right: 0, left: 0),
                    decoration:
                    BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                            Api.Domain+CartProdectBar.cartList[widget.index].banner,
                            fit: BoxFit.contain),
                      ),                      /*   Image.network(
                        ApiConstants.Domain +
                            BackEnd.Prodects3[prodects].banner,
                        fit: BoxFit.cover),*/
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10,top: 10),
                    child: Column(
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          child:
                          OutlinedButton(
                              child:
                              Icon( Icons.clear,
                                color: Colorsapp.themeColor,size: 18,) ,
                              style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.only(right: 1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  )
                              ),
                              onPressed: (){
                                CartProdectBar.cartList.remove(CartProdectBar.cartList[widget.index]);
                                print(CartProdectBar.cartList.length);
                                setState(() {
                                  Get.offAll(MainNav(selectedIndex: 3,),
                                      transition: Transition.noTransition,
                                      duration: Duration(seconds: 0));
                                });
                                print('jiiii');
                              }

                          )


                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }
}
