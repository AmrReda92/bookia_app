import 'package:bookia_application/core/widget/custom_app_bar.dart';
import 'package:bookia_application/core/widget/custom_button.dart';
import 'package:bookia_application/core/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_color.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              Text("Hello! Register to get\nstarted",style: TextStyle(
                fontFamily: "DMSerifDisplay",
                fontSize: 30,
              ),
              ),
              SizedBox(height: 32,),
              CustomTextFormField(hintText: "Username"),
              SizedBox(height: 12,),
              CustomTextFormField(hintText: "Email"),
              SizedBox(height: 12,),
              CustomTextFormField(hintText: "password",isPassword: true,),
              SizedBox(height: 12,),
              CustomTextFormField(hintText: "Confirm Password",isPassword: true,),
              SizedBox(height: 30,),
              CustomButton(title: "Register"),
              SizedBox(height: 184,),
              Center(
                child: Text.rich(
                    TextSpan(
                        children: [
                          TextSpan(text: "Already have an account?",style: TextStyle(
                              fontSize: 15,
                              color: AppColor.darkBlack
                          )),
                          TextSpan(text: "  Login Now",style: TextStyle(
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
