import 'package:dio/dio.dart';
import 'package:diva/features/cart/data/apis/cart_api_constants.dart';
import 'package:diva/features/cart/data/models/cart_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'cart_api_service.g.dart';

@RestApi(baseUrl: CartApiConstants.cartBaseUrl)
abstract class CartApiService {
  factory CartApiService(Dio dio, {String baseUrl}) = _CartApiService;

  @GET(CartApiConstants.cartEP)
  Future<CartResponseModel> getCartData();

  @GET('${CartApiConstants.productDetailsEp}/{id}')
  Future<CartProductResponseModel> getProductData(
    @Path('id') String id, {
    required int quantity,
  });

  @PUT(CartApiConstants.cartEP)
  Future<CartResponseModel> updateCartData(
    @Body() Map<String, dynamic> body,
  );
}
