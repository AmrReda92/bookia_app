import 'dart:ffi';

import 'package:bookia_application/core/helper/local_services.dart';
import 'package:bookia_application/core/theme/app_text_style.dart';
import 'package:bookia_application/core/widget/custom_app_bar.dart';
import 'package:bookia_application/feature/home/data/repo/home_repo.dart';
import 'package:bookia_application/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia_application/feature/home/presentation/ui/widget/book_item.dart';
import 'package:bookia_application/feature/home/presentation/ui/widget/home_app_bar.dart';
import 'package:bookia_application/feature/home/presentation/ui/widget/home_slider.dart';
import 'package:bookia_application/feature/model_nav_bar/model_nav.dart';
import 'package:bookia_application/feature/welcome/presentation/ui/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              child: BlocBuilder<HomeCubit,HomeState>(
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
                      itemBuilder: (context, index) => BookItem(product: state.productsList[index],),
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
