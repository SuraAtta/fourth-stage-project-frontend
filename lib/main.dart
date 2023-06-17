import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fourth_stage/src/logic/DarkMode/model.dart';
import 'package:fourth_stage/src/logic/services/api/api_calls.dart';
import 'package:fourth_stage/src/views/ui/splash_page/splash.dart';
import 'package:fourth_stage/src/views/utils/style/colors.dart';
import 'package:get/get.dart' hide Response;
import 'package:provider/provider.dart';

void main() {
  BackEnd.get_colorLogo();
  print(BackEnd.apicolorLogo);
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // Future.delayed(const Duration(seconds: 1), () {
  //   runApp(MyApp());
  // });
  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
    await themeChangeProvider.darkThemePreference.getTheme();
  }
  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider<DarkThemeProvider>(
        create: (_) {
          return themeChangeProvider;
        },
        child: Consumer<DarkThemeProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: Colorsapp2.themeData(themeChangeProvider.darkTheme, context),
              home: Splash(),
              routes: <String, WidgetBuilder>{
              //  AGENDA: (BuildContext context) => AgendaScreen(),
              },
            );
          },
        ),
      );
      GetMaterialApp(

      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}



