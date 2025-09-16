import 'package:bookia_application/core/theme/app_color.dart';
import 'package:bookia_application/core/widget/custom_button.dart';
import 'package:bookia_application/feature/auth/presentation/ui/login/login_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container(
         decoration: BoxDecoration(
           image: DecorationImage(fit: BoxFit.cover,image:Image.asset("assets/images/background_welcome.png",).image)
         ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              SizedBox(height: 135,),
              Image.asset("assets/images/logo_1x.png"),
              SizedBox(height: 28,),
              Text("Order Your Book Now!",style: TextStyle(
                fontSize: 20,
                color: AppColor.darkBlack,
                fontWeight: FontWeight.w400,
                fontFamily: "DMSerifDisplay"
              ),),
              Spacer(),
              CustomButton(title: "Login",onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              },),
              SizedBox(height: 15,),
              CustomButton(title: "Register",backgroundColor: Colors.white,),
              SizedBox(height: 94,)
            ],
          ),
        ),
      ),

    );
  }
}
