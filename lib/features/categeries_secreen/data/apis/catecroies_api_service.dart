import 'package:dio/dio.dart';
import 'package:diva/features/categeries_secreen/data/apis/api_constants.dart';
import 'package:diva/features/categeries_secreen/data/models/category_product_response_model.dart';
import 'package:retrofit/retrofit.dart';

import '../models/category_response_model.dart';

part 'catecroies_api_service.g.dart';

@RestApi(baseUrl: CatecroiesApiConstant.baseUrl)
abstract class CategriesApiService {
  factory CategriesApiService(Dio dio) = _CategriesApiService;
  @GET(CatecroiesApiConstant.categoriesEndpoint)
  Future<CategoriesResponseModel> fetchCategories();

  @GET('${CatecroiesApiConstant.specificCategoryEndpoint}/{categoryName}')
  Future<List<CategoryProductResponseModel>> fetchProductsOf({
    @Path('categoryName') required String category,
  });

  @GET(CatecroiesApiConstant.allProductsEndpoint)
  Future<List<CategoryProductResponseModel>> fetchAllProducts();
}
