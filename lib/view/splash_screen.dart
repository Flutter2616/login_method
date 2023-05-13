import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_method/model/loginmodel.dart';
import 'package:login_method/utils/shared_preference.dart';
import 'package:sizer/sizer.dart';

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
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo.png",height: 50.h,width: 50.h,
                fit: BoxFit.fill),
            Text(
              "coding tutorial",
              style: GoogleFonts.sourceCodePro(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal.shade400),
            ),
          ],
        ),
      ),
    );
  }
}
