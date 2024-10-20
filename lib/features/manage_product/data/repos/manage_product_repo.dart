import 'package:diva/core/networking/api_error_handler.dart';
import 'package:diva/core/networking/api_result.dart';
import 'package:diva/features/manage_product/data/apis/manage_product_api_service.dart';
import 'package:diva/features/manage_product/data/models/mange_product_body_model.dart';

class ManageProductRepo {
  ManageProductRepo(this._apiService);

  final ManageProductApiService _apiService;

  Future<ApiResult<List<String>>> getAvailableCategories() async {
    try {
      final categories = await _apiService.getAvailableCategories();
      return ApiResult.success(categories);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<ManageProductModel>> addProduct(
      {required ManageProductModel productModel}) async {
    try {
      final response = await _apiService.addProduct(body: productModel);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<ManageProductModel>> updateProduct({
    required ManageProductModel productModel,
  }) async {
    try {
      final response = await _apiService.updateProduct(
        body: productModel,
        productId: productModel.id.toString(),
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
