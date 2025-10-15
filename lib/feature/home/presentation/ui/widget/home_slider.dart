import 'package:bookia_application/core/theme/app_color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


List<String> images =[
  "https://www.shutterstock.com/shutterstock/photos/2205625909/display_1500/stock-photo-moscow-russia-june-argentina-national-football-team-captain-lionel-messi-during-fifa-2205625909.jpg",
  "https://assets.bwbx.io/images/users/iqjWHBFdfxIU/i7iKAk8k6Tgc/v1/-1x-1.webp",
  "https://assets.bwbx.io/images/users/iqjWHBFdfxIU/i7iKAk8k6Tgc/v1/-1x-1.webp",
];
class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int activeIndex=0;
  @override
  Widget build(BuildContext context) {
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
          items: images.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                        color: Colors.amber,
                      image: DecorationImage(fit:BoxFit.cover ,image: Image.network(i).image,)
                    ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 12.h,),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: images.length,
          effect: ExpandingDotsEffect(
            activeDotColor: AppColor.primary
          ),
        )
      ],
    )
    ;
  }
}
