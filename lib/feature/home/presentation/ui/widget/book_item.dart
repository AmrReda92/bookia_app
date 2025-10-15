import 'package:bookia_application/core/theme/app_color.dart';
import 'package:bookia_application/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12.w,right: 12.h,top: 12.h),
      height: 281.h,
      width: 163.w,
      decoration: BoxDecoration(
        color: AppColor.backgroundBookItem,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network("https://images.unsplash.com/photo-1497316730643-415fac54a2af?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1964",
            height: 175.h,
          ),
          SizedBox(height: 6.h,),
          Text("BooK 1",style: AppTextStyle.mediumFont,),
          SizedBox(height: 23.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("₹285",style: AppTextStyle.smallFont,),
              Container(
                height: 28.h,
                width: 73.w,
                decoration: BoxDecoration(
                  color: AppColor.darkBlack,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text("Buy",style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white
                  )
                  ),
                ),
              ),

            ],
          ),
        ],
      )
    );
  }
}
