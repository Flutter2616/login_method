import 'package:flutter/material.dart';
import 'package:login_method/model/loginmodel.dart';
import 'package:login_method/utils/shared_preference.dart';

class LoginProvider extends ChangeNotifier
{
  Shared share=Shared();
  bool checkbox=false;
  bool showpass=true;
  bool signup=true;//true=signup pending

  void checkboxvalue(bool value)
  {
    checkbox=value;
    notifyListeners();
  }

  void passwordshow()
  {
    if(showpass==true)
      {
        showpass=false;
      }
    else
      {
        showpass=true;
      }
    notifyListeners();
  }

  void signupopnion()
  {
    if(signup==true)
    {
      signup=false;
    }
    else
    {
      signup=true;
    }
    notifyListeners();
  }

  Future<void> loginmethod(TextEditingController txtemail, TextEditingController txtpassword, TextEditingController txtuser, BuildContext context)
  async {
    Shared share= await Shared();
    if(signup==false)
    {
      String email=txtemail.text;
      String password=txtpassword.text;
      String user=txtuser.text;
      share.setlogindata(email: email, password: password, user: user,login: true);
      signup=true;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Register Successfully",
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.green.shade800,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2)));
      txtemail.clear();
      txtpassword.clear();
    }
    else
    {
      String email=txtemail.text;
      String password=txtpassword.text;
      LoginModel l=await share.getlogindata();
      if(l.email==email&&l.password==password)
      {
        Navigator.pushReplacementNamed(context, 'home');
      }
      else
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Wrong email id & password",
                style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.red.shade800,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2)));
      }
    }
    notifyListeners();
  }
}