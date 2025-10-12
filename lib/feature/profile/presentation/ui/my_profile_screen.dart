import 'package:bookia_application/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "My profile",withBackButton: false,),
    );
  }
}
