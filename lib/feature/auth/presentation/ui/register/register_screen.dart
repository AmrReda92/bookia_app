import 'package:bookia_application/core/widget/custom_app_bar.dart';
import 'package:bookia_application/core/widget/custom_button.dart';
import 'package:bookia_application/core/widget/custom_text_form_field.dart';
import 'package:bookia_application/feature/auth/data/repo/auth_repo.dart';
import 'package:bookia_application/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia_application/feature/auth/presentation/ui/otp_verification/otp_screen.dart';
import 'package:bookia_application/feature/auth/presentation/ui/register/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_color.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

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
                  SizedBox(height: 28.h,),
                  Text("Hello! Register to get\nstarted",
                    style: TextStyle(
                    fontFamily: "DMSerifDisplay",
                    fontSize: 30,
                  ),
                  ),
                  SizedBox(height: 32.h,),
                  RegisterForm(),
                  SizedBox(height: 150.h,),
                  Center(
                    child: Text.rich(
                        TextSpan(
                            children: [
                              TextSpan(text: "Already have an account?",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: AppColor.darkBlack
                                  )),
                              TextSpan(text: "  Login Now", style: TextStyle(
                                  fontSize: 15.sp,
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
