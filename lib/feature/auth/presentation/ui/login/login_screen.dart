import 'package:bookia_application/core/theme/app_color.dart';
import 'package:bookia_application/core/widget/custom_app_bar.dart';
import 'package:bookia_application/core/widget/custom_button.dart';
import 'package:bookia_application/core/widget/custom_text_form_field.dart';
import 'package:bookia_application/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia_application/feature/auth/presentation/ui/forget_password/forget_password_screen.dart';
import 'package:bookia_application/feature/auth/presentation/ui/login/widget/custom_svg_icon.dart';
import 'package:bookia_application/feature/bottom_nav_bar/presentation/ui/bottom_nav_bar_screen.dart';
import 'package:bookia_application/feature/home/presentation/ui/home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 22.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 29.h,),
              Text("Welcome back! Glad\nto see you, Again!", style: TextStyle(
                fontSize: 30.sp,
              ),
              ),
              SizedBox(height: 32.h,),
              CustomTextFormField(hintText: "Enter your email",
                controller: emailController,),
              SizedBox(height: 15,),
              CustomTextFormField(
                hintText: "Enter your password", isPassword: true,
                controller: passwordController,),
              SizedBox(height: 13.h,),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => ForgetPasswordScreen()));
                    });
                  },
                  child: Text("Forgot Password?", style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColor.darkgrey
                  ),),
                ),
              ),
              SizedBox(height: 30.h,),
              BlocListener<AuthCubit, AuthState>(
                            listener: (context, state) {
                              if(state is LoginLoadingState){
                                showDialog(context: context, builder: (context)=>Center(child: CircularProgressIndicator()));
                              }else if(state is LoginErrorState){
                                Navigator.pop(context);
                                showDialog(context: context, builder: (context)=>AlertDialog(
                                  content: Text(state.erorrMessage),
                                ));
                              }else if(state is LoginSuccessState){
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>BottomNavBarScreen()), (e)=>false);
                              }
                            },
                            child: CustomButton(title: "Login",onTap: (){
                              context.read<AuthCubit>().login(email: emailController.text, password: passwordController.text);
                            },),
                          ),
              SizedBox(height: 34.h,),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      endIndent: 14.w,
                      color: AppColor.borderColor,
                    ),
                  ),
                  Text("Or Login with", style: TextStyle(
                      color: AppColor.darkgrey
                  ),),
                  Expanded(
                    child: Divider(
                      indent: 14.w,
                      color: AppColor.borderColor,
                    ),
                  )
                ],
              ),
              SizedBox(height: 21.h,),
              Row(
                children: [
                  CustomSvgIcon(svgIcon: "assets/icons/facebook_ic.svg"),
                  SizedBox(width: 8.w,),
                  CustomSvgIcon(svgIcon: "assets/icons/google_ic.svg"),
                  SizedBox(width: 8.w,),
                  CustomSvgIcon(svgIcon: "assets/icons/cib_apple.svg"),
                ],
              ),
              SizedBox(height: 163.h,),
              Center(
                child: Text.rich(
                    TextSpan(
                        children: [
                          TextSpan(
                              text: "Don’t have an account?", style: TextStyle(
                              fontSize: 15.sp,
                              color: AppColor.darkBlack
                          )),
                          TextSpan(text: " Register Now", style: TextStyle(
                              fontSize: 15.sp,
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
