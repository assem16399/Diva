import 'package:diva/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyProductsListItem extends StatelessWidget {
  const MyProductsListItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.price,
    super.key,
  });

  final int id;
  final String title;
  final String imageUrl;
  final double rating;
  final double price;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 255.h,
      width: 150.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: Image.network(
                  imageUrl,
                ).image,
                fit: BoxFit.fill,
              ),
            ),
            height: 204.h,
            width: 150.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(5),
                        child: Image.asset(
                          'assets/icons8-like-50.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 25,
                        width: 25,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Image.asset(
                          'assets/add-to-cart.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellowAccent,
                  ),
                  Text(rating.toStringAsFixed(1)),
                ],
              ),
            ],
          ),
          verticalSpace(5),
          Text(
            '${price.toStringAsFixed(2)} L.E',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
