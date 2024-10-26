import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_state.freezed.dart';

enum CategoriesStateEvent { fetchingCategories, fetchingProducts }

@freezed
sealed class CategoriesState<T> with _$CategoriesState<T> {
  const factory CategoriesState({
    required CategoriesStateEvent event,
    @Default(CategoriesDataState.initial()) CategoriesDataState categoriesState,
    @Default(CategoriesDataState.initial()) CategoriesDataState productsState,
  }) = _CategoriesState;
}

@freezed
sealed class CategoriesDataState<T> with _$CategoriesDataState<T> {
  const factory CategoriesDataState.initial() = _Initial;
  const factory CategoriesDataState.loading() = _Loading;
  const factory CategoriesDataState.loaded({required List<dynamic> data}) =
      _Loaded;
  const factory CategoriesDataState.error({required String message}) = _Error;
}
