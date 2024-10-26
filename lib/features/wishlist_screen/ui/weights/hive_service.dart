import 'package:diva/features/categeries_secreen/data/models/category_product_response_model.dart';
import 'package:hive/hive.dart';

class ProductWishListRepository {
  static const String boxName = "CategoryProductResponseModel_box";
  static openBox() async =>
      await Hive.openBox<CategoryProductResponseModel>(boxName);
  static Box getBox() => Hive.box<CategoryProductResponseModel>(boxName);
  static closeBox() async => await Hive.box(boxName).close();
  static clearBox() async => await Hive.box(boxName).clear();
}
