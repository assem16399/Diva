import 'package:dio/dio.dart';
import 'package:diva/features/product_details/data/data/product_details_api_constants.dart';
import 'package:diva/features/product_details/data/models/single_product_model.dart';
import 'package:retrofit/retrofit.dart';

part 'product_details_api_service.g.dart';

@RestApi(baseUrl: ProductDetailsApiConstants.fakeStoreBaseUrl)
abstract class ProductDetailsApiService {
  factory ProductDetailsApiService(Dio dio, {String baseUrl}) =
      _ProductDetailsApiService;

  @GET('${ProductDetailsApiConstants.productDetailsEp}/{id}')
  Future<SingleProductModel> getProductDetails({
    @Path('id') required String productId,
  });
}
