import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:fourth_stage/src/views/ui/home_page/home.dart';
import 'package:fourth_stage/src/views/ui/sign_in_page/sign_in_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loading_animations/loading_animations.dart';
import '../../utils/nav/main_nav.dart';
import '../../utils/style/button1.dart';
import '../../utils/style/colors.dart';
import '../../utils/style/text_style.dart';
import '../sign_up_page/sign_up_main.dart';


class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  final RxBool delay1 = true.obs;

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colorsapp.themeColor,
        animate: false);

    return Scaffold(
        backgroundColor:Colorsapp.themeColor,
        body: SafeArea(
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 300,
                        color: Colorsapp.themeColor,
                      )
                    ]
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colorsapp.bgColor,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50) )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Column(
                          children: [
                            Button1(
                              text: 'تسجيل دخول',
                              onPressed: () {
                                print("تسجيل الدخول");
                                Get.offAll(SignInPage(),
                                    transition: Transition.noTransition,
                                    duration: Duration(seconds: 1));
                              },
                            ),
                            Button1(
                              text: 'انشاء حساب',
                              onPressed: () {
                                print("انشاء حساب");
                                Get.offAll(SignUpPage(),
                                    transition: Transition.noTransition,
                                    duration: Duration(seconds: 1));
                              },
                            ),
                            RichText(
                                text: TextSpan(
                                  text: 'الدخول كزائر',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      delay1.value=false;
                                     // await BackEnd.get_Categories();
                                     // await BackEnd.Get3();
                                      Future.delayed(const Duration(seconds: 3), () {
                                        Get.offAll(MainNav(selectedIndex: 0,),
                                            transition: Transition.noTransition,
                                            duration: Duration(seconds: 2));

                                      });
                                      Future.delayed(const Duration(seconds: 3), () {
                                        delay1.value = true;
                                        print("هذا الدلي بل اويت${delay1.value}");
                                      });
                                    },
                                  style: GoogleFonts.cairo(
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        color: Colorsapp.themeColor,
                                        letterSpacing: 1),
                                  ),
                                )),
                            Obx(() {
                                  return delay1.value == false
                                      ? Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child:LoadingFadingLine.circle(
                                        size: 50,
                                        backgroundColor: Colorsapp.themeColor
                                    ),
                                  ):Container();
                                }
                            ),
                          /*  LoadingJumpingLine.square(
                               size: 50,
                               backgroundColor: Colorsapp.bgColor
                            ),*/

                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        )
    );
  }
}
