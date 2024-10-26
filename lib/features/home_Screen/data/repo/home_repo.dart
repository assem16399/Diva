import 'package:diva/core/networking/api_error_handler.dart';
import 'package:diva/core/networking/api_result.dart';
import 'package:diva/features/home_Screen/data/apis/home_api_service.dart';
import 'package:diva/features/home_Screen/data/models/categories_response_model.dart';
import 'package:diva/features/home_Screen/data/models/category_product_response_model.dart';

class HomeRepository {
  HomeRepository(this._HomeApiService);

  final HomeApiService _HomeApiService;

  Future<ApiResult<CategoriesResponseModel>> getCategories() async {
    try {
      final categoriesResponseModel = await _HomeApiService.fetchCategories();
      return ApiResult.success(categoriesResponseModel);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<CategoryProductResponseModel>>>
      getSpecificCategoriesProducts(String categoryName) async {
    try {
      final categoryProductsResponseModel =
          await _HomeApiService.fetchProductsOf(
        category: categoryName,
      );
      return ApiResult.success(categoryProductsResponseModel);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<CategoryProductResponseModel>>>
      getAllCategoriesProducts() async {
    try {
      final categoriesProductsResponseModel =
          await _HomeApiService.fetchAllProducts();
      return ApiResult.success(categoriesProductsResponseModel);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
