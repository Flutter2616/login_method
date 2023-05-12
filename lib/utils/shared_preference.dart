import 'package:login_method/model/loginmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared
{
  Future<void> setlogindata({required String email,required String password,bool? login})
  async {
    SharedPreferences share=await SharedPreferences.getInstance();
    share.setString('email', email);
    share.setString('password', password);
    share.setBool('login', login!);
  }

  Future<LoginModel> getlogindata()
  async {
    SharedPreferences share= await SharedPreferences.getInstance();
    String? email=share.getString("email");
    String? password=share.getString("password");
    bool? login=share.getBool("login");
    LoginModel l=LoginModel(email: email,logino_option: login,password: password);
    return l;
  }
}