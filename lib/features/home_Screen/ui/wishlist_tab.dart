import 'package:diva/core/di/dependency_injection.dart';
import 'package:diva/core/widgets/products_grid_shimmer.dart';
import 'package:diva/features/categeries_secreen/data/models/category_product_response_model.dart';
import 'package:diva/features/home_Screen/ui/widgets/my_products_list_item.dart';
import 'package:diva/features/wishlist_screen/logic/wishlist_cubit.dart';
import 'package:diva/features/wishlist_screen/logic/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class WishlistTab extends StatefulWidget {
  const WishlistTab({Key? key}) : super(key: key);

  @override
  _WishlistTabState createState() => _WishlistTabState();
}

class _WishlistTabState extends State<WishlistTab> {
  late bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WishlistCubit>()..getWishlistData(),
      child: BlocBuilder<WishlistCubit, WishlistState>(
        buildWhen: (prev, current) =>
            current.event == WishlistStateEvent.fetchingWishlist,
        builder: (BuildContext context, WishlistState state) {
          return state.wishlistDataState.when(
              loading: ProductsGridShimmer.new,
              error: (errorMsg) => Center(
                    child: Text(errorMsg),
                  ),
              loaded: (data) => data.isEmpty
                  ? Center(
                      child: Lottie.asset(
                        'assets/empty-state.json',
                        fit: BoxFit.fill,
                      ),
                    )
                  : WishlistGrid(
                      products: data,
                    ));
        },
      ),
    );
  }
}

class WishlistGrid extends StatelessWidget {
  const WishlistGrid({
    required this.products,
    super.key,
  });

  final List<CategoryProductResponseModel> products;
  @override
  Widget build(BuildContext context) {
    final wishlistCubit = context.read<WishlistCubit>();
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 5,
        mainAxisExtent: 255,
      ),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        final product = products[index];
        return MyProductsListItem(
          id: product.id,
          title: product.title,
          imageUrl: product.image,
          rating: product.rating.rate,
          price: product.price,
          isFav: wishlistCubit.isInWishlist(product),
          onFavoriteToggled: () {
            wishlistCubit.toggleFavoriteStatus(product);
          },
        );
      },
    );
  }
}
