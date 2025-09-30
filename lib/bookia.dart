import 'package:bookia_application/core/helper/local_services.dart';
import 'package:bookia_application/feature/home/presentation/ui/home_screen.dart';
import 'package:bookia_application/feature/welcome/presentation/ui/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bookia extends StatelessWidget {
  const Bookia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "DMSerifDisplay",
        scaffoldBackgroundColor: Colors.white
      ),
      home: initialScreen(),
    );
  }



 Widget initialScreen(){

    if(LocalServices.prefs?.getString("userToken")==null){
      return WelcomeScreen();
    }else{
      return HomeScreen();
    }

  }
}
