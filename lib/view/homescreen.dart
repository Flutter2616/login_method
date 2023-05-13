import 'package:flutter/material.dart';
import 'package:login_method/provider/login_provider.dart';
import 'package:provider/provider.dart';

LoginProvider? lf;
LoginProvider? lt;
class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    lf=Provider.of(context,listen: false);
    lt=Provider.of(context,listen: true);
    return Scaffold(
      backgroundColor: Colors.green.shade800,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 50,
              child: Icon(Icons.done, color: Colors.blue, size: 50, weight: 50),
            ),
            Text(
              "Successfully login",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
