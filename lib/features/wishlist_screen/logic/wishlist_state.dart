import 'package:diva/features/categeries_secreen/data/models/category_product_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wishlist_state.freezed.dart';

enum WishlistStateEvent { fetchingWishlist, togglingWishlistStatus }

@freezed
sealed class WishlistState with _$WishlistState {
  const factory WishlistState({
    required WishlistStateEvent event,
    @Default(WishlistDataState.loading())
    WishlistDataState<List<CategoryProductResponseModel>> wishlistDataState,
  }) = _WishlistState;
}

@freezed
sealed class WishlistDataState<T> with _$WishlistDataState<T> {
  const factory WishlistDataState.loading() = _Loading;
  const factory WishlistDataState.loaded({required T data}) = _Loaded;
  const factory WishlistDataState.error({required String message}) = _Error;
}
