
import 'package:bookia_application/core/widget/custom_app_bar.dart';
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 50.h,),
            BlocBuilder< CartCubit, CartState>(
              buildWhen: (prev,current)=>current is GetCartSuccess ||
              current is GetCartLoading || current is GetCartError,
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
