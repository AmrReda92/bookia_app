import 'package:bookia_application/feature/cart/data/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_style.dart';
import '../../../../../core/widget/custom_network_image.dart';

class CartBookItem extends StatelessWidget {
  final CartItems? cartItems ;
  final void Function()? onTapRemoveFromCart ;
  final void Function()? increaseQuantityOnTap;
  final void Function()? decreaseQuantityOnTap;
  const CartBookItem({super.key, required this.cartItems, this.onTapRemoveFromCart, this.increaseQuantityOnTap, this.decreaseQuantityOnTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomNetworkImage(
              imageUrl: cartItems?.itemProductImage??"",
              height: 118.h,
              width: 100.w,
              radius: 10.r,),
            SizedBox(width: 20.w,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cartItems?.itemProductName??"" , maxLines: 2,style: AppTextStyle.mediumFont.copyWith(color: Color(0xff606060)),),
                  SizedBox(height: 9.h,),
                  Text(cartItems?.itemProductPrice??"",style: AppTextStyle.smallFont.copyWith(color: AppColor.darkBlack)),
                  SizedBox(height: 29.h,),
                  Row(
                    children: [
                      Container(
                            width: 30.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                                color: Color(0xffE0E0E0),
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child: IconButton(
                                onPressed: increaseQuantityOnTap, icon: Icon(Icons.add,color: Colors.black,size: 18,))),

                      SizedBox(width: 15.w,),
                      Text(cartItems?.itemQuantity.toString()??"",style: AppTextStyle.mediumFont,),
                      SizedBox(width: 15.w,),
                      Container(
                            width: 30.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                                color: Color(0xffE0E0E0),
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child: IconButton(
                                onPressed: decreaseQuantityOnTap, icon: Icon(Icons.remove,color: Colors.black,size: 18,))),
                    ],
                  ),
                ],
              ),
            ),

            InkWell(
                onTap: onTapRemoveFromCart  ,
                child: SvgPicture.asset("assets/icons/cross shape.svg",width: 26.w,height: 26.h,))
          ],
        ),
      ],
    );
  }
}
