import 'package:flutter/material.dart';
import 'package:login_method/model/loginmodel.dart';
import 'package:login_method/provider/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

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
    lf = Provider.of(context, listen: false);
    lt = Provider.of(context, listen: true);
    // LoginModel l = ModalRoute.of(context)!.settings.arguments as LoginModel;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "",
                activeIcon: Icon(Icons.home)),
            BottomNavigationBarItem(
                icon: Icon(Icons.book_outlined),
                label: "",
                activeIcon: Icon(Icons.book)),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                label: "",
                activeIcon: Icon(Icons.person)),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
          unselectedItemColor: Colors.grey.shade600,
          iconSize: 20.sp,
          selectedItemColor: Colors.blue,
        ),
        backgroundColor: Colors.blue.shade100,
        body: Column(
          children: [
            Container(
              width: 100.w,
              height: 15.h,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.sp),
                      bottomRight: Radius.circular(20.sp))),
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Hello,",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp),
                      ),
                      Text(
                        "Well come✋",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CircleAvatar(
                      radius: 18.sp,
                      backgroundColor: Colors.blue.shade100,
                      child:
                          Icon(Icons.person, color: Colors.grey, size: 25.sp),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 6.h,
                        width: 75.w,
                        padding: EdgeInsets.only(left: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: Colors.white),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Search",
                              suffixIcon:
                                  Icon(Icons.search, color: Colors.black),
                              border: InputBorder.none),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 6.h,
                        width: 6.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.sp),
                            color: Colors.blue),
                        child: Icon(Icons.tune, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Courses",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 55.h,
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.sp,
                          crossAxisSpacing: 10.sp),
                     itemBuilder: (context, index) {
                       return InkWell(
                         onTap: () {
                           Navigator.pushNamed(context, 'web',arguments: lf!.weblist[index].link);
                         },
                         child: Container(
                           width: 40.w,
                           height: 30.h,
                           alignment: Alignment.center,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(20.sp),
                               color: Colors.blue.shade50),
                           child: CircleAvatar(
                             radius: 40.sp,
                             backgroundImage: NetworkImage(
                                 "${lf!.weblist[index].img}"),
                           ),
                         ),
                       );
                     },itemCount: lf!.weblist.length,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
