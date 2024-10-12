import 'package:diva/core/networking/api_error_handler.dart';
import 'package:diva/core/networking/api_result.dart';
import 'package:diva/features/home_Screen/data/apis/home_api_service.dart';
import 'package:diva/features/home_Screen/data/models/categories_response_model.dart';
import 'package:diva/features/home_Screen/data/models/category_product_response_model.dart';
import 'package:diva/features/home_Screen/data/models/home_model.dart';

class CategoryRepository {
  CategoryRepository(this._apiService);

  final HomeApiService _apiService;

  Future<ApiResult<HomeModel>> getHomeData() async {
    try {
      final homeDataResponses = await _sendHomeDataRequestsConcurrently();
      return ApiResult.success(
        _getHomeModelFromConcurrentResponses(homeDataResponses),
      );
    } catch (error) {
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

  Future<List<Object>> _sendHomeDataRequestsConcurrently() async {
    final responses = await Future.wait([
      _apiService.fetchCategories(),
      _apiService.fetchAllProducts(),
    ]);

    return responses;
  }

  HomeModel _getHomeModelFromConcurrentResponses(List<Object> responses) {
    return HomeModel(
      categories: responses[0] as CategoriesResponseModel,
      allProducts: responses[1] as List<CategoryProductResponseModel>,
    );
  }
}
