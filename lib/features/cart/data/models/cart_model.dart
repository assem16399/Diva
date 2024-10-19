import 'package:diva/features/cart/data/models/cart_response_model.dart';

class CartModel {
  CartModel({
    required this.cartBasicData,
    required this.cartProducts,
  });
  final CartResponseModel cartBasicData;
  final List<CartProductResponseModel> cartProducts;
  double? _totalAmount;

  double get totalAmount {
    if (_totalAmount == null) {
      _totalAmount = 0;
      for (final product in cartProducts) {
        _totalAmount = _totalAmount! + (product.price! * product.qty);
      }
    }
    return _totalAmount!;
  }

  // create copy of cart model
  CartModel copyWith({
    CartResponseModel? cartBasicData,
    List<CartProductResponseModel>? cartProducts,
  }) {
    return CartModel(
      cartBasicData: cartBasicData ?? this.cartBasicData,
      cartProducts: cartProducts ?? this.cartProducts,
    );
  }
}
