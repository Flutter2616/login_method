import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_method/model/loginmodel.dart';
import 'package:login_method/utils/shared_preference.dart';
import 'package:login_method/view/homescreen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();
  TextEditingController txtuser = TextEditingController();

  @override
  Widget build(BuildContext context) {
    lf = Provider.of(context, listen: false);
    lt = Provider.of(context, listen: true);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/bg.png",
                  width: 100.w, height: 30.h, fit: BoxFit.fill),
              SizedBox(height: 10),
              Text(
                "Student Login",
                style: GoogleFonts.sourceCodePro(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(lt!.signup?"I am already member!":"Not a member yet?",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp)),
                  TextButton(
                      onPressed: () {
                        lf!.signupopnion();
                      },
                      child: Text(lt!.signup?"Sign up!":"Login!",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue))),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.sp),
                child: Column(
                  children: [
                    Visibility(
                      visible: lt!.signup?false:true,
                      child: Container(
                        width: 100.w,
                        height: 6.h,
                        alignment: Alignment.center,
                        child: TextFormField(
                          controller: txtuser,
                          style: GoogleFonts.sourceCodePro(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              label: Text("Username",
                                  style: GoogleFonts.sourceCodePro(
                                      color: Colors.black,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400)),
                              prefixIcon: Icon(
                                Icons.person_2_outlined,
                                color: Colors.black,
                                size: 18.sp,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  BorderSide(color: Colors.black, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  BorderSide(color: Colors.teal, width: 2))),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: 100.w,
                      height: 6.h,
                      alignment: Alignment.center,
                      child: TextFormField(
                        controller: txtemail,
                        style: GoogleFonts.sourceCodePro(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            label: Text("Email",
                                style: GoogleFonts.sourceCodePro(
                                    color: Colors.black,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400)),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.black,
                              size: 18.sp,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.teal, width: 2))),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: 100.w,
                      height: 6.h,
                      alignment: Alignment.center,
                      child: TextFormField(
                        obscureText: lt!.showpass,
                        style: GoogleFonts.sourceCodePro(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500),
                        controller: txtpassword,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  lf!.passwordshow();
                                },
                                icon: Icon(
                                    lt!.showpass == false
                                        ? Icons.close
                                        : Icons.remove_red_eye_outlined,
                                    color: Colors.black,
                                    size: 15.sp)),
                            label: Text("Password",
                                style: GoogleFonts.sourceCodePro(
                                    color: Colors.black,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400)),
                            prefixIcon: Icon(
                              Icons.lock_open_outlined,
                              color: Colors.black,
                              size: 18.sp,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.teal, width: 2))),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            value: lt!.checkbox,
                            onChanged: (value) {
                              lf!.checkboxvalue(value!);
                            },
                            activeColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            checkColor: Colors.white),
                        Text(
                          "Remember me",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Visibility(
                          visible: lt!.signup?true:false,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forget password?",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.sp,
                                    color: Colors.grey),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: ()  {
                       lf!.loginmethod(txtemail,txtpassword,txtuser,context);
                      },
                      child: Container(
                        height: 6.h,
                        width: 100.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(20.sp)),
                        child: Text(lt!.signup?"Login":"Sign up",
                            style: GoogleFonts.sourceCodePro(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("or",
                        style: GoogleFonts.sourceCodePro(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey)),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          height: 6.h,alignment: Alignment.center,width: 39.w,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade700,
                              borderRadius: BorderRadius.circular(20.sp)),
                          child: Text("f",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.sp)),
                        ),
                        SizedBox(width: 5),
                        Container(
                          height: 6.h,alignment: Alignment.center,width: 39.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.sp)),
                          child: Image.asset("assets/google.png")
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
