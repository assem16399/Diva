import 'package:diva/core/helpers/extensions.dart';
import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/routing/routes.dart';
import 'package:diva/core/themes/colors.dart';
import 'package:diva/core/widgets/success_dialog.dart';
import 'package:flutter/material.dart';

class MyProductsListItem extends StatelessWidget {
  const MyProductsListItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.price,
    required this.isFav,
    this.onFavoriteToggled,
    super.key,
  });

  final int id;
  final String title;
  final String imageUrl;
  final double rating;
  final double price;
  final VoidCallback? onFavoriteToggled;
  final bool isFav;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          Routes.productDetails,
          arguments: id,
        );
      },
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
            height: 200,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: onFavoriteToggled,
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(5),
                          child: Center(
                            child: Icon(
                              isFav ? Icons.favorite : Icons.favorite_border,
                              color: isFav
                                  ? ColorsManager.mainDeepPink
                                  : Colors.black,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showAdaptiveDialog<dynamic>(
                            context: context,
                            builder: (context) => SuccessDialog(
                              title: 'Great Choice',
                              content: '$title added to cart successfully',
                              onActionPressed: () {
                                context.pop();
                              },
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          height: 25,
                          width: 25,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.shopping_cart,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(5),
          SizedBox(
            width: double.infinity,
            child: Row(
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
                    Text(rating.toString()),
                  ],
                ),
              ],
            ),
          ),
          verticalSpace(5),
          SizedBox(
            width: double.infinity,
            child: Text(
              '${price.toStringAsFixed(2)} L.E',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
