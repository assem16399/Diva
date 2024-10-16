import 'package:diva/features/cart/data/models/cart_response_model.dart';

class CartModel {
  CartModel({
    required this.cartBasicData,
    required this.cartProducts,
  });
  final CartResponseModel cartBasicData;
  final List<CartProductResponseModel> cartProducts;
}
