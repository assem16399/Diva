import 'package:diva/features/home_Screen/data/models/categories_response_model.dart';
import 'package:diva/features/home_Screen/data/models/category_product_response_model.dart';

class CategoriesWithProductsModel {
  CategoriesWithProductsModel(
      {required this.categoryProducts, required this.categories});
  final CategoriesResponseModel categories;
  final List<CategoryProductResponseModel> categoryProducts;
}
