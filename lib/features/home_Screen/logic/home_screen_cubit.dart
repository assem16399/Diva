import 'package:bloc/bloc.dart';
import 'package:diva/features/home_Screen/data/repo/home_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_screen_cubit.freezed.dart';
part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit(this._homeRepository)
      : super(
          const HomeScreenState(event: HomeStateEvent.fetchingCategories),
        );
  final HomeRepository _homeRepository;

  Future<void> fetchCategories() async {
    emit(state.copyWith(
        categoriesState: const HomeDataState.loading(),
        event: HomeStateEvent.fetchingCategories));

    final result = await _homeRepository.getCategories();

    result.when(
      success: (categories) {
        final categoriesNames = categories.categories;
        emit(
          state.copyWith(
              categoriesState: HomeDataState.loaded(data: categoriesNames),
              event: HomeStateEvent.fetchingCategories),
        );

        if (categoriesNames.isNotEmpty) {
          fetchProducts(categoriesNames.first.name);
        }
      },
      failure: (error) => emit(
        state.copyWith(
          event: HomeStateEvent.fetchingCategories,
          categoriesState: HomeDataState.error(message: error.message ?? ''),
        ),
      ),
    );
  }

  Future<void> fetchProducts(String category) async {
    emit(
      state.copyWith(
        productsState: const HomeDataState.loading(),
        event: HomeStateEvent.fetchingProducts,
      ),
    );

    final result =
        await _homeRepository.getSpecificCategoriesProducts(category);

    result.when(
      success: (products) {
        emit(
          state.copyWith(
            productsState: HomeDataState.loaded(data: products),
            event: HomeStateEvent.fetchingProducts,
          ),
        );
      },
      failure: (error) => emit(
        state.copyWith(
          productsState: HomeDataState.error(message: error.message ?? ''),
          event: HomeStateEvent.fetchingProducts,
        ),
      ),
    );
  }
}
