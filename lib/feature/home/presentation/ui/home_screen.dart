import 'package:bookia_application/core/helper/local_services.dart';
import 'package:bookia_application/core/widget/custom_app_bar.dart';
import 'package:bookia_application/feature/welcome/presentation/ui/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset("assets/images/book.png"),
            SizedBox(width: 7.w,),
            Text("Bookia",style: TextStyle(
              fontSize: 22.sp
            ),)
          ],
        ),
        actions: [
          Icon(Icons.search,size: 24.r,),
          SizedBox(width: 13.w,)
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 13.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/book photo Home.png",fit: BoxFit.cover,),
            SizedBox(height: 52.h,),
            Text("Best Seller",style: TextStyle(
                  fontSize: 24.sp
               ),
              ),

            SizedBox(height:15.h ,),

            ElevatedButton(onPressed: (){
              LocalServices.prefs?.remove("userToken");
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()), (e)=>false);
            }, child: Text("Logout",style: TextStyle(
              fontSize: 25,
            ),)),
            Row(
              children: [

            ],
            )
          ],
        ),
      ),
    );
  }
}
