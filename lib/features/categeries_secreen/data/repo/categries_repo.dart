import 'package:diva/core/networking/api_error_model.dart';
import 'package:diva/core/networking/api_result.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../apis/catecroies_api_service.dart';
import '../models/all_model.dart';
import '../models/category_product_response_model.dart';
import '../models/category_response_model.dart';

class CategoryRepository {
  CategoryRepository(this._apiService);

  final CategriesApiService _apiService;

  Future<ApiResult<CategoriesWithProductsModel>> getAllCategoriesTabData(
      {String? categoryName}) async {
    try {
      print('Aywaaaaaaaaaaa');
      final categoriesDataResponse = await _apiService.fetchCategories();
      late List<CategoryProductResponseModel> products;
      if (categoriesDataResponse.categories.isEmpty) {
        print('getting empty bla');

        return ApiResult.failure(ApiErrorModel(message: 'No categories found'));
      }

      print('getting category products');
      products = await _apiService.fetchProductsOf(
        category: categoryName ?? categoriesDataResponse.categories.first.name,
      );

      return ApiResult.success(
        CategoriesWithProductsModel(
          categories: categoriesDataResponse,
          categoryProducts: products,
        ),
      );
    } catch (error) {
      rethrow;
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<CategoriesResponseModel>> getCategories() async {
    try {
      final categoriesResponseModel = await _apiService.fetchCategories();
      return ApiResult.success(categoriesResponseModel);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<CategoryProductResponseModel>>>
      getSpecificCategoriesProducts(String categoryName) async {
    try {
      final categoryProductsResponseModel = await _apiService.fetchProductsOf(
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
          await _apiService.fetchAllProducts();
      return ApiResult.success(categoriesProductsResponseModel);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<List<Object>> _sendCategoriesDataRequestsConcurrently() async {
    final responses = await Future.wait([
      _apiService.fetchCategories(),
      _apiService.fetchAllProducts(),
    ]);

    return responses;
  }

  CategoriesWithProductsModel _getCategoriesModelFromConcurrentResponses(
      List<Object> responses) {
    return CategoriesWithProductsModel(
      categories: responses[0] as CategoriesResponseModel,
      categoryProducts: responses[1] as List<CategoryProductResponseModel>,
    );
  }
}
