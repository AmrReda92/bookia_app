
import 'package:bookia_application/core/theme/app_text_style.dart';
import 'package:bookia_application/feature/book_details/presentation/ui/book_details_screen.dart';
import 'package:bookia_application/feature/cart/presentation/ui/cart_screen.dart';
import 'package:bookia_application/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia_application/feature/home/presentation/ui/widget/book_item.dart';
import 'package:bookia_application/feature/home/presentation/ui/widget/home_app_bar.dart';
import 'package:bookia_application/feature/home/presentation/ui/widget/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25.h,),
            HomeSlider(),
            SizedBox(height: 31.h,),
            Text("Best Seller", style: AppTextStyle.largeFont),
            SizedBox(height: 15.h,),
            Expanded(
              child: BlocConsumer<HomeCubit,HomeState>(
                listener: (context,state){
                  if(state is AddToCartLoading){
                    showDialog(context: context,
                        builder: (context)=>Center(child: CircularProgressIndicator()));
                  }else if(state is AddToCartSuccess){
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor:Colors.green ,content: Text("Product add successfuly")));
                  }
                },
                buildWhen: (prev,current)=> current is GetBestSellerError ||
                current is GetBestSellerLoading || current is GetBestSellerSuccess,
                builder: (context, state) {
                  if(state is GetBestSellerLoading){
                    return Center(child: CircularProgressIndicator());
                  }else if(state is GetBestSellerSuccess){
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .6,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) => BookItem(
                        product: state.productsList[index],
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>BookDetailsScreen(
                              product: state.productsList[index])));
                        },
                        onTapAddToCart: (){
                          context.read<HomeCubit>().addToCart(state.productsList[index].id??0);
                        },
                      ),
                      itemCount: state.productsList.length,
                    );
                  }else{
                    return Text("Error");
                  }
                },
              ),
            )
          ],
        ),
      ),


    );
  }
}
