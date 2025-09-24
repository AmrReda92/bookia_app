import 'package:bookia_application/core/widget/custom_app_bar.dart';
import 'package:bookia_application/core/widget/custom_button.dart';
import 'package:bookia_application/core/widget/custom_text_form_field.dart';
import 'package:bookia_application/feature/auth/data/repo/auth_repo.dart';
import 'package:bookia_application/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia_application/feature/auth/presentation/ui/otp_verification/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_color.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController =TextEditingController() ;
  TextEditingController emailController =TextEditingController() ;
  TextEditingController passwordController =TextEditingController() ;
  TextEditingController confirmPasswordController =TextEditingController();

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
                  SizedBox(height: 28,),
                  Text("Hello! Register to get\nstarted", style: TextStyle(
                    fontFamily: "DMSerifDisplay",
                    fontSize: 30,
                  ),
                  ),
                  SizedBox(height: 32,),
                  CustomTextFormField(hintText: "Username",controller: nameController,),
                  SizedBox(height: 12,),
                  CustomTextFormField(hintText: "Email",controller: emailController,),
                  SizedBox(height: 12,),
                  CustomTextFormField(hintText: "password", isPassword: true,controller: passwordController,),
                  SizedBox(height: 12,),
                  CustomTextFormField(
                    hintText: "Confirm Password", isPassword: true,controller: confirmPasswordController,),
                  SizedBox(height: 30,),
                  BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) {
                     if(state is registerLoadingState){
                       showDialog(context: context, builder: (context)=>Center(child: CircularProgressIndicator()));
                     }else if(state is registerErrorState){
                       Navigator.pop(context);
                       showDialog(context: context, builder: (context)=>AlertDialog(
                         content: Text(state.erorrMessage),
                       ));
                     }else if(state is registerSuccessState){
                       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>OtpScreen()), (e)=>false);

                     }
                    },
                    child: CustomButton(title: "Register",onTap: (){
                      context.read<AuthCubit>().register(name: nameController.text, email: emailController.text, password: passwordController.text, passwordConfirmation: confirmPasswordController.text);
                    },),
                  ),
                  SizedBox(height: 184,),
                  Center(
                    child: Text.rich(
                        TextSpan(
                            children: [
                              TextSpan(text: "Already have an account?",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: AppColor.darkBlack
                                  )),
                              TextSpan(text: "  Login Now", style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.primary
                              )),
                            ]
                        )
                    ),
                  ),
                ],
              ),
            ),
          )
      );
  }
}
