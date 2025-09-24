import 'package:bookia_application/core/theme/app_color.dart';
import 'package:bookia_application/core/widget/custom_app_bar.dart';
import 'package:bookia_application/core/widget/custom_button.dart';
import 'package:bookia_application/core/widget/custom_text_form_field.dart';
import 'package:bookia_application/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia_application/feature/auth/presentation/ui/forget_password/forget_password_screen.dart';
import 'package:bookia_application/feature/auth/presentation/ui/login/widget/custom_svg_icon.dart';
import 'package:bookia_application/feature/home/presentation/ui/home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 29,),
              Text("Welcome back! Glad\nto see you, Again!", style: TextStyle(
                fontSize: 30,
              ),
              ),
              SizedBox(height: 32,),
              CustomTextFormField(hintText: "Enter your email",
                controller: emailController,),
              SizedBox(height: 15,),
              CustomTextFormField(
                hintText: "Enter your password", isPassword: true,
                controller: passwordController,),
              SizedBox(height: 13,),
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
                      fontSize: 14,
                      color: AppColor.darkgrey
                  ),),
                ),
              ),
              SizedBox(height: 30,),
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
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()), (e)=>false);
                              }
                            },
                            child: CustomButton(title: "Login",onTap: (){
                              context.read<AuthCubit>().login(email: emailController.text, password: passwordController.text);
                            },),
                          ),
              SizedBox(height: 34,),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      endIndent: 14,
                      color: AppColor.borderColor,
                    ),
                  ),
                  Text("Or Login with", style: TextStyle(
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
                          TextSpan(
                              text: "Don’t have an account?", style: TextStyle(
                              fontSize: 15,
                              color: AppColor.darkBlack
                          )),
                          TextSpan(text: " Register Now", style: TextStyle(
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
