import 'package:bloc/bloc.dart';
import 'package:diva/features/categeries_secreen/data/models/category_product_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wishlist_cubit.freezed.dart';
part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(const WishlistState.initial());
}
