import 'package:flutter/material.dart';
import 'package:login_method/model/loginmodel.dart';
import 'package:login_method/utils/shared_preference.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),() async {
      Shared share=Shared();
      LoginModel l=await share.getlogindata();
      l.logino_option==true?Navigator.pushNamed(context, "home"):Navigator.pushNamed(context, "login");
    },);
    return Scaffold(
      body: Center(
        child: Image.network("https://img.freepik.com/free-vector/login-concept-illustration_114360-739.jpg?w=2000",
            fit: BoxFit.fill, height: 250, width: 250),
      ),
    );
  }
}
