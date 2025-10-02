import 'package:bookia_application/core/theme/app_color.dart';
import 'package:bookia_application/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
      ),
      body: Column(
        children: [
          Text("OTP Verification",style: TextStyle(
            fontSize: 40.sp,
            color: AppColor.darkBlack
          ),)
        ],
      ),
    );
  }
}
