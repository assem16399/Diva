import 'package:diva/features/categeries_secreen/data/models/category_product_response_model.dart';

import 'category_response_model.dart';

class CategoriesWithProductsModel {
  CategoriesWithProductsModel(
      {required this.categoryProducts, required this.categories});
  final CategoriesResponseModel categories;
  final List<CategoryProductResponseModel> categoryProducts;
}
