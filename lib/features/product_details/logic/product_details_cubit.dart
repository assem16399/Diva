import 'package:bloc/bloc.dart';
import 'package:diva/features/product_details/data/repos/product_details_repo.dart';
import 'package:diva/features/product_details/logic/product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this._repo) : super(const ProductDetailsState());

  final ProductDetailsRepo _repo;

  Future<void> getProductDetails(int id) async {
    emit(state.copyWith(productDataState: const ProductDataState.loading()));
    final result = await _repo.getProductDetails(id);
    result.when(
      success: (product) {
        emit(
          state.copyWith(
            productDataState: ProductDataState.loaded(product: product),
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            productDataState: ProductDataState.error(
              message: error.message ?? 'An error occurred',
            ),
          ),
        );
      },
    );
  }

  Future<void> addToCart() async {
    emit(state.copyWith(addToCartState: const ActionState.loading()));
    await Future<dynamic>.delayed(const Duration(seconds: 2));
    emit(state.copyWith(addToCartState: const ActionState.success()));
  }

  Future<void> toggleFavorite() async {
    emit(state.copyWith(toggleFavoriteState: const ActionState.loading()));
    await Future<dynamic>.delayed(const Duration(seconds: 2));
    emit(state.copyWith(toggleFavoriteState: const ActionState.success()));
  }
}
