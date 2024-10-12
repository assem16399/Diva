import 'package:diva/features/home_Screen/data/models/categories_response_model.dart';
import 'package:diva/features/home_Screen/data/models/category_product_response_model.dart';

class HomeModel {
  HomeModel({required this.allProducts, required this.categories});
  final CategoriesResponseModel categories;
  final List<CategoryProductResponseModel> allProducts;
}
