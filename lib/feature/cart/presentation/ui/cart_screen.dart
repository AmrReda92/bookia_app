
import 'package:bookia_application/core/theme/app_text_style.dart';
import 'package:bookia_application/core/widget/custom_app_bar.dart';
import 'package:bookia_application/core/widget/custom_button.dart';
import 'package:bookia_application/core/widget/custom_text_form_field.dart';
import 'package:bookia_application/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia_application/feature/cart/presentation/ui/widget/cart_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "My Cart", withBackButton: false, centerTitle: true,),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: IntrinsicHeight(
          child: Column(
            children: [
              BlocBuilder<CartCubit, CartState>(
  builder: (context, state) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total",style: AppTextStyle.largeFont,),
                  Text(context.read<CartCubit>().totalPrice??"0",style: AppTextStyle.largeFont,),
                ],
              );
  },
),
              SizedBox(height: 19.h,),
              CustomButton(title: "Checkout"),
              SizedBox(height: 15.h,),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 50.h,),
            BlocBuilder< CartCubit, CartState>(
              buildWhen: (prev,current)=>current is GetCartSuccess ||
              current is GetCartLoading || current is GetCartError ,

              builder: (context, state) {
                if (state is GetCartLoading){
                  return Center(child: CircularProgressIndicator());
                }else if(state is GetCartSuccess){
                  return state.cartProduct.isEmpty?
                  Center(
                    child: Lottie.asset("assets/images/empty_cart_2.json",width: 200.w,
                      height: 200.h,),
                  )
                      :Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) => CartBookItem(
                              increaseQuantityOnTap: (){
                                context.read<CartCubit>().updateCart(cartItemId : state.cartProduct[index].itemId??0 , quantity: state.cartProduct[index].itemQuantity!+1);
                              },
                              decreaseQuantityOnTap: (){
                                if(state.cartProduct[index].itemQuantity!>1) {
                                  context.read<CartCubit>().updateCart(
                                      cartItemId: state.cartProduct[index]
                                          .itemId ?? 0,
                                      quantity: state.cartProduct[index]
                                          .itemQuantity! - 1);
                                }
                              },
                              onTapRemoveFromCart: (){
                                context.read<CartCubit>().removeFromCart(state.cartProduct[index].itemId??0);
                              },
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
