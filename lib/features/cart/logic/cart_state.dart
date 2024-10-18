import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.freezed.dart';

@freezed
sealed class CartState<T> with _$CartState<T> {
  const factory CartState.initial() = _Initial;

  const factory CartState.signupLoading() = CartLoading;
  const factory CartState.signupSuccess(T data) = CartSuccess<T>;
  const factory CartState.signupError({required String error}) = CartError;
}
