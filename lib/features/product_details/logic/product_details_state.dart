import 'package:diva/features/product_details/data/models/single_product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_details_state.freezed.dart';

@freezed
class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState({
    @Default(ProductDataState.loading()) ProductDataState productDataState,
    @Default(ActionState.idle()) ActionState addToCartState,
    @Default(ActionState.idle()) ActionState toggleFavoriteState,
  }) = _ProductDetailsState;
}

@freezed
class ProductDataState with _$ProductDataState {
  const factory ProductDataState.loading() = _Loading;
  const factory ProductDataState.loaded({required SingleProductModel product}) =
      _Loaded;
  const factory ProductDataState.error({required String message}) = _Error;
}

@freezed
class ActionState with _$ActionState {
  const factory ActionState.idle() = _Idle;
  const factory ActionState.loading() = _ActionLoading;
  const factory ActionState.success() = _ActionSuccess;
  const factory ActionState.error({required String message}) = _ActionError;
}
