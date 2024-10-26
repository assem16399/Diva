import 'package:diva/core/di/dependency_injection.dart';
import 'package:diva/core/helpers/extensions.dart';
import 'package:diva/core/widgets/categries_tab_list.dart';
import 'package:diva/core/widgets/products_grid_shimmer.dart';
import 'package:diva/features/categeries_secreen/data/models/category_product_response_model.dart';
import 'package:diva/features/categeries_secreen/logic/categories_state.dart';
import 'package:diva/features/home_Screen/ui/widgets/my_products_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/categories_cubit.dart';

class Catecroies extends StatelessWidget {
  const Catecroies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CategoriesCubit>()
        ..fetchCategories()
        ..getWishlistData(),
      child: Column(
        children: [
          BlocBuilder<CategoriesCubit, CategoriesState>(
            buildWhen: (prev, current) =>
                current.event == CategoriesStateEvent.fetchingCategories,
            builder: (context, state) {
              return state.categoriesState.when(
                loading: ProductsGridShimmer.new,
                error: (errorMsg) => Center(
                  child: Text(errorMsg),
                ),
                loaded: (data) => CategriesTabList(
                  categoriesNames: (data)
                      .map((category) => category.name as String)
                      .toList(),
                  onCategoryChanged: (index) {
                    final category = data[index].name;
                    context
                        .read<CategoriesCubit>()
                        .fetchProducts(category as String);
                  },
                ),
                initial: () => const SizedBox.shrink(),
              );
            },
          ),
          Expanded(
            child: BlocBuilder<CategoriesCubit, CategoriesState>(
              buildWhen: (prev, current) =>
                  current.event == CategoriesStateEvent.fetchingProducts,
              builder: (context, state) {
                return state.productsState.when(
                  loading: ProductsGridShimmer.new,
                  error: (errorMsg) => Center(
                    child: Text(errorMsg),
                  ),
                  initial: () => ProductsGridShimmer(),
                  loaded: (data) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 20,
                        mainAxisExtent: 255,
                      ),
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final product =
                            data[index] as CategoryProductResponseModel;
                        return ProductGridItem(product: product);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Individual Grid Item Widget for product with optimized rebuilding
class ProductGridItem extends StatelessWidget {
  final CategoryProductResponseModel product;

  const ProductGridItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Using BlocSelector to listen to specific product's wishlist status only
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      buildWhen: (_, current) =>
          current.event == CategoriesStateEvent.fetchingWishlist ||
          (current.event == CategoriesStateEvent.toggleWishlistItem &&
              current.wishlistToggleState.maybeWhen(
                  loaded: (_, id) => id == product.id, orElse: () => false)),
      builder: (context, state) {
        print('Rebuilding with id: ${product.id}');
        var wishlist = <dynamic>[];
        state.wishlistDataState.maybeWhen(
          loaded: (initialWishlist) => wishlist = initialWishlist,
          orElse: () {},
        );
        print('initial wishlist in categories: ${wishlist.length}');
        state.wishlistToggleState.maybeWhen(
          loaded: (updatedWishlist, _) => wishlist = updatedWishlist,
          orElse: () {},
        );
        print('initial wishlist in categories22: ${wishlist.length}');
        print('wishlist.contains(product):'
            ' ${wishlist.containsWhere((item) => item.id == product.id)}');
        return MyProductsListItem(
            id: product.id,
            title: product.title,
            imageUrl: product.image,
            rating: product.rating.rate,
            price: product.price,
            isFav: wishlist.containsWhere((item) => item.id == product.id),
            onFavoriteToggled: () {
              context.read<CategoriesCubit>().toggleFavoriteStatus(product);
            });
      },
    );
  }
}
