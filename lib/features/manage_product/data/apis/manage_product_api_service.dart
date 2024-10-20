import 'package:dio/dio.dart';
import 'package:diva/features/manage_product/data/apis/manage_product_api_constants.dart';
import 'package:diva/features/manage_product/data/models/mange_product_body_model.dart';
import 'package:retrofit/retrofit.dart';

part 'manage_product_api_service.g.dart';

@RestApi(baseUrl: ManageProductApiConstants.fakeStoreBaseUrl)
abstract class ManageProductApiService {
  factory ManageProductApiService(Dio dio, {String baseUrl}) =
      _ManageProductApiService;

  @GET(ManageProductApiConstants.categoriesEp)
  Future<List<String>> getAvailableCategories();

  @POST(ManageProductApiConstants.manageProductEp)
  Future<ManageProductModel> addProduct({
    @Body() required ManageProductModel body,
  });

  @PUT('${ManageProductApiConstants.manageProductEp}/{id}')
  Future<ManageProductModel> updateProduct({
    @Body() required ManageProductModel body,
    @Path('id') required String productId,
  });
}
