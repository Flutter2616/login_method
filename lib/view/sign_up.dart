import 'package:flutter/material.dart';
import 'package:login_method/utils/shared_preference.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({Key? key}) : super(key: key);

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: txtemail,
                  decoration: InputDecoration(
                    hintText: "email",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(Icons.email_sharp, color: Colors.amber),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: txtpassword,
                  decoration: InputDecoration(
                    hintText: "password",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(Icons.password, color: Colors.amber),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    String email = txtemail.text;
                    String password = txtpassword.text;
                    Shared share = await Shared();
                    share.setlogindata(email: email, password: password,login: true);

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Register Successfully",
                            style: TextStyle(color: Colors.white)),
                        backgroundColor: Colors.green.shade800,
                        behavior: SnackBarBehavior.floating,
                        duration: Duration(seconds: 2)));

                    Navigator.pushReplacementNamed(context, 'login');
                  },
                  child: Text("Sign up"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'login');
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
