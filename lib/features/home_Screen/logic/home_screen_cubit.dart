import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:diva/core/events/events_handler.dart';
import 'package:diva/features/categeries_secreen/data/models/category_product_response_model.dart';
import 'package:diva/features/home_Screen/data/models/home_product_response_model.dart';
import 'package:diva/features/home_Screen/data/repo/home_repo.dart';
import 'package:diva/features/wishlist_screen/repo/product_wishList_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/events/wishlist_state_changed_event.dart';

part 'home_screen_cubit.freezed.dart';
part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> with EventBusMixin {
  HomeScreenCubit(this._homeRepository, this._wishlistRepo)
      : super(
          const HomeScreenState(event: HomeStateEvent.fetchingCategories),
        ) {
    _listenToSharedEventsUsingEventBus();
  }
  final HomeRepository _homeRepository;
  static const _publisherId = 'homeScreenCubit';
  final ProductWishListRepository _wishlistRepo;
  late final StreamSubscription _subscription;

  Future<void> fetchCategories() async {
    emit(state.copyWith(
        categoriesState: const HomeDataState.loading(),
        event: HomeStateEvent.fetchingCategories));

    final result = await _homeRepository.getCategories();

    result.when(
      success: (categories) {
        final categoriesNames = categories.categories;
        emit(
          state.copyWith(
              categoriesState: HomeDataState.loaded(data: categoriesNames),
              event: HomeStateEvent.fetchingCategories),
        );

        if (categoriesNames.isNotEmpty) {
          fetchProducts(categoriesNames.first.name);
        }
      },
      failure: (error) => emit(
        state.copyWith(
          event: HomeStateEvent.fetchingCategories,
          categoriesState: HomeDataState.error(message: error.message ?? ''),
        ),
      ),
    );
  }

  void getWishlistData() {
    emit(
      state.copyWith(
        wishlistDataState: const HomeDataState.loading(),
        event: HomeStateEvent.fetchingWishlist,
      ),
    );
    try {
      final wishlist = _wishlistRepo.getWishlist();
      emit(
        state.copyWith(
          wishlistDataState:
              HomeDataState<List<HomeProductResponseModel>>.loaded(
            data: wishlist
                .map(HomeProductResponseModel.fromCategoryProductResponseModel)
                .toList(),
          ),
          event: HomeStateEvent.fetchingWishlist,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          wishlistDataState: HomeDataState.error(message: error.toString()),
          event: HomeStateEvent.fetchingWishlist,
        ),
      );
    }
  }

  void toggleFavoriteStatus(HomeProductResponseModel product) {
    state.wishlistDataState.maybeWhen(
      loaded: (wishlist) {
        print('Wishlist: ${wishlist.length}');

        final List<HomeProductResponseModel> wishlistAfterToggling;
        final productIndex =
            wishlist.indexWhere((item) => item.id == product.id);
        if (productIndex != -1) {
          print('it contains');
          wishlistAfterToggling = List<HomeProductResponseModel>.from(wishlist)
            ..removeAt(productIndex);
          print('wishlist after toggline inside cubit: ${wishlist.length}');
          _wishlistRepo.removeFromWishlist(product.id);
        } else {
          wishlistAfterToggling = List<HomeProductResponseModel>.from(wishlist)
            ..add(product);
          _wishlistRepo.addToWishlist(
              CategoryProductResponseModel.fromHomeProductResponseModel(
                  product));
        }

        emit(
          state.copyWith(
            wishlistToggleState: WishlistToggleState.loaded(
                wishlist: wishlistAfterToggling, productId: product.id),
            event: HomeStateEvent.toggleWishlistItem,
            wishlistDataState:
                HomeDataState<List<HomeProductResponseModel>>.loaded(
              data: wishlistAfterToggling,
            ),
          ),
        );

        shareEvent(
          WishlistStateChangedEvent(
            id: product.id,
            wishlist: wishlistAfterToggling
                .map(CategoryProductResponseModel.fromHomeProductResponseModel)
                .toList(),
            publisherId: _publisherId,
          ),
        );
      },
      orElse: () {},
    );
  }

  bool isInWishlist(HomeProductResponseModel product) {
    return state.wishlistDataState.maybeWhen(
      loaded: (wishlist) {
        return wishlist.contains(product);
      },
      orElse: () => false,
    );
  }

  Future<void> fetchProducts(String category) async {
    emit(
      state.copyWith(
        productsState: const HomeDataState.loading(),
        event: HomeStateEvent.fetchingProducts,
      ),
    );

    final result =
        await _homeRepository.getSpecificCategoriesProducts(category);

    result.when(
      success: (products) {
        emit(
          state.copyWith(
            productsState: HomeDataState.loaded(data: products),
            event: HomeStateEvent.fetchingProducts,
          ),
        );
      },
      failure: (error) => emit(
        state.copyWith(
          productsState: HomeDataState.error(message: error.message ?? ''),
          event: HomeStateEvent.fetchingProducts,
        ),
      ),
    );
  }

  void _listenToSharedEventsUsingEventBus() {
    _subscription = listenEvent<WishlistStateChangedEvent>((event) {
      if (event.publisherId != _publisherId) {
        emit(
          state.copyWith(
            wishlistDataState: HomeDataState.loaded(
                data: event.wishlist
                    .map(
                      HomeProductResponseModel.fromCategoryProductResponseModel,
                    )
                    .toList()),
          ),
        );
      }
    }, onError: (error) {});
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
