import 'package:diva/features/categeries_secreen/data/models/category_product_response_model.dart';

class WishlistStateChangedEvent {
  const WishlistStateChangedEvent({
    required this.wishlist,
    required this.id,
    required this.publisherId,
  });
  final List<CategoryProductResponseModel> wishlist;
  final int id;
  final String publisherId;
}
