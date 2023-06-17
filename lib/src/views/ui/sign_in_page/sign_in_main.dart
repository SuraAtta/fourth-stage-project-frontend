import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:fourth_stage/src/views/ui/sign_up_page/sign_up_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../logic/services/api/api_calls.dart';
import '../../../logic/services/api/url.dart';
import '../../../logic/services/auth_service/auth.dart';
import '../../../logic/services/local_database/shared_preferences.dart';
import '../../utils/style/button1.dart';
import '../../utils/style/colors.dart';
import 'package:get/get.dart';

import '../../utils/style/text_filed.dart';
import '../../utils/style/text_style.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  static final RxString typed_email = ''.obs;
  static final RxString typed_password = ''.obs;
  final RxBool delay1 = true.obs;

  bool swich = true;

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colorsapp.themeColor,
        animate: false);
    return Scaffold(
        backgroundColor: Colorsapp.themeColor,
        body: SafeArea(
          child:
          SingleChildScrollView(
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
                             child:
                              Center(child:
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
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50))
                              ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 60, bottom: 30),
                                child: Text(
                                  "سجل الدخول الى حسابك",
                                  style: GoogleFonts.cairo(
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        letterSpacing: 1,
                                    fontWeight: FontWeight.bold),
                                ),
                              )
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10, bottom: 20),
                                child: Obx(() {
                                  return Text_Field1(
                                    MyController: email,
                                    onChanged: (text) {
                                      typed_email.value = text;
                                      print(text);
                                    },
                                    hintText: 'البريد الألكتروني'.obs,
                                    icon: Icon((Icons.person),
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
                                  MyController: password,
                                  onChanged: (text) {
                                    typed_password.value = text;
                                    print(text);
                                  },
                                  hintText: 'كلمة السر'.obs,
                                  icon: IconButton(
                                    icon: Icon(swich == true
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined),
                                    color: typed_password.value.isEmpty
                                        ? Colors.black38
                                        : Colorsapp.themeColor,
                                    onPressed: () {
                                      setState(() {
                                        if (swich == false) {
                                          swich = true;
                                        } else {
                                          swich = false;
                                        }
                                      });
                                      print(swich);
                                    },
                                  ),
                                  labelText: ''.obs,
                                  pass: swich,
                                );
                              }),
                              Obx(() {
                                return Padding(
                                    padding: const EdgeInsets.only(top: 20, bottom: 10),

                                    child: delay1.value == false
                                        ? CircularProgressIndicator()
                                        : Button1(
                                      text: 'تسجيل الدخول',
                                      onPressed: () async {
                                        print("هذا الدلي الاصلي${delay1.value}");

                                        setState(() {

                                        });
                                        await Database2.initStorage();
                                        delay1.value = false;
                                        print("هذا الدلي قبل اويت${delay1.value}");


                                        AuthService.signIn(
                                            email: email.text,
                                            password: password.text);
                                        await Future.delayed(
                                            const Duration(seconds: 3), () async {
                                          password_check();
                                        });

                                        // await Future.delayed(
                                        //     const Duration(seconds: 2), () async {
                                        //
                                        //   if (password_check()==true) {
                                        //     print("عاشت ايدك");
                                        //
                                        //
                                        //   }
                                        //
                                        // });



                                        Future.delayed(const Duration(seconds: 3), () {
                                          delay1.value = true;
                                          print("هذا الدلي بل اويت${delay1.value}");

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
                                        text: ' أنشاء حساب',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () async {
                                            delay1.value=false;
                                            // await BackEnd.get_Categories();
                                            // await BackEnd.Get3();
                                            Future.delayed(const Duration(seconds: 1), () {
                                              Get.offAll(SignUpPage(),
                                                  transition: Transition.noTransition,
                                                  duration: Duration(seconds: 1));

                                            });
                                            Future.delayed(const Duration(seconds: 1), () {
                                              delay1.value = true;
                                              print("هذا الدلي بل اويت${delay1.value}");
                                            });
                                          },
                                        style: GoogleFonts.cairo(
                                          textStyle: TextStyle(
                                              fontSize: 16,
                                              color: Colorsapp.themeColor,
                                              letterSpacing: 1),
                                        ),
                                      )
                                  ),
                                  Text('لا تمتلك حساب؟',
                                      style:GoogleFonts.cairo(
                                    textStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        letterSpacing: 1)
                                      )
                                  )
                                ],
                              )

                            ],
                          ),
                      ),
                         ]
                )
                      )
            )
        )
    );
  }
  password_check() {
    bool flags = false;
    if (password.text.isEmpty||email.text.isEmpty) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        messageText: Text("النص فارغ",
            textDirection: TextDirection.rtl,
            style: Text_Style.getstyle(fontsize: 18, ColorText: Colors.white, fontWeight: FontWeight.w400)),
      ));
    }
    else if (password.text.length < 8) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        messageText: Text("الباسورد اقل من 8 احرف",
            textDirection: TextDirection.rtl,
            style: Text_Style.getstyle(fontsize: 18, ColorText: Colors.white, fontWeight: FontWeight.w400)),
      ));
    } else if (password.text.contains(RegExp(r'[#?!@$%^&*-]'))) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        messageText: Text(" الباسورد يجب ان لا يحتوي على حروف خاصة",
            textDirection: TextDirection.rtl,
            style: Text_Style.getstyle(fontsize: 18, ColorText: Colors.white, fontWeight: FontWeight.w400)),
      ));
    } else if (AuthService.signIn_falgs == false) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        messageText: Text("اعد المحاولة",
            textDirection: TextDirection.rtl,
            style: Text_Style.getstyle(fontsize: 18, ColorText: Colors.white, fontWeight: FontWeight.w400)),
      ));
    }




    else {
      flags = true;
    }
  }
}