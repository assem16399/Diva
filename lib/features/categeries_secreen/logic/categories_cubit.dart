import 'package:bloc/bloc.dart';
import 'package:diva/features/categeries_secreen/data/repo/categries_repo.dart';
import 'package:diva/features/categeries_secreen/logic/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._categoryRepository)
      : super(
          const CategoriesState(event: CategoriesStateEvent.fetchingCategories),
        );
  final CategoryRepository _categoryRepository;
  Future<void> fetchCategories() async {
    emit(state.copyWith(
        categoriesState: const CategoriesDataState.loading(),
        event: CategoriesStateEvent.fetchingCategories));

    final result = await _categoryRepository.getCategories();

    result.when(
      success: (categories) {
        final categoriesNames = categories.categories;
        emit(
          state.copyWith(
              categoriesState:
                  CategoriesDataState.loaded(data: categoriesNames),
              event: CategoriesStateEvent.fetchingCategories),
        );

        if (categoriesNames.isNotEmpty) {
          fetchProducts(categoriesNames.first.name);
        }
      },
      failure: (error) => emit(
        state.copyWith(
          event: CategoriesStateEvent.fetchingCategories,
          categoriesState:
              CategoriesDataState.error(message: error.message ?? ''),
        ),
      ),
    );
  }

  Future<void> fetchProducts(String category) async {
    emit(
      state.copyWith(
        productsState: const CategoriesDataState.loading(),
        event: CategoriesStateEvent.fetchingProducts,
      ),
    );

    final result =
        await _categoryRepository.getSpecificCategoriesProducts(category);

    result.when(
      success: (products) {
        emit(
          state.copyWith(
            productsState: CategoriesDataState.loaded(data: products),
            event: CategoriesStateEvent.fetchingProducts,
          ),
        );
      },
      failure: (error) => emit(
        state.copyWith(
          productsState:
              CategoriesDataState.error(message: error.message ?? ''),
          event: CategoriesStateEvent.fetchingProducts,
        ),
      ),
    );
  }
}
