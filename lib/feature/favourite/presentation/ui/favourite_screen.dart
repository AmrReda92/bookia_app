import 'package:bookia_application/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Favourite",withBackButton: false,),
    );
  }
}
