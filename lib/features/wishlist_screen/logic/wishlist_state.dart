part of 'wishlist_cubit.dart';

@freezed
class WishlistState with _$WishlistState {
  const factory WishlistState.initial() = _Initial;
  const factory WishlistState.loaded(
      {required List<CategoryProductResponseModel> products}) = _Loaded;
  const factory WishlistState.error({required String message}) = _Error;
}
