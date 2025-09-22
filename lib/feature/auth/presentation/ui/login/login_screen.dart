import 'package:bookia_application/core/theme/app_color.dart';
import 'package:bookia_application/core/widget/custom_app_bar.dart';
import 'package:bookia_application/core/widget/custom_button.dart';
import 'package:bookia_application/core/widget/custom_text_form_field.dart';
import 'package:bookia_application/feature/auth/presentation/ui/forget_password/forget_password_screen.dart';
import 'package:bookia_application/feature/auth/presentation/ui/login/widget/custom_svg_icon.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget  {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 29,),
              Text("Welcome back! Glad\nto see you, Again!",style: TextStyle(
                fontSize: 30,
              ),
              ),
              SizedBox(height: 32,),
              CustomTextFormField(hintText: "Enter your email",),
              SizedBox(height: 15,),
              CustomTextFormField(hintText: "Enter your password",isPassword: true,),
              SizedBox(height: 13,),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: (){
                    setState(() {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordScreen()));
                    });
                  },
                  child: Text("Forgot Password?",style: TextStyle(
                    fontSize: 14,
                    color: AppColor.darkgrey
                  ),),
                ),
              ),
              SizedBox(height: 30,),
              CustomButton(title: "Login"),
              SizedBox(height: 34,),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      endIndent: 14,
                      color: AppColor.borderColor,
                    ),
                  ),
                  Text("Or Login with",style: TextStyle(
                    color: AppColor.darkgrey
                  ),),
                  Expanded(
                    child: Divider(
                      indent: 14,
                      color: AppColor.borderColor,
                    ),
                  )
                ],
              ),
              SizedBox(height: 21,),
              Row(

                children: [
                  CustomSvgIcon(svgIcon: "assets/icons/facebook_ic.svg"),
                  SizedBox(width: 8,),
                  CustomSvgIcon(svgIcon: "assets/icons/google_ic.svg"),
                  SizedBox(width: 8,),
                  CustomSvgIcon(svgIcon: "assets/icons/cib_apple.svg"),
                ],
              ),
              SizedBox(height: 163,),
              Center(
                child: Text.rich(
                    TextSpan(
                  children: [
                    TextSpan(text: "Don’t have an account?",style: TextStyle(
                      fontSize: 15,
                      color: AppColor.darkBlack
                    )),
                    TextSpan(text: " Register Now",style: TextStyle(
                      fontSize: 15,
                      color: AppColor.primary
                    )
                    ),
                  ]
                )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
