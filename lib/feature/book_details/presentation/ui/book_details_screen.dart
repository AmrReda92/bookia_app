import 'package:bookia_application/core/theme/app_text_style.dart';
import 'package:bookia_application/core/widget/custom_app_bar.dart';
import 'package:bookia_application/feature/model_nav_bar/model_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_color.dart';
import '../../../home/data/models/product_model.dart';

class BookDetailsScreen extends StatelessWidget {
  final Products? product ;
  const BookDetailsScreen({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actionButton: [
          SvgPicture.asset(ModelNav.favouriteIcon,height: 23.h,width: 25.w,)
        ],
      ),
      body: Center(
        child: Padding(
          padding:  EdgeInsets.only(left: 24.w,right: 22.w),
          child: Column(
            children: [
              Image.network(product?.image??"",
              width: 200.w,
                height: 300.h,
              ),
              SizedBox(height: 11.h,),
              Text(product?.name??"",style: AppTextStyle.verylargeFont,textAlign: TextAlign.center,),
              Text(product?.category??"",style: AppTextStyle.smallFont.copyWith(color: AppColor.primary),textAlign: TextAlign.center,),
              SizedBox(height: 16.h,),
              Text(product?.description??"",textAlign: TextAlign.center,style: TextStyle(
                fontSize: 12,
              ),),
              SizedBox(height: 59.h,),
              Row(
                children: [
                  Text(product?.price??"",style: AppTextStyle.largeFont,),
                  SizedBox(width: 45.w,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 14.h),
                    height: 56.h,
                    width: 212.w,
                    decoration: BoxDecoration(
                      color: AppColor.darkBlack,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text("Add To Cart",style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.white
                      )
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
