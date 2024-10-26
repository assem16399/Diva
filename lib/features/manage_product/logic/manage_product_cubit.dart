import 'package:bloc/bloc.dart';
import 'package:diva/features/manage_product/data/models/mange_product_body_model.dart';
import 'package:diva/features/manage_product/data/repos/manage_product_repo.dart';
import 'package:diva/features/manage_product/logic/manage_product_state.dart';

class ManageProductCubit extends Cubit<ManageProductState> {
  ManageProductCubit(this._repo) : super(const ManageProductState());
  final ManageProductRepo _repo;

  Future<void> getProduct(String productId) async {
    emit(state.copyWith(
        productDataState: const LoadingDataState.loading(),
        action: ManageProductAction.fetchingProductData));
    final result = await _repo.getProductData(productId);
    result.when(
      success: (product) {
        emit(
          state.copyWith(
            productDataState: LoadingDataState.loaded(data: product),
            action: ManageProductAction.fetchingProductData,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            productDataState: LoadingDataState.error(
              message: error.message ?? 'An error occurred',
            ),
            action: ManageProductAction.fetchingProductData,
          ),
        );
      },
    );
  }

  Future<void> getAvailableCategories() async {
    emit(
      state.copyWith(
        categoryDataState: const LoadingDataState.loading(),
        action: ManageProductAction.fetchingCategories,
      ),
    );
    final result = await _repo.getAvailableCategories();
    result.when(
      success: (categories) {
        emit(
          state.copyWith(
            categoryDataState: LoadingDataState.loaded(data: categories),
            action: ManageProductAction.fetchingCategories,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            categoryDataState: LoadingDataState.error(
              message: error.message ?? 'An error occurred',
            ),
            action: ManageProductAction.fetchingCategories,
          ),
        );
      },
    );
  }

  Future<void> addProduct(ManageProductModel productModel) async {
    emit(state.copyWith(
        manageProductState: const LoadingDataState.loading(),
        action: ManageProductAction.add));
    final result = await _repo.addProduct(productModel: productModel);
    result.when(
      success: (product) {
        emit(
          state.copyWith(
            manageProductState: LoadingDataState.loaded(data: product),
            action: ManageProductAction.add,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            manageProductState: LoadingDataState.error(
              message: error.message ?? 'An error occurred',
            ),
            action: ManageProductAction.add,
          ),
        );
      },
    );
  }

  Future<void> updateProduct(ManageProductModel productModel) async {
    emit(state.copyWith(
        manageProductState: const LoadingDataState.loading(),
        action: ManageProductAction.update));
    final result = await _repo.updateProduct(productModel: productModel);
    result.when(
      success: (product) {
        emit(
          state.copyWith(
            manageProductState: LoadingDataState.loaded(data: product),
            action: ManageProductAction.update,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
              manageProductState: LoadingDataState.error(
                message: error.message ?? 'An error occurred',
              ),
              action: ManageProductAction.update),
        );
      },
    );
  }
}
