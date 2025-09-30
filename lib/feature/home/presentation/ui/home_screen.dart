import 'package:bookia_application/core/helper/local_services.dart';
import 'package:bookia_application/core/widget/custom_app_bar.dart';
import 'package:bookia_application/feature/welcome/presentation/ui/welcome_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            LocalServices.prefs?.remove("userToken");
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()), (e)=>false);
          }, child: Text("Logout",style: TextStyle(
            fontSize: 25,
          ),))
        ],
      ),
    );
  }
}
