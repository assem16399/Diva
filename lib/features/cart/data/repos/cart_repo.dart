import 'package:diva/core/networking/api_error_handler.dart';
import 'package:diva/core/networking/api_result.dart';
import 'package:diva/features/cart/data/apis/cart_api_service.dart';
import 'package:diva/features/cart/data/models/cart_model.dart';
import 'package:diva/features/cart/data/models/cart_response_model.dart';

class CartRepo {
  CartRepo(this._apiService);

  final CartApiService _apiService;
  Future<ApiResult<CartModel>> getCartData() async {
    try {
      final cartBasicData = await _apiService.getCartData();
      final cartProducts = await _getCartProducts(cartBasicData.products);
      return ApiResult.success(
        CartModel(cartBasicData: cartBasicData, cartProducts: cartProducts),
      );
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<CartModel>> updateCartData(
      CartResponseModel cartData) async {
    try {
      final updatedCartData = await _apiService.updateCartData(cartData);
      final cartProducts = await _getCartProducts(updatedCartData.products);
      return ApiResult.success(
        CartModel(cartBasicData: updatedCartData, cartProducts: cartProducts),
      );
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<List<CartProductResponseModel>> _getCartProducts(
    List<SummarizedCartItemModel> summarizedCartItems,
  ) async {
    final cartProducts = <CartProductResponseModel>[];
    for (final product in summarizedCartItems) {
      final productData = await _apiService.getProductData(product.productId);
      cartProducts.add(productData);
    }
    return cartProducts;
  }
}
