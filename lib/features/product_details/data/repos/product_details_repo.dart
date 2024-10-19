import 'package:diva/core/networking/api_error_handler.dart';
import 'package:diva/core/networking/api_result.dart';
import 'package:diva/features/product_details/data/apis/product_details_api_service.dart';
import 'package:diva/features/product_details/data/models/single_product_model.dart';

class ProductDetailsRepo {
  ProductDetailsRepo(this._apiService);

  final ProductDetailsApiService _apiService;

  Future<ApiResult<SingleProductModel>> getProductDetails(int id) async {
    try {
      final response =
          await _apiService.getProductDetails(productId: id.toString());
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
