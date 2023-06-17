import 'dart:convert';
import 'package:fourth_stage/src/logic/services/auth_service/Sign_up_models_to_dart.dart';
import 'package:fourth_stage/src/views/ui/sign_in_page/sign_in_main.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import '../../../views/utils/nav/main_nav.dart';
import '../api/api_calls.dart';
import '../api/url.dart';
import '../local_database/shared_preferences.dart';

class AuthService {
  static RxBool isBusy = false.obs;
  static Sing_up_to_dart? Sign_in_list;
  static bool signIn_falgs = true;
  static bool signup_falgs = true;
  static bool res400 = true;

  static String ers400 = " البريد الالكتروني مستخدم ";

  static signIn({required String email, required String password}) async {
    try {
      var res = await http.post(Uri.parse(Api.Sign_in),
          body: json.encode({
            "email": email,
            "password": password,
          }),
          headers: {'Content-Type': 'application/json'});
      final body2 = json.decode(res.body);

      if (res.statusCode == 200 || res.statusCode == 201) {
        signIn_falgs = true;

        await BackEnd.Get3();
        //await BackEnd.get_Categories();
        Sign_in_list = Sing_up_to_dart.fromJson(body2);

        print(res.statusCode);


        Database2.box.write("email", email);
        Database2.box.write("password1", password);
        Database2.box.write("name", Sign_in_list?.account?.name);
        Database2.box.write("id", Sign_in_list?.account?.id);
        Database2.box.writeInMemory("token", Sign_in_list?.token?.access);



        Get.offAll(MainNav(selectedIndex: 0,),
            transition: Transition.noTransition,
            duration: Duration(seconds: 3));

        print("email : ${Database2.box.read("email")}");
        print("token : ${Database2.box.read("token")}");
        print("first_name : ${Database2.box.read("first_name")}");
        print("last_name : ${Database2.box.read("last_name")}");
        print("id : ${Database2.box.read("id")}");

      } else {
        signIn_falgs = false;
      }
    } catch (e) {
      print("error");
      print(e);
      signIn_falgs = false;
      print("catch :$signIn_falgs");
    }

    isBusy = false.obs;
  }

  static signOut() {
    print("remove");
    Database2.box.remove("name");
    Database2.box.remove("email");
    Database2.box.remove("password1");
    Database2.box.remove("password2");
    Database2.box.remove("token");

    Get.offAll(SignInPage());
  }

  static Sing_up_to_dart? Sign_up_list;

  static dynamic body1;
  static Sign_up({
    required String first_name,
    required String email,
    required String password1,
    required String password2,
  }) async {
    try {
      var res = await http.post(Uri.parse(Api.Sign_up),
          body: json.encode({
            "first_name": first_name,
            "email": email,
            "password1": password1,
            "password2": password2,
          }),
          headers: {'Content-Type': 'application/json',});
      body1 = json.decode(res.body);
      print("statusCode : ${res.statusCode}");

      if (res.statusCode == 200 || res.statusCode == 201) {
        signup_falgs == true;
        Sign_up_list = Sing_up_to_dart.fromJson(body1);

        Database2.box.write("name", first_name);
        Database2.box.write("password1", password1);
        Database2.box.write("email", email);
        Database2.box.write("token", Sign_up_list?.token?.access);
        print("Data in Storage ");
        print(res.body);

        await BackEnd.Get3();
       // await BackEnd.get_Categories();

        print("Database2");
        print("name : ${Database2.box.read("name")}");
        print("email : ${Database2.box.read("email")}");
        print("password1 : ${Database2.box.read("password1")}");
        print("token : ${Database2.box.read("token")}");
        Get.offAll(MainNav(selectedIndex: 0,),
            transition: Transition.noTransition,
            duration: Duration(seconds: 3));

      } else if (res.statusCode == 400){
        print("res400: ${res400}");
        res400 = false;

      }else{
        signup_falgs = false;
        print("signup_falgs:400 ${signup_falgs}");

      }
    } catch (e) {
      signup_falgs = false;

      print("ddddddddd$e");
    }
  }
}
