import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fourth_stage/src/logic/services/api/url.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../models/model.dart';
import 'package:http/http.dart' as http;
import "package:collection/collection.dart";

import '../local_database/shared_preferences.dart';

void main() {
  //print(BackEnd.categoryItems);
  //ApiCall.Get_Prodect();
//print(Api.get_All_Products);
//BackEnd.Get3();
//BackEnd.get_Categories();
  //BackEnd.Get_cart();
}

class BackEnd extends GetxController {
  static bool? isFav = false;
  static bool? add = false;
  static bool? is_clicked = false;
  static bool? delete_from_cart = true;
  static Dio getp = Dio();
  static Dio getcart = Dio();

  static List Prodects3 = <Produect>[].toSet().toList();
  static String token = Database2.box.read("token");

  static Get3() async {
    print('قبل البدايةة بالفنكشن');
    final res = await getp.get(Api.get_All_Products);
    print(res);

    if (res.statusCode == 200 || res.statusCode == 201) {
      print(Prodects3.length);
      Prodects3 = <Produect>[].toSet().toList();
      res.data.forEach((e) {
        Prodects3.add(Produect.fromJson(e));
      });
    }
    print(Prodects3[0].name);
    print("Get3");
  }

  static List apiCategory = [].toSet().toList();

  static get_Categories() async {
    final res = await getp.get(Api.get_All_Categories);
    apiCategory = [].toSet().toList();
    res.data.forEach((e) {
      apiCategory.add(Category.fromJson(e));
    });
    print("get_Categories");
    print(apiCategory[0].name.toString());
    print(apiCategory[0].image);
  }

  //static List apicolorLogo = [].toSet().toList();
  static List apicolorLogo = [].toSet().toList();
  static get_colorLogo() async {
    final res = await getp.get(Api.get_Color_Logo);
    apicolorLogo = [].toSet().toList();
    res.data.forEach((e) {
      apicolorLogo.add(ColorLogo.fromJson(e));
    });
  }

  static List categoryItems = [].toSet().toList();

  static makeCatigoryList() {
    for (int i = 0; i < apiCategory.length; i++) {
      categoryItems.add(Prodects3.where((e) =>
              apiCategory[i].name.toString() == e.category.name.toString())
          .toList());
    }
    print(categoryItems);
  }

  static List ColorListitems = [].toSet().toList();
  static makeColorsLogoList() {
    for (int i = 0; i < apicolorLogo.length; i++) {}
    print(categoryItems);
  }

  static List apiBanners = [].toSet().toList();
  static get_Banners() async {
    final res = await getp.get(Api.get_All_Banners);
    apiBanners.addAll(res.data);
    print(apiBanners[0]);
  }

  static List favList = [].toSet().toList();
  static get_FavList() async {
    final res = await getp.get(Api.get_All_Banners);
    apiBanners.addAll(res.data);
    print(apiBanners[0]);
  }

  static List categoryList = [];

  static Get_Category_List(String text) async {
    categoryList =
        BackEnd.Prodects3.where((e) => e.category.title == text).toList();
  }

  //static List favList = [].toSet().toList();

  // static  Get_Fav_List() async{
  //   favList = BackEnd.Prodects3.where((e) => e.isFav == true).toList();
  //   print("//////////////favvv////////////////");
  //   print(favList.length);
  //
  // }

  static List relatidList = [];

  static Get_Related_List(String text) async {
    relatidList = [].toSet().toList();
    relatidList =
        BackEnd.Prodects3.where((e) => e.category.title == text).toList();
  }

  makeAsFav() {
    if (isFav == false)
      isFav = true;
    else
      isFav = false;
  }

  deleteFromCart() {
    if (delete_from_cart == false)
      delete_from_cart = true;
    else
      delete_from_cart = false;
  }

  makeAsClicked() {
    if (is_clicked == false)
      is_clicked = true;
    else
      is_clicked = false;
  }

  addToCart() {
    if (add == false)
      add = true;
    else
      add = false;
  }

  static List Prodects_cart = <Fav_modles>[].toSet().toList();
  // static String token = Database2.box.read("token");
  //

  static Get_cart() async {
    token = Database2.box.read("token");
    print(Database2.box.read("token"));
    print("////////////فووك الايرور//////////////////");
    try {
      var url = Uri.parse(Api.get_wish_list);
      var headers = {'Authorization': 'Bearer $token'};

      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        // Request was successful
        print(response.body);
      } else {
        // Request failed
        print('Request failed with status: ${response.statusCode}.');
      }
      // final res = await http.get(
      //   Uri.parse(Api.get_wish_list),
      //   // Send authorization headers to the backend.
      //   headers: {
      //     HttpHeaders.authorizationHeader:
      //     'Bearer $token',
      //   },
      // );
      print("/////////////جوه الايرور/////////////////");

      final responseJson = json.decode(response.body);
      responseJson.forEach((e) {
        Prodects_cart.add(Fav_modles.fromJson(e));
      });
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("//////////////////////////////");
        // print(Prodects_cart[0].product.title);

      }
    } catch (e) {
      print("error");
      print(e);
    }
    print("//////////////carttt////////////////");
    print(Prodects_cart.length);
  }

  static add_to_card({required int id}) async {
    print("//////////////هنا فوك////////////////");
    print(Database2.box.read("token"));
    print(Prodects_cart.length);
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'text/plain'
    };
    print("//////////////هنا بالنص////////////////");
    print(Prodects_cart.length);
    var request = http.Request('POST', Uri.parse(Api.post_wish_list));
    request.body = '''{\r\n  "product_id":${id}\r\n  }''';
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    print("//////////////هنا جوة////////////////");
    print(Prodects_cart.length);
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      print("//////////////sssssssssss////////////////");

      print(Prodects_cart.length);
    } else {
      print(response.reasonPhrase);
    }
  }

  // static delete_from_card(int id) async{
  //   var headers = {
  //     'Authorization': 'Bearer $token',
  //     'Content-Type': 'text/plain'
  //   };
  //   var request = http.Request('DELETE', Uri.parse('https://zaynhamza.pythonanywhere.com/api/cart/item/${id}'));
  //   request.body = '''{\r\n  "detail": "string"\r\n}''';
  //   request.headers.addAll(headers);
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     print(await response.stream.bytesToString());
  //   }
  //   else {
  //     print(response.reasonPhrase);
  //   }
  // }
  //
  static create() async {
    print(token);
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'POST', Uri.parse('http://127.0.0.1:10000/api/cart/create'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future sendPostRequest(int id) async {
    Dio dio = Dio(BaseOptions(
      headers: {
        'Authorization': 'Bearer $token',
      },
    ));
    try {
      Response response = await dio.post('http://10.0.2.2:8000/api/wishlist/add-to-wishlist/', data: {
        "product_id": id
      });
      return response.statusCode;
    } catch (e) {
      print('error');
      print(e);
    }
    print('بعدد');
  }

  static List wishlist = <Fav_modles>[].toSet().toList();
  static getWishList() async {
    Dio dio = Dio(BaseOptions(
      headers: {
        'Authorization': 'Bearer $token',
      },
    ));
    final response =
        await dio.get('http://10.0.2.2:8000/api/wishlist/wishlist/');
    if (response.statusCode == 200 || response.statusCode == 201) {
      wishlist = <Fav_modles>[].toSet().toList();
      response.data.forEach((e) {
        wishlist.add(Fav_modles.fromJson(e));
      });
    }
  }
}
