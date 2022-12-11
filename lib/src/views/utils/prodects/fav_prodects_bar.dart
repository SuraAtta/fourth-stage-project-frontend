import 'package:flutter/cupertino.dart';
import 'prodect_body.dart';

class FavProdectsBar extends StatefulWidget {
  const FavProdectsBar({Key? key}) : super(key: key);

  @override
  State<FavProdectsBar> createState() => _FavProdectsBarState();
}

class _FavProdectsBarState extends State<FavProdectsBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio:MediaQuery.of(context).size.width / 500,
          ),
          itemCount: 7,
          itemBuilder: (BuildContext context, index) {
            //if(BackEnd.favList[index].isFav == true){
              return CartBody();
          //}
            //return SizedBox(height: 0,width: 0,);
          }
      ),
    );
  }
}
