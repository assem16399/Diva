import 'package:bloc/bloc.dart';
import 'package:diva/features/cart/data/models/cart_model.dart';
import 'package:diva/features/cart/data/repos/cart_repo.dart';
import 'package:diva/features/cart/logic/cart_state.dart';

class CartCubit extends Cubit<CartState<CartModel>> {
  CartCubit(this._repo) : super(const CartState.signupLoading());

  final CartRepo _repo;

  Future<void> getCartData() async {
    emit(const CartState.signupLoading());
    final response = await _repo.getCartData();
    response.when(
      success: (cartModel) {
        emit(CartState.signupSuccess(cartModel));
      },
      failure: (error) {
        emit(CartState.signupError(error: error.message ?? ''));
      },
    );
  }

  Future<void> updateCartData(CartModel cartModel) async {
    emit(const CartState.signupLoading());
    final response = await _repo.updateCartData(cartModel.cartBasicData);
    response.when(
      success: (cartModel) {
        emit(CartState.signupSuccess(cartModel));
      },
      failure: (error) {
        emit(CartState.signupError(error: error.message ?? ''));
      },
    );
  }
}
