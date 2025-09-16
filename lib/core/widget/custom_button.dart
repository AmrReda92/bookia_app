import 'package:bookia_application/core/theme/app_color.dart';
import 'package:flutter/material.dart';

import '../../feature/auth/presentation/ui/login/login_screen.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color? backgroundColor ;
  final void Function()? onTap;
  const CustomButton({super.key, required this.title,this.backgroundColor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backgroundColor?? AppColor.primary
        ),child: Text(textAlign: TextAlign.center,title,style: TextStyle(
        color: backgroundColor==null?  Colors.white : AppColor.darkBlack  ,
        fontSize: 15,
        fontFamily: "DMSerifDisplay"
      ),),
      ),
    );
  }
}
