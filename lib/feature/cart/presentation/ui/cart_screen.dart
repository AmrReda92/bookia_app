import 'package:bookia_application/core/theme/app_color.dart';
import 'package:bookia_application/core/theme/app_text_style.dart';
import 'package:bookia_application/core/widget/custom_app_bar.dart';
import 'package:bookia_application/core/widget/custom_network_image.dart';
import 'package:bookia_application/feature/cart/data/repo/cart_repo.dart';
import 'package:bookia_application/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia_application/feature/cart/presentation/ui/widget/cart_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "My Cart", withBackButton: false, centerTitle: true,),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 50.h,),
            BlocBuilder< CartCubit, CartState>(
              builder: (context, state) {
                if (state is GetCartLoading){
                  return Center(child: CircularProgressIndicator());
                }else if(state is GetCartSuccess){
                  return Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => CartBookItem(
                          cartItems: state.cartProduct[index],
                        ),
                        separatorBuilder: (context, index) =>
                            Divider(height: 40,),
                        itemCount: state.cartProduct.length),
                  );
                }else{
                  return Text("Error");
                }
              },
            )
          ],
        ),
      ),
    );
  }


}
