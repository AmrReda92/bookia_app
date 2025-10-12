import 'package:bookia_application/core/theme/app_color.dart';
import 'package:bookia_application/feature/cart/presentation/ui/cart_screen.dart';
import 'package:bookia_application/feature/favourite/presentation/ui/favourite_screen.dart';
import 'package:bookia_application/feature/home/presentation/ui/home_screen.dart';
import 'package:bookia_application/feature/profile/presentation/ui/my_profile_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currentIndex=0;
  List<Widget> screens =[
    HomeScreen(),
    FavouriteScreen(),
    CartScreen(),
    MyProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
         onTap: (index) {
           setState(() {
             currentIndex=index;
           });
         },
          selectedItemColor: AppColor.primary,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed ,
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favorite"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_basket),label: "cart"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "profile"),
      ]
      ),
      body: screens[currentIndex],
    );
  }
}
