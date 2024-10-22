import 'package:diva/core/di/dependency_injection.dart';
import 'package:diva/core/widgets/categries_tab_list.dart';
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
      create: (context) => getIt<CategoriesCubit>()..fetchCategories(),
      child: Column(
        children: [
          BlocBuilder<CategoriesCubit, CategoriesState>(
            buildWhen: (prev, current) =>
                current.event == CategoriesStateEvent.fetchingCategories,
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
