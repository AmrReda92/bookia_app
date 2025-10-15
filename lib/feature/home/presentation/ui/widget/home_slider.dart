import 'package:bookia_application/core/theme/app_color.dart';
import 'package:bookia_application/feature/home/presentation/cubit/home_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


List<String> images =[];
class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int activeIndex=0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
    if(state is GetHomeSliderLoading){
      return Center(child: CircularProgressIndicator());
    }else if(state is GetHomeSliderSuccess){
      return Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (index,CarouselPageChangedReason){
                setState(() {
                  activeIndex=index;
                });
              },
              height: 150.h,
              autoPlay: true,
              aspectRatio: 16/9,
              viewportFraction: 1,
            ),
            items: state.sliders.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber,
                        image: DecorationImage(fit:BoxFit.cover ,image: Image.network(i.image??"").image,)
                    ),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(height: 12.h,),
          AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: state.sliders.length,
            effect: ExpandingDotsEffect(
                activeDotColor: AppColor.primary
            ),
          ),
        ],
      );
    }else{
      return Text("Error");
    }
  },
);
  }
}
