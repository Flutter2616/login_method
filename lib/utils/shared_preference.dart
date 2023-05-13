import 'package:login_method/model/loginmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared
{
  Future<void> setlogindata({required String email,required String password,bool? login,required String user})
  async {
    SharedPreferences share=await SharedPreferences.getInstance();
    share.setString('user', user);
    share.setString('email', email);
    share.setString('password', password);
    share.setBool('login', login!);
  }

  Future<LoginModel> getlogindata()
  async {
    SharedPreferences share= await SharedPreferences.getInstance();
    String? email=share.getString("email");
    String? user=share.getString("user");
    String? password=share.getString("password");
    bool? login=share.getBool("login");
    LoginModel l=LoginModel(email: email,logino_option: login,password: password,user: user);
    return l;
  }
}