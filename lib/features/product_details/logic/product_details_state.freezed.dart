// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductDetailsState {
  ProductDataState get productDataState => throw _privateConstructorUsedError;
  ActionState get addToCartState => throw _privateConstructorUsedError;
  ActionState get toggleFavoriteState => throw _privateConstructorUsedError;

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductDetailsStateCopyWith<ProductDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailsStateCopyWith<$Res> {
  factory $ProductDetailsStateCopyWith(
          ProductDetailsState value, $Res Function(ProductDetailsState) then) =
      _$ProductDetailsStateCopyWithImpl<$Res, ProductDetailsState>;
  @useResult
  $Res call(
      {ProductDataState productDataState,
      ActionState addToCartState,
      ActionState toggleFavoriteState});

  $ProductDataStateCopyWith<$Res> get productDataState;
  $ActionStateCopyWith<$Res> get addToCartState;
  $ActionStateCopyWith<$Res> get toggleFavoriteState;
}

/// @nodoc
class _$ProductDetailsStateCopyWithImpl<$Res, $Val extends ProductDetailsState>
    implements $ProductDetailsStateCopyWith<$Res> {
  _$ProductDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productDataState = null,
    Object? addToCartState = null,
    Object? toggleFavoriteState = null,
  }) {
    return _then(_value.copyWith(
      productDataState: null == productDataState
          ? _value.productDataState
          : productDataState // ignore: cast_nullable_to_non_nullable
              as ProductDataState,
      addToCartState: null == addToCartState
          ? _value.addToCartState
          : addToCartState // ignore: cast_nullable_to_non_nullable
              as ActionState,
      toggleFavoriteState: null == toggleFavoriteState
          ? _value.toggleFavoriteState
          : toggleFavoriteState // ignore: cast_nullable_to_non_nullable
              as ActionState,
    ) as $Val);
  }

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductDataStateCopyWith<$Res> get productDataState {
    return $ProductDataStateCopyWith<$Res>(_value.productDataState, (value) {
      return _then(_value.copyWith(productDataState: value) as $Val);
    });
  }

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActionStateCopyWith<$Res> get addToCartState {
    return $ActionStateCopyWith<$Res>(_value.addToCartState, (value) {
      return _then(_value.copyWith(addToCartState: value) as $Val);
    });
  }

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActionStateCopyWith<$Res> get toggleFavoriteState {
    return $ActionStateCopyWith<$Res>(_value.toggleFavoriteState, (value) {
      return _then(_value.copyWith(toggleFavoriteState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductDetailsStateImplCopyWith<$Res>
    implements $ProductDetailsStateCopyWith<$Res> {
  factory _$$ProductDetailsStateImplCopyWith(_$ProductDetailsStateImpl value,
          $Res Function(_$ProductDetailsStateImpl) then) =
      __$$ProductDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ProductDataState productDataState,
      ActionState addToCartState,
      ActionState toggleFavoriteState});

  @override
  $ProductDataStateCopyWith<$Res> get productDataState;
  @override
  $ActionStateCopyWith<$Res> get addToCartState;
  @override
  $ActionStateCopyWith<$Res> get toggleFavoriteState;
}

/// @nodoc
class __$$ProductDetailsStateImplCopyWithImpl<$Res>
    extends _$ProductDetailsStateCopyWithImpl<$Res, _$ProductDetailsStateImpl>
    implements _$$ProductDetailsStateImplCopyWith<$Res> {
  __$$ProductDetailsStateImplCopyWithImpl(_$ProductDetailsStateImpl _value,
      $Res Function(_$ProductDetailsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productDataState = null,
    Object? addToCartState = null,
    Object? toggleFavoriteState = null,
  }) {
    return _then(_$ProductDetailsStateImpl(
      productDataState: null == productDataState
          ? _value.productDataState
          : productDataState // ignore: cast_nullable_to_non_nullable
              as ProductDataState,
      addToCartState: null == addToCartState
          ? _value.addToCartState
          : addToCartState // ignore: cast_nullable_to_non_nullable
              as ActionState,
      toggleFavoriteState: null == toggleFavoriteState
          ? _value.toggleFavoriteState
          : toggleFavoriteState // ignore: cast_nullable_to_non_nullable
              as ActionState,
    ));
  }
}

/// @nodoc

class _$ProductDetailsStateImpl implements _ProductDetailsState {
  const _$ProductDetailsStateImpl(
      {this.productDataState = const ProductDataState.loading(),
      this.addToCartState = const ActionState.idle(),
      this.toggleFavoriteState = const ActionState.idle()});

  @override
  @JsonKey()
  final ProductDataState productDataState;
  @override
  @JsonKey()
  final ActionState addToCartState;
  @override
  @JsonKey()
  final ActionState toggleFavoriteState;

  @override
  String toString() {
    return 'ProductDetailsState(productDataState: $productDataState, addToCartState: $addToCartState, toggleFavoriteState: $toggleFavoriteState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailsStateImpl &&
            (identical(other.productDataState, productDataState) ||
                other.productDataState == productDataState) &&
            (identical(other.addToCartState, addToCartState) ||
                other.addToCartState == addToCartState) &&
            (identical(other.toggleFavoriteState, toggleFavoriteState) ||
                other.toggleFavoriteState == toggleFavoriteState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, productDataState, addToCartState, toggleFavoriteState);

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDetailsStateImplCopyWith<_$ProductDetailsStateImpl> get copyWith =>
      __$$ProductDetailsStateImplCopyWithImpl<_$ProductDetailsStateImpl>(
          this, _$identity);
}

abstract class _ProductDetailsState implements ProductDetailsState {
  const factory _ProductDetailsState(
      {final ProductDataState productDataState,
      final ActionState addToCartState,
      final ActionState toggleFavoriteState}) = _$ProductDetailsStateImpl;

  @override
  ProductDataState get productDataState;
  @override
  ActionState get addToCartState;
  @override
  ActionState get toggleFavoriteState;

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductDetailsStateImplCopyWith<_$ProductDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductDataState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(SingleProductModel product) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(SingleProductModel product)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(SingleProductModel product)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDataStateCopyWith<$Res> {
  factory $ProductDataStateCopyWith(
          ProductDataState value, $Res Function(ProductDataState) then) =
      _$ProductDataStateCopyWithImpl<$Res, ProductDataState>;
}

/// @nodoc
class _$ProductDataStateCopyWithImpl<$Res, $Val extends ProductDataState>
    implements $ProductDataStateCopyWith<$Res> {
  _$ProductDataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductDataState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ProductDataStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductDataState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ProductDataState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(SingleProductModel product) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(SingleProductModel product)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(SingleProductModel product)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ProductDataState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SingleProductModel product});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$ProductDataStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$LoadedImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as SingleProductModel,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl({required this.product});

  @override
  final SingleProductModel product;

  @override
  String toString() {
    return 'ProductDataState.loaded(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  /// Create a copy of ProductDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(SingleProductModel product) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(SingleProductModel product)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(SingleProductModel product)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements ProductDataState {
  const factory _Loaded({required final SingleProductModel product}) =
      _$LoadedImpl;

  SingleProductModel get product;

  /// Create a copy of ProductDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ProductDataStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'ProductDataState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ProductDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(SingleProductModel product) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(SingleProductModel product)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(SingleProductModel product)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ProductDataState {
  const factory _Error({required final String message}) = _$ErrorImpl;

  String get message;

  /// Create a copy of ProductDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ActionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_ActionLoading value) loading,
    required TResult Function(_ActionSuccess value) success,
    required TResult Function(_ActionError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_ActionLoading value)? loading,
    TResult? Function(_ActionSuccess value)? success,
    TResult? Function(_ActionError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_ActionLoading value)? loading,
    TResult Function(_ActionSuccess value)? success,
    TResult Function(_ActionError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionStateCopyWith<$Res> {
  factory $ActionStateCopyWith(
          ActionState value, $Res Function(ActionState) then) =
      _$ActionStateCopyWithImpl<$Res, ActionState>;
}

/// @nodoc
class _$ActionStateCopyWithImpl<$Res, $Val extends ActionState>
    implements $ActionStateCopyWith<$Res> {
  _$ActionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$IdleImplCopyWith<$Res> {
  factory _$$IdleImplCopyWith(
          _$IdleImpl value, $Res Function(_$IdleImpl) then) =
      __$$IdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IdleImplCopyWithImpl<$Res>
    extends _$ActionStateCopyWithImpl<$Res, _$IdleImpl>
    implements _$$IdleImplCopyWith<$Res> {
  __$$IdleImplCopyWithImpl(_$IdleImpl _value, $Res Function(_$IdleImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$IdleImpl implements _Idle {
  const _$IdleImpl();

  @override
  String toString() {
    return 'ActionState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_ActionLoading value) loading,
    required TResult Function(_ActionSuccess value) success,
    required TResult Function(_ActionError value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_ActionLoading value)? loading,
    TResult? Function(_ActionSuccess value)? success,
    TResult? Function(_ActionError value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_ActionLoading value)? loading,
    TResult Function(_ActionSuccess value)? success,
    TResult Function(_ActionError value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _Idle implements ActionState {
  const factory _Idle() = _$IdleImpl;
}

/// @nodoc
abstract class _$$ActionLoadingImplCopyWith<$Res> {
  factory _$$ActionLoadingImplCopyWith(
          _$ActionLoadingImpl value, $Res Function(_$ActionLoadingImpl) then) =
      __$$ActionLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ActionLoadingImplCopyWithImpl<$Res>
    extends _$ActionStateCopyWithImpl<$Res, _$ActionLoadingImpl>
    implements _$$ActionLoadingImplCopyWith<$Res> {
  __$$ActionLoadingImplCopyWithImpl(
      _$ActionLoadingImpl _value, $Res Function(_$ActionLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ActionLoadingImpl implements _ActionLoading {
  const _$ActionLoadingImpl();

  @override
  String toString() {
    return 'ActionState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ActionLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_ActionLoading value) loading,
    required TResult Function(_ActionSuccess value) success,
    required TResult Function(_ActionError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_ActionLoading value)? loading,
    TResult? Function(_ActionSuccess value)? success,
    TResult? Function(_ActionError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_ActionLoading value)? loading,
    TResult Function(_ActionSuccess value)? success,
    TResult Function(_ActionError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _ActionLoading implements ActionState {
  const factory _ActionLoading() = _$ActionLoadingImpl;
}

/// @nodoc
abstract class _$$ActionSuccessImplCopyWith<$Res> {
  factory _$$ActionSuccessImplCopyWith(
          _$ActionSuccessImpl value, $Res Function(_$ActionSuccessImpl) then) =
      __$$ActionSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ActionSuccessImplCopyWithImpl<$Res>
    extends _$ActionStateCopyWithImpl<$Res, _$ActionSuccessImpl>
    implements _$$ActionSuccessImplCopyWith<$Res> {
  __$$ActionSuccessImplCopyWithImpl(
      _$ActionSuccessImpl _value, $Res Function(_$ActionSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ActionSuccessImpl implements _ActionSuccess {
  const _$ActionSuccessImpl();

  @override
  String toString() {
    return 'ActionState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ActionSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_ActionLoading value) loading,
    required TResult Function(_ActionSuccess value) success,
    required TResult Function(_ActionError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_ActionLoading value)? loading,
    TResult? Function(_ActionSuccess value)? success,
    TResult? Function(_ActionError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_ActionLoading value)? loading,
    TResult Function(_ActionSuccess value)? success,
    TResult Function(_ActionError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _ActionSuccess implements ActionState {
  const factory _ActionSuccess() = _$ActionSuccessImpl;
}

/// @nodoc
abstract class _$$ActionErrorImplCopyWith<$Res> {
  factory _$$ActionErrorImplCopyWith(
          _$ActionErrorImpl value, $Res Function(_$ActionErrorImpl) then) =
      __$$ActionErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ActionErrorImplCopyWithImpl<$Res>
    extends _$ActionStateCopyWithImpl<$Res, _$ActionErrorImpl>
    implements _$$ActionErrorImplCopyWith<$Res> {
  __$$ActionErrorImplCopyWithImpl(
      _$ActionErrorImpl _value, $Res Function(_$ActionErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ActionErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ActionErrorImpl implements _ActionError {
  const _$ActionErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'ActionState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ActionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionErrorImplCopyWith<_$ActionErrorImpl> get copyWith =>
      __$$ActionErrorImplCopyWithImpl<_$ActionErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_ActionLoading value) loading,
    required TResult Function(_ActionSuccess value) success,
    required TResult Function(_ActionError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_ActionLoading value)? loading,
    TResult? Function(_ActionSuccess value)? success,
    TResult? Function(_ActionError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_ActionLoading value)? loading,
    TResult Function(_ActionSuccess value)? success,
    TResult Function(_ActionError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ActionError implements ActionState {
  const factory _ActionError({required final String message}) =
      _$ActionErrorImpl;

  String get message;

  /// Create a copy of ActionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActionErrorImplCopyWith<_$ActionErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
