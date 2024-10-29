import 'package:diva/core/di/dependency_injection.dart';
import 'package:diva/core/helpers/extensions.dart';
import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/widgets/categories_tab_list.dart';
import 'package:diva/core/widgets/products_grid_shimmer.dart';
import 'package:diva/features/home_Screen/data/models/home_product_response_model.dart';
import 'package:diva/features/home_Screen/logic/home_screen_cubit.dart';
import 'package:diva/features/home_Screen/ui/widgets/my_products_list_item.dart';
import 'package:diva/features/home_Screen/ui/widgets/my_search_bar.dart';
import 'package:diva/features/home_Screen/ui/widgets/spanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeScreenCubit>()
        ..fetchCategories()
        ..getWishlistData(),
      child: Column(
        children: [
          verticalSpace(10),
          const MySearchBar(),
          const Spanner(),
          verticalSpace(10),
          BlocBuilder<HomeScreenCubit, HomeScreenState>(
            buildWhen: (prev, current) =>
                current.event == HomeStateEvent.fetchingCategories,
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
                        .read<HomeScreenCubit>()
                        .fetchProducts(category as String);
                  },
                ),
                initial: () => const SizedBox.shrink(),
              );
            },
          ),
          Expanded(
            child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
              buildWhen: (prev, current) =>
                  current.event == HomeStateEvent.fetchingProducts,
              builder: (context, state) {
                return state.productsState.when(
                  loading: () => const ProductsGridShimmer(),
                  error: (errorMsg) => Center(
                    child: Text(errorMsg),
                  ),
                  initial: () => const ProductsGridShimmer(),
                  loaded: (data) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
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
                        final product = data[index] as HomeProductResponseModel;
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

class ProductGridItem extends StatelessWidget {
  final HomeProductResponseModel product;

  const ProductGridItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Using BlocSelector to listen to specific product's wishlist status only
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      buildWhen: (_, current) =>
          current.event == HomeStateEvent.fetchingWishlist ||
          (current.event == HomeStateEvent.toggleWishlistItem &&
              current.wishlistToggleState.maybeWhen(
                  loaded: (_, id) => id == product.id, orElse: () => false)),
      builder: (context, state) {
        print('Rebuilding with id: ${product.id}');
        var wishlist = <dynamic>[];
        state.wishlistDataState.maybeWhen(
          loaded: (initialWishlist) => wishlist = initialWishlist,
          orElse: () {},
        );

        state.wishlistToggleState.maybeWhen(
          loaded: (updatedWishlist, _) => wishlist = updatedWishlist,
          orElse: () {},
        );

        return MyProductsListItem(
          id: product.id,
          title: product.title,
          imageUrl: product.image,
          rating: product.rating.rate,
          price: product.price,
          isFav: wishlist.containsWhere((item) => item.id == product.id),
          onFavoriteToggled: () {
            context.read<HomeScreenCubit>().toggleFavoriteStatus(product);
          },
        );
      },
    );
  }
}
