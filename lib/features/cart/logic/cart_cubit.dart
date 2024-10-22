import 'package:bloc/bloc.dart';
import 'package:diva/features/cart/data/models/cart_model.dart';
import 'package:diva/features/cart/data/models/cart_response_model.dart';
import 'package:diva/features/cart/data/repos/cart_repo.dart';
import 'package:diva/features/cart/logic/cart_state.dart';

class CartCubit extends Cubit<CartState<CartModel>> {
  CartCubit(this._repo) : super(const CartState.cartLoading());

  final CartRepo _repo;

  Future<void> getCartData() async {
    emit(const CartState.cartLoading());
    final response = await _repo.getCartData();
    response.when(
      success: (cartModel) {
        emit(CartState.cartSuccess(cartModel));
      },
      failure: (error) {
        emit(CartState.cartError(error: error.message ?? ''));
      },
    );
  }

  Future<void> updateCartData(CartResponseModel cartResponseModel) async {
    emit(const CartState.cartLoading());
    final response = await _repo.updateCartData(cartResponseModel);
    response.when(
      success: (cartModel) {
        emit(CartState.cartSuccess(cartModel));
      },
      failure: (error) {
        emit(CartState.cartError(error: error.message ?? ''));
      },
    );
  }
}
