import 'package:bookia_application/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget  {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            Text("Welcome back! Glad\nto see you, Again!",style: TextStyle(
              fontFamily: "DMSerifDisplay",
              fontSize: 30,
            ),
            ),
            SizedBox(height: 32,),
          ],
        ),
      ),
    );
  }
}
