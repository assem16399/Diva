import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:diva/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagesSlider extends StatefulWidget {
  const ImagesSlider({
    required this.images,
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.hasAutoPlayAnimation = true,
    this.hasStepper = true,
  });

  final double? width;
  final double? height;
  final List<String> images;
  final BoxFit fit;
  final bool hasAutoPlayAnimation;
  final bool hasStepper;
  @override
  State<ImagesSlider> createState() => _ImagesSliderState();
}

class _ImagesSliderState extends State<ImagesSlider> {
  var _currentImages = 0;
  final _controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          width: widget.width ?? double.infinity,
          child: CarouselSlider.builder(
            carouselController: _controller,
            options: CarouselOptions(
              height: widget.height,
              autoPlay: widget.hasAutoPlayAnimation,
              autoPlayInterval: const Duration(seconds: 7),
              autoPlayAnimationDuration: const Duration(milliseconds: 2000),
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentImages = index;
                });
              },
            ),
            itemCount: widget.images.length,
            itemBuilder: (context, index, realIndex) => ImageSliderItem(
              imageUrl: widget.images[index],
              height: widget.height,
              width: widget.width,
              fit: widget.fit,
            ),
          ),
        ),
        if (widget.hasStepper)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.images.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 8.h,
                  height: 8.h,
                  margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentImages == entry.key
                        ? ColorsManager.mainDeepPink
                        : Colors.white,
                  ),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}

class ImageSliderItem extends StatelessWidget {
  const ImageSliderItem({
    required this.imageUrl,
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
