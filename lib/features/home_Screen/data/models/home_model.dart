import 'package:diva/features/home_Screen/data/models/home_product_response_model.dart';
import 'package:diva/features/home_Screen/data/models/home_response_model.dart';

class HomeWithProductsModel {
  HomeWithProductsModel(
      {required this.categoryProducts, required this.categories});
  final CategoriesResponseModel categories;
  final List<HomeProductResponseModel> categoryProducts;
}
