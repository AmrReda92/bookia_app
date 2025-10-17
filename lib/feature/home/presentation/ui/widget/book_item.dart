import 'package:bookia_application/core/theme/app_color.dart';
import 'package:bookia_application/core/theme/app_text_style.dart';
import 'package:bookia_application/feature/book_details/presentation/ui/book_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/product_model.dart';

class BookItem extends StatelessWidget {
  final Products product ;
  final void Function()? onTap;
  const BookItem({super.key, required this.product, this.onTap,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ,
      child: Container(
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
            Image.network(product.image??"",
              height: 175.h,
            ),
            SizedBox(height: 6.h,),
            Text(product.name??"",style: AppTextStyle.mediumFont,
              maxLines: 1,
            overflow: TextOverflow.ellipsis,),
            SizedBox(height: 23.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product.price??"",style: AppTextStyle.smallFont,),
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
      ),
    );
  }
}
