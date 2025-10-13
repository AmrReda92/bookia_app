import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../model_nav_bar/model_nav.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Image.asset("assets/images/book.png"),
          SizedBox(width: 13.w,),
          Text("Bookia",style: TextStyle(
              fontSize: 22.sp
          ),),
        ],
      ),
      actions: [
        SvgPicture.asset(ModelNav.searchIcon,width: 24.w,height: 24.h,),
        SizedBox(width: 13.w,)
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  Size.fromHeight(56.h);

}
