import 'package:diva/features/categeries_secreen/data/models/category_product_response_model.dart';
import 'package:hive/hive.dart';

class ProductWishListRepository {
  final boxName = "CategoryProductResponseModel_box";

  Future<void> openBox() async {
    await Hive.openBox<CategoryProductResponseModel>(boxName);
  }

  Box<CategoryProductResponseModel> getBox() =>
      Hive.box<CategoryProductResponseModel>(boxName);

  Future<void> closeBox() async {
    await Hive.box(boxName).close();
  }

  Future<void> clearBox() async {
    await Hive.box(boxName).clear();
  }

  // Add a product to the wishlist
  Future<void> addToWishlist(CategoryProductResponseModel product) async {
    final box = getBox();
    await box.put(product.id, product);
    print('Added Successfully');
  }

  // Remove a product from the wishlist
  Future<void> removeFromWishlist(int productId) async {
    final box = getBox();
    await box.delete(productId);
  }

  // Get all products in the wishlist
  List<CategoryProductResponseModel> getWishlist() {
    final box = getBox();
    return box.values.toList();
    return List<CategoryProductResponseModel>.generate(
        8,
        (index) => CategoryProductResponseModel(
            id: index,
            title: 'Wishlist product ${index + 1}',
            price: (100 + index).toDouble(),
            description: 'Wishlist product desc ${index + 1}',
            category: 'category',
            image: 'https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg',
            rating: Rating(count: 100, rate: 4)));
  }
}
