import 'package:flutter/material.dart';
import 'package:login_method/provider/login_provider.dart';
import 'package:login_method/view/homescreen.dart';
import 'package:login_method/view/sign_in_screen.dart';
import 'package:login_method/view/sign_up.dart';
import 'package:login_method/view/splash_screen.dart';
import 'package:provider/provider.dart';
void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => SplashScreen(),
          'login':(context) => Loginscreen(),
          'signup':(context) => Signupscreen(),
          'home':(context) => Homescreen(),
        },
      ),
    ),
  );
}