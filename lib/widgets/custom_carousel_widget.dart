import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class CustomCarouselSliderWidget extends StatelessWidget {
  const CustomCarouselSliderWidget({
    super.key,
    required this.bannerItems,
  });

  final List<String> bannerItems;

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
      options: CarouselOptions(
        viewportFraction: 1,
        height: 170.0,
        showIndicator: true,
        slideIndicator: CircularWaveSlideIndicator(
            slideIndicatorOptions:
                const SlideIndicatorOptions(indicatorRadius: 4)),
      ),
      items: bannerItems.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        i,
                      ))),
            );
          },
        );
      }).toList(),
    );
  }
}
