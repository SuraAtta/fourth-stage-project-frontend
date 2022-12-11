import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:fourth_stage/src/views/ui/sign_up_page/sign_up_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/style/button1.dart';
import '../../utils/style/colors.dart';
import 'package:get/get.dart';

import '../../utils/style/text_filed.dart';


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
                          ),
                        ],
                      ),
                        Container(
                              height: MediaQuery.of(context).size.height,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(color: Colorsapp.dGray, blurRadius: 4, spreadRadius: 6),
                                    BoxShadow(color: Colorsapp.bgColor, blurRadius: 7, spreadRadius: 5),
                                  ],
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
                                        fontSize: 24,
                                        color: Colors.black,
                                        letterSpacing: 1,
                                    fontWeight: FontWeight.bold),
                                ),
                              )
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30, bottom: 10),
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
                              Button1(
                                text: 'تسجيل دخول',
                                onPressed: () {
                                  print("تسجيل الدخول");
                                  Get.offAll(SignInPage(),
                                      transition: Transition.noTransition,
                                      duration: Duration(seconds: 1));
                                },
                              ),
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
}