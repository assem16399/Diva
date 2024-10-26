import 'package:diva/core/di/dependency_injection.dart';
import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/widgets/categories_tab_list.dart';
import 'package:diva/features/home_Screen/data/models/category_product_response_model.dart';
import 'package:diva/features/home_Screen/logic/home_screen_cubit.dart';
import 'package:diva/features/home_Screen/ui/widgets/my_products_list_item.dart';
import 'package:diva/features/home_Screen/ui/widgets/my_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeScreenCubit>()..fetchCategories(),
      child: Column(
        children: [
          verticalSpace(10),
          MySearchBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Image.asset('assets/Frame 1000004533.png'),
          ),
          verticalSpace(10),
          BlocBuilder<HomeScreenCubit, HomeScreenState>(
            buildWhen: (prev, current) =>
                current.event == HomeStateEvent.fetchingCategories,
            builder: (context, state) {
              return state.categoriesState.when(
                loading: () => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
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
                  loading: () => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  error: (errorMsg) => Center(
                    child: Text(errorMsg),
                  ),
                  initial: () => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  loaded: (data) => GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 5,
                      mainAxisExtent: 255,
                    ),
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      final product =
                          data[index] as CategoryProductResponseModel;
                      return MyProductsListItem(
                        id: product.id,
                        title: product.title,
                        imageUrl: product.image,
                        rating: product.rating.rate,
                        price: product.price,
                      );
                    },
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
