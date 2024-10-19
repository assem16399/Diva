import 'package:dio/dio.dart';
import 'package:diva/features/categeries_secreen/data/apis/api_constants.dart';
import 'package:diva/features/home_Screen/data/apis/home_api_constants.dart';
import 'package:diva/features/home_Screen/data/models/categories_response_model.dart';
import 'package:diva/features/home_Screen/data/models/category_product_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: HomeApiConstants.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;
  @GET(HomeApiConstants.categoriesEndpoint)
  Future<CategoriesResponseModel> fetchCategories();

  @GET('${CatecroiesApiConstant.specificCategoryEndpoint}/{categoryName}')
  Future<List<CategoryProductResponseModel>> fetchProductsOf({
    @Path('categoryName') required String category,
  });

  @GET(HomeApiConstants.allProductsEndpoint)
  Future<List<CategoryProductResponseModel>> fetchAllProducts();
}
