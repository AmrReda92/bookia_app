import 'package:bookia_application/core/theme/app_color.dart';
import 'package:bookia_application/feature/cart/presentation/ui/cart_screen.dart';
import 'package:bookia_application/feature/favourite/presentation/ui/favourite_screen.dart';
import 'package:bookia_application/feature/home/presentation/ui/home_screen.dart';
import 'package:bookia_application/feature/model_nav_bar/model_nav.dart';
import 'package:bookia_application/feature/profile/presentation/ui/my_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          selectedItemColor: Colors.blue,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed ,
          items: [
         BottomNavigationBarItem(icon: SvgPicture.asset(ModelNav.homeIcon,width: 24.w,height: 24.h,),label: "Home"),
         BottomNavigationBarItem(icon: SvgPicture.asset(ModelNav.favouriteIcon,width: 24.w,height: 24.h,),label: "Favourite"),
         BottomNavigationBarItem(icon: SvgPicture.asset(ModelNav.cartIcon,width: 24.w,height: 24.h,),label: "Cart"),
         BottomNavigationBarItem(icon: SvgPicture.asset(ModelNav.profileIcon,width: 24.w,height: 24.h,),label: "Profile"),
      ]
      ),
      body: screens[currentIndex],
    );
  }
}
