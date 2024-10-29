import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:diva/core/events/events_handler.dart';
import 'package:diva/core/events/wishlist_state_changed_event.dart';
import 'package:diva/features/categeries_secreen/data/models/category_product_response_model.dart';
import 'package:diva/features/wishlist_screen/logic/wishlist_state.dart';
import 'package:diva/features/wishlist_screen/repo/product_wishList_repository.dart';

class WishlistCubit extends Cubit<WishlistState> with EventBusMixin {
  WishlistCubit(this._repo)
      : super(WishlistState(event: WishlistStateEvent.fetchingWishlist)) {
    _listenToSharedEventsUsingEventBus();
  }

  static const _publisherId = 'wishlistCubit';

  final ProductWishListRepository _repo;
  late final StreamSubscription _subscription;

  void getWishlistData() {
    emit(
      state.copyWith(
        wishlistDataState: const WishlistDataState.loading(),
        event: WishlistStateEvent.fetchingWishlist,
      ),
    );
    try {
      final wishlist = _repo.getWishlist();
      emit(
        state.copyWith(
          wishlistDataState:
              WishlistDataState<List<CategoryProductResponseModel>>.loaded(
            data: wishlist,
          ),
          event: WishlistStateEvent.fetchingWishlist,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          wishlistDataState: WishlistDataState.error(message: error.toString()),
          event: WishlistStateEvent.fetchingWishlist,
        ),
      );
    }
  }

  void toggleFavoriteStatus(CategoryProductResponseModel product) {
    state.wishlistDataState.maybeWhen(
      loaded: (wishlist) {
        final List<CategoryProductResponseModel> wishlistAfterToggling;
        //final List<CategoryProductResponseModel> wishlistAfterToggling2;
        if (wishlist.contains(product)) {
          wishlistAfterToggling =
              List<CategoryProductResponseModel>.from(wishlist)
                ..remove(product);
          _repo.removeFromWishlist(product.id);

          //wishlistAfterToggling2 = [...wishlist]..remove(product);
        } else {
          wishlistAfterToggling =
              List<CategoryProductResponseModel>.from(wishlist)..add(product);
          _repo.addToWishlist(product);
          //wishlistAfterToggling2 = [...wishlist, product];
        }
        emit(
          state.copyWith(
            wishlistDataState:
                WishlistDataState.loaded(data: wishlistAfterToggling),
          ),
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

  void _listenToSharedEventsUsingEventBus() {
    _subscription = listenEvent<WishlistStateChangedEvent>((event) {
      if (event.publisherId != _publisherId) {
        emit(
          state.copyWith(
            wishlistDataState: WishlistDataState.loaded(data: event.wishlist),
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
