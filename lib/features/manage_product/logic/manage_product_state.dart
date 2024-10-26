import 'package:diva/features/manage_product/data/models/mange_product_body_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manage_product_state.freezed.dart';

enum ManageProductAction {
  add,
  update,
  fetchingCategories,
  fetchingProductData
}

@freezed
sealed class ManageProductState with _$ManageProductState {
  const factory ManageProductState({
    @Default(LoadingDataState<List<String>>.loading())
    LoadingDataState<List<String>> categoryDataState,
    @Default(LoadingDataState<ManageProductModel>.loading())
    LoadingDataState<ManageProductModel> manageProductState,
    @Default(LoadingDataState<ManageProductModel>.loading())
    LoadingDataState<ManageProductModel>? productDataState,
    ManageProductAction? action,
  }) = _ManageProductState;
}

@freezed
class LoadingDataState<T> with _$LoadingDataState<T> {
  const factory LoadingDataState.initial() = _Initial;
  const factory LoadingDataState.loading() = _Loading;
  const factory LoadingDataState.loaded({required T data}) = _Loaded;
  const factory LoadingDataState.error({required String message}) = _Error;
}
