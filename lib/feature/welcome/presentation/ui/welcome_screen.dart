import 'package:bookia_application/core/theme/app_color.dart';
import 'package:bookia_application/core/widget/custom_button.dart';
import 'package:bookia_application/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia_application/feature/auth/presentation/ui/login/login_screen.dart';
import 'package:bookia_application/feature/auth/presentation/ui/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: Image
                    .asset(
                  "assets/images/background_welcome.png",
                )
                    .image)),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            children: [
              SizedBox(
                height: 135.h,
              ),
              Image.asset("assets/images/logo_1x.png"),
              SizedBox(
                height: 28.h,
              ),
              Text(
                "Order Your Book Now!",
                style: TextStyle(
                    fontSize: 20.sp,
                    color: AppColor.darkBlack,
                    fontWeight: FontWeight.w400,
                    fontFamily: "DMSerifDisplay"),
              ),
              Spacer(),
              CustomButton(
                title: "Login",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>

                              BlocProvider(
                                create: (context) => AuthCubit(),
                                child: LoginScreen(),
                              )

                      )
                  );
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomButton(
                title: "Register",
                backgroundColor: Colors.white,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              BlocProvider(
                                create: (context) => AuthCubit(),
                                child: RegisterScreen(),
                              )));
                },
              ),
              SizedBox(
                height: 94.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
