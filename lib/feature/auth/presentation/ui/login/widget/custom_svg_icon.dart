import 'package:bookia_application/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgIcon extends StatelessWidget {
  final String svgIcon ;
  const CustomSvgIcon({super.key, required this.svgIcon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.borderColor) ,
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.white,
        ),child: SvgPicture.asset(svgIcon) ,
      ),
    );
  }
}
