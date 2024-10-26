import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:diva/core/events/events_handler.dart';
import 'package:diva/core/events/wishlist_state_changed_event.dart';
import 'package:diva/features/categeries_secreen/data/models/category_product_response_model.dart';
import 'package:diva/features/categeries_secreen/data/repo/categries_repo.dart';
import 'package:diva/features/categeries_secreen/logic/categories_state.dart';
import 'package:diva/features/wishlist_screen/repo/product_wishList_repository.dart';

class CategoriesCubit extends Cubit<CategoriesState> with EventBusMixin {
  CategoriesCubit(this._categoryRepository, this._wishlistRepo)
      : super(
          const CategoriesState(event: CategoriesStateEvent.fetchingCategories),
        ) {
    _listenToSharedEventsUsingEventBus();
  }
  static const _publisherId = 'categoriesCubit';
  final CategoryRepository _categoryRepository;
  final ProductWishListRepository _wishlistRepo;
  late final StreamSubscription _subscription;

  Future<void> fetchCategories() async {
    emit(state.copyWith(
        categoriesState: const CategoriesDataState.loading(),
        event: CategoriesStateEvent.fetchingWishlist));

    final result = await _categoryRepository.getCategories();

    result.when(
      success: (categories) {
        final categoriesNames = categories.categories;
        emit(
          state.copyWith(
              categoriesState:
                  CategoriesDataState.loaded(data: categoriesNames),
              event: CategoriesStateEvent.fetchingCategories),
        );

        if (categoriesNames.isNotEmpty) {
          fetchProducts(categoriesNames.first.name);
        }
      },
      failure: (error) => emit(
        state.copyWith(
          event: CategoriesStateEvent.fetchingCategories,
          categoriesState:
              CategoriesDataState.error(message: error.message ?? ''),
        ),
      ),
    );
  }

  void getWishlistData() {
    emit(
      state.copyWith(
        wishlistDataState: const CategoriesDataState.loading(),
        event: CategoriesStateEvent.fetchingWishlist,
      ),
    );
    try {
      final wishlist = _wishlistRepo.getWishlist();
      emit(
        state.copyWith(
          wishlistDataState:
              CategoriesDataState<List<CategoryProductResponseModel>>.loaded(
            data: wishlist,
          ),
          event: CategoriesStateEvent.fetchingWishlist,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          wishlistDataState:
              CategoriesDataState.error(message: error.toString()),
          event: CategoriesStateEvent.fetchingWishlist,
        ),
      );
    }
  }

  void toggleFavoriteStatus(CategoryProductResponseModel product) {
    state.wishlistDataState.maybeWhen(
      loaded: (wishlist) {
        print('Wishlist: ${wishlist.length}');

        final List<CategoryProductResponseModel> wishlistAfterToggling;
        final productIndex =
            wishlist.indexWhere((item) => item.id == product.id);
        if (productIndex != -1) {
          print('it contains');
          wishlistAfterToggling =
              List<CategoryProductResponseModel>.from(wishlist)
                ..removeAt(productIndex);
          print('wishlist after toggline inside cubit: ${wishlist.length}');
          _wishlistRepo.removeFromWishlist(product.id);
        } else {
          print('it does not contain');
          wishlistAfterToggling =
              List<CategoryProductResponseModel>.from(wishlist)..add(product);
          _wishlistRepo.addToWishlist(product);
        }

        emit(state.copyWith(
            wishlistDataState:
                CategoriesDataState<List<CategoryProductResponseModel>>.loaded(
              data: wishlistAfterToggling,
            ),
            event: CategoriesStateEvent.toggleWishlistItem));

        emit(
          state.copyWith(
              wishlistToggleState: WishlistToggleState.loaded(
                  wishlist: wishlistAfterToggling, productId: product.id),
              event: CategoriesStateEvent.toggleWishlistItem),
        );

        shareEvent(
          WishlistStateChangedEvent(
            wishlist: wishlistAfterToggling,
            id: product.id,
            publisherId: _publisherId,
          ),
        );
      },
      orElse: () {},
    );
  }

  bool isInWishlist(CategoryProductResponseModel product) {
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
        productsState: const CategoriesDataState.loading(),
        event: CategoriesStateEvent.fetchingProducts,
      ),
    );

    final result =
        await _categoryRepository.getSpecificCategoriesProducts(category);

    result.when(
      success: (products) {
        emit(
          state.copyWith(
            productsState: CategoriesDataState.loaded(data: products),
            event: CategoriesStateEvent.fetchingProducts,
          ),
        );
      },
      failure: (error) => emit(
        state.copyWith(
          productsState:
              CategoriesDataState.error(message: error.message ?? ''),
          event: CategoriesStateEvent.fetchingProducts,
        ),
      ),
    );
  }

  void _listenToSharedEventsUsingEventBus() {
    _subscription = listenEvent<WishlistStateChangedEvent>((event) {
      if (event.publisherId != _publisherId) {
        emit(
          state.copyWith(
            wishlistDataState: CategoriesDataState.loaded(data: event.wishlist),
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
