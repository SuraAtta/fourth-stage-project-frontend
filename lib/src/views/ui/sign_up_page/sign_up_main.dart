import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../logic/services/api/api_calls.dart';
import '../../../logic/services/api/url.dart';
import '../../../logic/services/auth_service/auth.dart';
import '../../../logic/services/local_database/shared_preferences.dart';
import '../../utils/style/button1.dart';
import '../../utils/style/colors.dart';
import 'package:get/get.dart';
import 'dart:io';
import '../../utils/style/text_filed.dart';
import '../../utils/style/text_style.dart';
import '../sign_in_page/sign_in_main.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password1 = TextEditingController();
  final TextEditingController Confirmpassword = TextEditingController();
  RxBool swich = true.obs;
  RxBool swich2 = true.obs;
  File? image;
  final RxBool delay = true.obs;
  static final RxString typed_Name = ''.obs;
  static final RxString typed_email = ''.obs;
  static final RxString typed_password1 = ''.obs;
  static final RxString typed_Confirmpassword = ''.obs;
  final RxBool delay1 = true.obs;

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colorsapp.themeColor,
        animate: false);
    return Scaffold(
        backgroundColor: Colorsapp.themeColor,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    color: Colorsapp.themeColor,
                    child:  Container(
                      height: 300,
                      color: Colorsapp.themeColor,
                      child: Center(
                          child:
                      Container( height:250,width:250,child: Image.network(Api.Domain +BackEnd.apicolorLogo[0].image.toString()))
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colorsapp.bgColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60, bottom: 30),
                      child: Text(
                        "أنشأ حسابك الخاص",
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 0),
                      child: Obx(() {
                        return Text_Field1(
                          MyController: name,
                          onChanged: (text) {
                            typed_Name.value = text;
                            print(text);
                          },
                          hintText: 'ألاسم'.obs,
                          icon: Icon((Icons.person),
                              color: typed_Name.value.isEmpty
                                  ? Colors.black38
                                  : Colorsapp.themeColor),
                          labelText: ''.obs,
                          pass: false,
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Obx(() {
                        return Text_Field1(
                          keyboardType: TextInputType.emailAddress,
                          MyController: email,
                          onChanged: (text) {
                            typed_email.value = text;
                            print(text);
                          },
                          hintText: 'البريد الألكتروني'.obs,
                          icon: Icon((Icons.alternate_email),
                              color: typed_email.value.isEmpty
                                  ? Colors.black38
                                  : Colorsapp.themeColor),
                          labelText: ''.obs,
                          pass: false,
                        );
                      }),
                    ),
                    Obx(() {
                      return Text_Field1(
                        MyController: password1,
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (text) {
                          typed_password1.value = text;
                          print(text);
                        },
                        hintText: 'كلمة السر'.obs,
                        icon: IconButton(
                          icon: Icon(swich == true
                              ? Icons.visibility_off
                              : Icons.visibility),
                          color: typed_password1.value.isEmpty
                              ? Colors.black38
                              : Colorsapp.themeColor,
                          onPressed: () {
                            setState(() {
                              if (swich == false) {
                                swich = true.obs;
                              } else {
                                swich = false.obs;
                              }
                            });
                            print(swich);
                          },
                        ),
                        labelText: ''.obs,
                        pass: swich.value,
                      );
                    }),
                    Obx(() {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Text_Field1(
                          keyboardType: TextInputType.visiblePassword,
                          MyController: Confirmpassword,
                          onChanged: (text) {
                            typed_Confirmpassword.value = text;
                            print(text);
                          },
                          hintText: 'تأكيد كلمة السر'.obs,
                          icon: IconButton(
                            icon: Icon(swich2 == true
                                ? Icons.visibility_off
                                : Icons.visibility),
                            color: typed_Confirmpassword.value.isEmpty
                                ? Colors.black38
                                : Colorsapp.themeColor,
                            onPressed: () {
                              setState(() {
                                if (swich2 == false) {
                                  swich2 = true.obs;
                                } else {
                                  swich2 = false.obs;
                                }
                              });
                              print(swich2);
                            },
                          ),
                          labelText: ''.obs,
                          pass: swich2.value,
                        ),
                      );
                    }),
                    Obx(() {
                      return Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: delay.value == false
                              ? CircularProgressIndicator()
                              : Button1(
                                  text: 'انشاء حساب',
                                  onPressed: () async {
                                    setState(() {});

                                    await Database2.initStorage();
                                    await Database2.initStorageFav();
                                    print("انشاء حساب");
                                    delay.value = false;

                                    print("عاششششششششششششششش");

                                    AuthService.Sign_up(
                                        first_name: name.text,
                                        email: email.text,
                                        password1: password1.text,
                                        password2: Confirmpassword.text);
                                    await Future.delayed(
                                        const Duration(seconds: 3), () async {
                                      print("منا استدعيت الفنكشن");
                                      print(
                                          "signup_falgs11:${AuthService.signup_falgs}");
                                      print("res400111:${AuthService.res400}");

                                      length_check();

                                      print("Done");
                                    });

                                    Future.delayed(const Duration(seconds: 3),
                                        () {
                                      print("Future.delayed ${delay.value}");
                                      delay.value = true;
                                    });
                                    BackEnd.getWishList();
                                  },
                                ));
                    }),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(
                          text: 'تسجيل الدخول',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              //  delay1.value = false;
                              // await BackEnd.get_Categories();
                              // await BackEnd.Get3();
                              Future.delayed(const Duration(seconds: 1), () {
                                Get.offAll(SignInPage(),
                                    transition: Transition.noTransition,
                                    duration: Duration(seconds: 1));
                              });
                              /*     Future.delayed(const Duration(
                                                  seconds: 1), () {
                                                delay1.value = true;
                                                print("هذا الدلي بل اويت${delay1
                                                    .value}");
                                              }
                                              );*/
                            },
                          style: GoogleFonts.cairo(
                            textStyle: TextStyle(
                                fontSize: 16,
                                color: Colorsapp.themeColor,
                                letterSpacing: 1),
                          ),
                        )),
                        Text('تمتلك حساب بالفعل؟',
                            style: GoogleFonts.cairo(
                                textStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    letterSpacing: 1)))
                      ],
                    )
                  ],
                ),
              ),
            ])))));
  }

  length_check() {
    print("منا بدة الفنكسن");
    bool flag = false;
    if (email.text.length < 8 ||
        password1.text.length < 8 ||
        Confirmpassword.text.length < 8 ||
        name.text.isEmpty) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        messageText: Text('اقل من 8 احرف ',
            textDirection: TextDirection.rtl,
            style: Text_Style.getstyle(
                fontsize: 15,
                ColorText: Colors.white,
                fontWeight: FontWeight.w400)),
      ));
      flag = false;
    } else if (password1.text.contains(RegExp(r'[#?!@$%^&*-]'))) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        messageText: Text('كلمة المرور يجب ان لا يحتوي على حروف خاصة  ',
            textDirection: TextDirection.rtl,
            style: Text_Style.getstyle(
                fontsize: 15,
                ColorText: Colors.white,
                fontWeight: FontWeight.w400)),
      ));
      flag = false;
    } else if (Confirmpassword.text != password1.text) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        messageText: Text('كلمة المرور غي متطابقة',
            textDirection: TextDirection.rtl,
            style: Text_Style.getstyle(
                fontsize: 15,
                ColorText: Colors.white,
                fontWeight: FontWeight.w400)),
      ));
      flag = false;
    } else if (email.text.contains(RegExp(r'[#?!$%^&*-]'))) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        messageText: Text('الايميل يجب ان لا يحتوي على حروف خاصة ',
            textDirection: TextDirection.rtl,
            style: Text_Style.getstyle(
                fontsize: 15,
                ColorText: Colors.white,
                fontWeight: FontWeight.w400)),
      ));
      flag = false;
    } else if (!email.text.contains(RegExp(r'[@.]'))) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        messageText: Text('البريد الالكتروني غير صالح ',
            textDirection: TextDirection.rtl,
            style: Text_Style.getstyle(
                fontsize: 15,
                ColorText: Colors.white,
                fontWeight: FontWeight.w400)),
      ));
      flag = false;
    } else if (AuthService.res400 == false) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        messageText: Text(AuthService.ers400,
            textDirection: TextDirection.rtl,
            style: Text_Style.getstyle(
                fontsize: 18,
                ColorText: Colors.white,
                fontWeight: FontWeight.w400)),
      ));
      print("اني وصلت لهنا32 ");
    } else if (AuthService.signup_falgs == false) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        messageText: Text("666البريد الالكتروني غير صالح",
            textDirection: TextDirection.rtl,
            style: Text_Style.getstyle(
                fontsize: 18,
                ColorText: Colors.white,
                fontWeight: FontWeight.w400)),
      ));
      print(flag);
      print("اني وصلت لهنا ");
    } else {
      print("flnnnag");
      flag = true;
      print(flag);
      print("flag");
    }
    print(flag);
    print("يابة شسالفة ");
  }
}
