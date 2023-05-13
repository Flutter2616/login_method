import 'package:flutter/material.dart';
import 'package:login_method/provider/login_provider.dart';
import 'package:login_method/view/homescreen.dart';
import 'package:login_method/view/sign_in_screen.dart';
import 'package:login_method/view/splash_screen.dart';
import 'package:login_method/view/web_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
         return MaterialApp(
           debugShowCheckedModeBanner: false,
           // initialRoute: 'home',
           routes: {
             '/': (context) => SplashScreen(),
             'login': (context) => Loginscreen(),
             'home': (context) => Homescreen(),
             'web': (context) => Webscreen(),
           },
         );
        },

      ),
    ),
  );
}
