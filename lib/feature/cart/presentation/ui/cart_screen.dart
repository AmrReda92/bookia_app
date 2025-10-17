import 'package:bookia_application/core/theme/app_color.dart';
import 'package:bookia_application/core/theme/app_text_style.dart';
import 'package:bookia_application/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "My Cart",withBackButton: false,centerTitle: true,),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 50.h,),
            Row(
              children: [
                Container(
                  height: 118.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                      color: Colors.green,
                  ),
                  child:ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                      child: Image.network("https://wallpaper.forfun.com/fetch/a6/a63a5a653f974ae46643d9794f2c7313.jpeg",fit: BoxFit.cover, ))
                  ,
                ),
                SizedBox(width: 20.h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("The Republic",style: AppTextStyle.mediumFont.copyWith(color: Color(0xff606060)),),
                        SizedBox(width: 80.w,),
                        SvgPicture.asset("assets/icons/cross shape.svg",width: 26.w,height: 26.h,)
                      ],
                    ),
                    SizedBox(height: 9.h,),
                    Text("₹285",style: AppTextStyle.smallFont.copyWith(color: AppColor.darkBlack)),
                    SizedBox(height:29.h,),
                    Row(
                      children: [
                        Container(
                          width: 30.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: AppColor.darkgrey,
                            borderRadius: BorderRadius.circular(6)
                          ),
                          child: IconButton(
                              onPressed: (){}, icon: Icon(Icons.add,color: Colors.black,size: 18,))),
                        SizedBox(width: 15.w,),
                        Text("01",style: AppTextStyle.mediumFont,),
                        SizedBox(width: 15.w,),
                        Container(
                            width: 30.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                                color: AppColor.darkgrey,
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child: IconButton(
                                onPressed: (){}, icon: Icon(Icons.remove,color: Colors.black,size: 18,))),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }



}
