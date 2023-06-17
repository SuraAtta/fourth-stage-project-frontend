class add_min{
   int _n = 1;

   void add() {
    //print(MyCardsList.cartList[prodect].quantity);
    // MyCardsList.cartList[prodect].quantity =MyCardsList.cartList[prodect].quantity+1;
    // print(MyCardsList.cartList[prodect].quantity);
    _n = _n + 1;
  }

  void minus() {
    //  print(MyCardsList.cartList[prodect].quantity);
    //  if(MyCardsList.cartList[prodect].quantity > 1)
    //   MyCardsList.cartList[prodect].quantity =MyCardsList.cartList[prodect].quantity-1;
    // print(MyCardsList.cartList[prodect].quantity);
    if(_n > 1)
      _n = _n - 1;
  }

}