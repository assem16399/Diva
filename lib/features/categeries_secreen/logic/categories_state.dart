import 'package:diva/features/categeries_secreen/data/models/category_product_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_state.freezed.dart';

enum CategoriesStateEvent {
  fetchingCategories,
  fetchingProducts,
  fetchingWishlist,
  toggleWishlistItem
}

@freezed
sealed class CategoriesState<T> with _$CategoriesState<T> {
  const factory CategoriesState({
    required CategoriesStateEvent event,
    @Default(CategoriesDataState.initial()) CategoriesDataState categoriesState,
    @Default(CategoriesDataState.initial()) CategoriesDataState productsState,
    @Default(WishlistToggleState.initial())
    WishlistToggleState wishlistToggleState,
    @Default(CategoriesDataState.initial())
    CategoriesDataState wishlistDataState,
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

@freezed
sealed class WishlistToggleState<T> with _$WishlistToggleState<T> {
  const factory WishlistToggleState.initial() = _WishlistToggleInitial;
  const factory WishlistToggleState.loaded(
      {required List<CategoryProductResponseModel> wishlist,
      required int productId}) = _ToggleLoaded;
  const factory WishlistToggleState.error({required String message}) =
      _ToggleError;
}
