import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
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
  final TextEditingController Name = TextEditingController();
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
                            height: MediaQuery
                                .of(context)
                                .size
                                .height,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                color: Colorsapp.bgColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(50),
                                    topLeft: Radius.circular(50))
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 60, bottom: 30),
                                  child: Text(
                                    "أنشأ حسابك الخاص",
                                    style: GoogleFonts.cairo(
                                      textStyle: TextStyle(
                                          fontSize: 24,
                                          color: Colors.black,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 30, bottom: 0),
                                  child: Obx(() {
                                    return Text_Field1(
                                      MyController: Name,
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
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: Obx(() {
                                    return Text_Field1(
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
                                      icon: Icon(
                                          swich == true
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
                                  return Text_Field1(
                                    keyboardType: TextInputType.visiblePassword,
                                    MyController: Confirmpassword,
                                    onChanged: (text) {
                                      typed_Confirmpassword.value = text;
                                      print(text);
                                    },
                                    hintText: 'تأكيد كلمة السر'.obs,
                                    icon: IconButton(
                                      icon: Icon(
                                          swich2 == true
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
                                  );
                                }),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: Button1(
                                    text: 'أنشاء الحساب',
                                    onPressed: () {
                                      print("أنشاء الحساب");
                                      Get.offAll(SignUpPage(),
                                          transition: Transition.noTransition,
                                          duration: Duration(seconds: 1));
                                    },
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                        text: TextSpan(
                                          text: 'تسجيل الدخول',
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () async {
                                              delay1.value=false;
                                              // await BackEnd.get_Categories();
                                              // await BackEnd.Get3();
                                              Future.delayed(const Duration(seconds: 1), () {
                                                Get.offAll(SignInPage(),
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
                                    Text('تمتلك حساب بالفعل؟',
                                        style:GoogleFonts.cairo(
                                            textStyle: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                letterSpacing: 1)))
                                  ],
                                )
                              ],
                            ),
                          ),

                        ])
                )
            )
        )
    );
  }

  length_check() {
    print("منا بدة الفنكسن");
    bool flag = false;
    if (email.text.length < 8 ||
        password1.text.length < 8 ||
        Confirmpassword.text.length < 8 ||
        Name.text.isEmpty) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        messageText: Text('اقل من 8 احرف ',
            textDirection: TextDirection.rtl,
            style: Text_Style.getstyle(fontsize: 15,
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
            style: Text_Style.getstyle(fontsize: 15,
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
            style: Text_Style.getstyle(fontsize: 15,
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
            style: Text_Style.getstyle(fontsize: 15,
                ColorText: Colors.white,
                fontWeight: FontWeight.w400)),
      ));
      flag = false;
    } else if (!email.text.contains(RegExp(r'@.'))) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        messageText: Text('البريد الالكتروني غير صالح ',
            textDirection: TextDirection.rtl,
            style: Text_Style.getstyle(fontsize: 15,
                ColorText: Colors.white,
                fontWeight: FontWeight.w400)),
      ));
      flag = false;
    }
    /*else if (AuthService.res400 == false) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        messageText: Text(AuthService.ers400,
            textDirection: TextDirection.rtl,
            style: Text_Style.getstyle(fontsize: 18, ColorText: Colors.white, fontWeight: FontWeight.w400)),
      ));
      print("اني وصلت لهنا32 ");
    }
    else if (AuthService.signup_falgs == false) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        messageText: Text("البريد الالكتروني غير صالح",
            textDirection: TextDirection.rtl,
            style: Text_Style.getstyle(fontsize: 18, ColorText: Colors.white, fontWeight: FontWeight.w400)),
      ));
      print("اني وصلت لهنا ");
    }
*/

    else {
      flag = true;
      print("يابة شسالفة ");
    }
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print("Failed to pick image : $e");
    }
  }

  Future pickImage_camera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print("Failed to pick image : $e");
    }
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "اختيار الصورة",
            textDirection: TextDirection.rtl,
          ),
          content: Text(
            "اختار صورة من : ",
            textDirection: TextDirection.rtl,
          ),
          actions: [
            MaterialButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 0, left: 0, right: 0),
                      width: 100,
                      height: 40,
                      child: RawMaterialButton(
                        onPressed: () async {
                          await pickImage();
                          Navigator.pop(
                            context,
                          );
                        },
                        fillColor: Color.fromRGBO(69, 185, 238, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          "المعرض",
                          style: GoogleFonts.inter(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.only(bottom: 0, left: 0, right: 0),
                      width: 100,
                      height: 40,
                      child: RawMaterialButton(
                        onPressed: () async {
                          await pickImage_camera();
                          Navigator.pop(
                            context,
                          );
                        },
                        fillColor: Color.fromRGBO(69, 185, 238, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Text(
                          "الكامرة",
                          style: GoogleFonts.inter(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}