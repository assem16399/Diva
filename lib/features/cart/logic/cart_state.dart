import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.freezed.dart';

@freezed
sealed class CartState<T> with _$CartState<T> {
  const factory CartState.cartLoading() = CartLoading;
  const factory CartState.cartSuccess(T data) = CartSuccess<T>;
  const factory CartState.cartError({required String error}) = CartError;
}
