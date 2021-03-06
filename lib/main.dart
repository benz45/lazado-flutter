import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:naiban/themes/color_app.dart';
import 'package:naiban/views/detail/category/CategoryScreen.dart';
import 'package:naiban/views/detail/home/homeScreen.dart';
import 'package:naiban/views/loginByEmailScreen.dart';
import 'package:naiban/views/loginByPhoneNumberScreen.dart';
import 'package:naiban/views/detail/login/loginScreen.dart';
import 'package:naiban/views/registerScreen.dart';
import 'package:naiban/views/splashScreen.dart';
import 'package:naiban/views/wellcomepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: sPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'RSU',
        bottomSheetTheme:
            BottomSheetThemeData(backgroundColor: Colors.transparent),
      ),
      initialRoute: '/',
      routes: {
        '/HomePage': (context) => HomeScreen(),
        '/Wellcome': (context) => Wellcome(),
        '/Register': (context) => RegisterScreen(),
        '/Login': (context) => LoginScreen(),
        '/Category': (context) => CategoryScreen(),
        '/LoginByEmailScreen': (context) => LoginByEmailScreen(),
        '/LoginByPhoneNumberScreen': (context) => LoginByPhoneNumberScreen(),
      },
      home: SpashScreen(),
    );
  }
}
