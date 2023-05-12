import 'package:flutter/material.dart';
import 'package:login_method/model/loginmodel.dart';
import 'package:login_method/utils/shared_preference.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
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
                  onPressed: ()  async {
                    String email = txtemail.text;
                    String password = txtpassword.text;
                   Shared share=Shared();
                   LoginModel l=await share.getlogindata();
                  if(l.email==email&&l.password==password)
                    {
                      Navigator.pushReplacementNamed(context, 'home');
                    }
                  else
                    {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid email id and pass word")));
                    }
                  },
                  child: Text("login"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'signup');
                    },
                    child: Text(
                      "Create new account",
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
