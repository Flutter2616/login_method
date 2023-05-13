import 'package:flutter/material.dart';
import 'package:login_method/model/app_model.dart';
import 'package:login_method/model/loginmodel.dart';
import 'package:login_method/utils/shared_preference.dart';

class LoginProvider extends ChangeNotifier {
  Shared share = Shared();
  bool checkbox = false;
  bool showpass = true;
  bool signup = true; //true=signup pending

  List<webmodel> weblist = [
    webmodel(
        img:
            "https://cdn-1.webcatalog.io/catalog/w3schools/w3schools-icon-filled-256.png?v=1675611833243",
        link: "https://www.w3schools.com/"),
    webmodel(
        img:
            "https://image.winudf.com/v2/image1/Y29tLnRvcHMubGVhcm52ZXJuX2ljb25fMTYzMDc2MDcwM18wODY/icon.png?w=&fakeurl=1",
        link: "https://www.learnvern.com/"),
    webmodel(
        img: "https://static.javatpoint.com/core/images/java-logo3.png",
        link: "https://www.javatpoint.com/"),
    webmodel(
        img:
            "https://repository-images.githubusercontent.com/389729275/371ba38b-8a03-4bff-916c-c3fa5396ceda",
        link: "https://www.geeksforgeeks.org/c-programming-language/"),
    webmodel(
        img:
            "https://static1.xdaimages.com/wordpress/wp-content/uploads/2017/05/stack-overflow.png",
        link: "https://stackoverflow.com/"),
  ];

  void checkboxvalue(bool value) {
    checkbox = value;
    notifyListeners();
  }

  void passwordshow() {
    if (showpass == true) {
      showpass = false;
    } else {
      showpass = true;
    }
    notifyListeners();
  }

  void signupopnion() {
    if (signup == true) {
      signup = false;
    } else {
      signup = true;
    }
    notifyListeners();
  }

  Future<void> loginmethod(
      TextEditingController txtemail,
      TextEditingController txtpassword,
      TextEditingController txtuser,
      BuildContext context) async {
    Shared share = await Shared();
    if (signup == false) {
      String email = txtemail.text;
      String password = txtpassword.text;
      String user = txtuser.text;
      share.setlogindata(
          email: email, password: password, user: user, login: true);
      signup = true;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Register Successfully",
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.green.shade800,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2)));
      txtemail.clear();
      txtpassword.clear();
    } else {
      String email = txtemail.text;
      String password = txtpassword.text;
      LoginModel l = await share.getlogindata();
      if (l.email == email && l.password == password) {
        Navigator.pushReplacementNamed(context, 'home', arguments: l);
      } else {
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
