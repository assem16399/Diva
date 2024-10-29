part of 'home_screen_cubit.dart';

enum HomeStateEvent {
  fetchingCategories,
  fetchingProducts,
  fetchingWishlist,
  toggleWishlistItem
}

@freezed
sealed class HomeScreenState<T> with _$HomeScreenState<T> {
  const factory HomeScreenState({
    required HomeStateEvent event,
    @Default(HomeDataState.initial()) HomeDataState categoriesState,
    @Default(HomeDataState.initial()) HomeDataState productsState,
    @Default(WishlistToggleState.initial())
    WishlistToggleState wishlistToggleState,
    @Default(HomeDataState.initial()) HomeDataState wishlistDataState,
  }) = _HomeScreenState;
}

@freezed
sealed class HomeDataState<T> with _$HomeDataState<T> {
  const factory HomeDataState.initial() = _Initial;
  const factory HomeDataState.loading() = _Loading;
  const factory HomeDataState.loaded({required List<dynamic> data}) = _Loaded;
  const factory HomeDataState.error({required String message}) = _Error;
}

@freezed
sealed class WishlistToggleState<T> with _$WishlistToggleState<T> {
  const factory WishlistToggleState.initial() = _WishlistToggleInitial;
  const factory WishlistToggleState.loaded(
      {required List<HomeProductResponseModel> wishlist,
      required int productId}) = _ToggleLoaded;
  const factory WishlistToggleState.error({required String message}) =
      _ToggleError;
}
