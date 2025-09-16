import 'package:bookia_application/core/theme/app_color.dart';
import 'package:bookia_application/core/widget/custom_app_bar.dart';
import 'package:bookia_application/core/widget/custom_button.dart';
import 'package:bookia_application/core/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Text("Forgot Password?",style: TextStyle(
              fontSize: 30,
            ),
            ),
            SizedBox(height: 10,),
            Text("Don't worry! It occurs. Please enter the email\naddress linked with your account.",style: TextStyle(
              fontSize: 16,
              color: AppColor.hintTextColor
            ),
            ),
            SizedBox(height: 30,),
            CustomTextFormField(hintText: "Enter Your Email"),
            SizedBox(height: 38,),
            CustomButton(title: "Send Code"),
            Spacer(),
            Center(
              child: Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(text: "Remember Password?",style: TextStyle(
                            fontSize: 15,
                            color: AppColor.darkBlack
                        )),
                        TextSpan(text: " Login",style: TextStyle(
                            fontSize: 15,
                            color: AppColor.primary
                        )),
                      ]
                  )
              ),
            ),
            SizedBox(height: 26,),
          ],
        ),
      ),
    );
  }
}
