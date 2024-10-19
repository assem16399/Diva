part of 'home_screen_cubit.dart';

enum HomeStateEvent { fetchingCategories, fetchingProducts }

@freezed
sealed class HomeScreenState<T> with _$HomeScreenState<T> {
  const factory HomeScreenState({
    required HomeStateEvent event,
    @Default(HomeDataState.initial()) HomeDataState categoriesState,
    @Default(HomeDataState.initial()) HomeDataState productsState,
  }) = _HomeScreenState;
}

@freezed
sealed class HomeDataState<T> with _$HomeDataState<T> {
  const factory HomeDataState.initial() = _Initial;
  const factory HomeDataState.loading() = _Loading;
  const factory HomeDataState.loaded({required List<dynamic> data}) = _Loaded;
  const factory HomeDataState.error({required String message}) = _Error;
}
