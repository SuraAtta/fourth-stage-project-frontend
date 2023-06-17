import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../logic/services/api/api_calls.dart';
import '../../utils/lists/cart_prodect_bar.dart';
import '../../utils/nav/main_nav.dart';
import '../../utils/style/colors.dart';

class ProdectCounter extends StatefulWidget {
  const ProdectCounter({Key? key, required this.prodect, required this.container_color,required this.button_color, required this.left_border, required this.right_border, required this.index}) : super(key: key);
  final int prodect;
  final Color container_color;
  final Color button_color;
  final double left_border;
  final double right_border;
   final int index;
  @override
  State<ProdectCounter> createState() => _ProdectCounterState(prodect,container_color,button_color,left_border,right_border);

}

class _ProdectCounterState extends State<ProdectCounter> {
  final int prodect ;
  final Color container_color;
  final Color button_color;
  final double left_border;
  final double right_border;
  _ProdectCounterState(this.prodect, this.button_color, this.container_color, this.left_border,this.right_border);

  void add() {
    BackEnd.Prodects3[widget.index].quantity = BackEnd.Prodects3[widget.index].quantity + 1;
  }

  void minus() {
    if(BackEnd.Prodects3[widget.index].quantity > 1)
      BackEnd.Prodects3[widget.index].quantity = BackEnd.Prodects3[widget.index].quantity - 1;
  }
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 120,
            height: 35,
            color: container_color ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 28,
                  width: 28,
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
                  width: 40,
                  child: Center(
                    child: Text('${BackEnd.Prodects3[widget.index].quantity.toString()}',
                        style: new TextStyle(fontSize: 24,color: Theme.of(context).accentColor)),
                  ),
                ),
                Container(
                  height: 28,
                  width: 28,
                  child:  OutlinedButton(
                      child:Icon(Icons.remove,
                        color: Colorsapp.themeColor,size: 18,) ,
                      style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.only(right: 1),
                          shape: RoundedRectangleBorder(
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
        ],
      ),
    );
  }
}

// class ProdectsCounter extends StatelessWidget {
//   const ProdectsCounter({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//       ),
//     );
//   }
// }
