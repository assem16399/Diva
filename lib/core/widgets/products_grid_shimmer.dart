import 'package:diva/core/themes/colors.dart';
import 'package:diva/features/home_Screen/ui/widgets/my_products_list_item.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductsGridShimmer extends StatelessWidget {
  const ProductsGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Shimmer.fromColors(
        baseColor: ColorsManager.mainDeepPink,
        highlightColor: Colors.white,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 5,
              mainAxisExtent: 255,
            ),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return const MyProductsListItem(
                id: 0,
                title: '',
                imageUrl: '',
                rating: 0,
                price: 0,
              );
            }),
      ),
    );
  }
}
