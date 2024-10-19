// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cartLoading,
    required TResult Function(T data) cartSuccess,
    required TResult Function(String error) cartError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cartLoading,
    TResult? Function(T data)? cartSuccess,
    TResult? Function(String error)? cartError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cartLoading,
    TResult Function(T data)? cartSuccess,
    TResult Function(String error)? cartError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartLoading<T> value) cartLoading,
    required TResult Function(CartSuccess<T> value) cartSuccess,
    required TResult Function(CartError<T> value) cartError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CartLoading<T> value)? cartLoading,
    TResult? Function(CartSuccess<T> value)? cartSuccess,
    TResult? Function(CartError<T> value)? cartError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartLoading<T> value)? cartLoading,
    TResult Function(CartSuccess<T> value)? cartSuccess,
    TResult Function(CartError<T> value)? cartError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<T, $Res> {
  factory $CartStateCopyWith(
          CartState<T> value, $Res Function(CartState<T>) then) =
      _$CartStateCopyWithImpl<T, $Res, CartState<T>>;
}

/// @nodoc
class _$CartStateCopyWithImpl<T, $Res, $Val extends CartState<T>>
    implements $CartStateCopyWith<T, $Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CartLoadingImplCopyWith<T, $Res> {
  factory _$$CartLoadingImplCopyWith(_$CartLoadingImpl<T> value,
          $Res Function(_$CartLoadingImpl<T>) then) =
      __$$CartLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$CartLoadingImplCopyWithImpl<T, $Res>
    extends _$CartStateCopyWithImpl<T, $Res, _$CartLoadingImpl<T>>
    implements _$$CartLoadingImplCopyWith<T, $Res> {
  __$$CartLoadingImplCopyWithImpl(
      _$CartLoadingImpl<T> _value, $Res Function(_$CartLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CartLoadingImpl<T> implements CartLoading<T> {
  const _$CartLoadingImpl();

  @override
  String toString() {
    return 'CartState<$T>.cartLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CartLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cartLoading,
    required TResult Function(T data) cartSuccess,
    required TResult Function(String error) cartError,
  }) {
    return cartLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cartLoading,
    TResult? Function(T data)? cartSuccess,
    TResult? Function(String error)? cartError,
  }) {
    return cartLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cartLoading,
    TResult Function(T data)? cartSuccess,
    TResult Function(String error)? cartError,
    required TResult orElse(),
  }) {
    if (cartLoading != null) {
      return cartLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartLoading<T> value) cartLoading,
    required TResult Function(CartSuccess<T> value) cartSuccess,
    required TResult Function(CartError<T> value) cartError,
  }) {
    return cartLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CartLoading<T> value)? cartLoading,
    TResult? Function(CartSuccess<T> value)? cartSuccess,
    TResult? Function(CartError<T> value)? cartError,
  }) {
    return cartLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartLoading<T> value)? cartLoading,
    TResult Function(CartSuccess<T> value)? cartSuccess,
    TResult Function(CartError<T> value)? cartError,
    required TResult orElse(),
  }) {
    if (cartLoading != null) {
      return cartLoading(this);
    }
    return orElse();
  }
}

abstract class CartLoading<T> implements CartState<T> {
  const factory CartLoading() = _$CartLoadingImpl<T>;
}

/// @nodoc
abstract class _$$CartSuccessImplCopyWith<T, $Res> {
  factory _$$CartSuccessImplCopyWith(_$CartSuccessImpl<T> value,
          $Res Function(_$CartSuccessImpl<T>) then) =
      __$$CartSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$CartSuccessImplCopyWithImpl<T, $Res>
    extends _$CartStateCopyWithImpl<T, $Res, _$CartSuccessImpl<T>>
    implements _$$CartSuccessImplCopyWith<T, $Res> {
  __$$CartSuccessImplCopyWithImpl(
      _$CartSuccessImpl<T> _value, $Res Function(_$CartSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$CartSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$CartSuccessImpl<T> implements CartSuccess<T> {
  const _$CartSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'CartState<$T>.cartSuccess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartSuccessImplCopyWith<T, _$CartSuccessImpl<T>> get copyWith =>
      __$$CartSuccessImplCopyWithImpl<T, _$CartSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cartLoading,
    required TResult Function(T data) cartSuccess,
    required TResult Function(String error) cartError,
  }) {
    return cartSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cartLoading,
    TResult? Function(T data)? cartSuccess,
    TResult? Function(String error)? cartError,
  }) {
    return cartSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cartLoading,
    TResult Function(T data)? cartSuccess,
    TResult Function(String error)? cartError,
    required TResult orElse(),
  }) {
    if (cartSuccess != null) {
      return cartSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartLoading<T> value) cartLoading,
    required TResult Function(CartSuccess<T> value) cartSuccess,
    required TResult Function(CartError<T> value) cartError,
  }) {
    return cartSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CartLoading<T> value)? cartLoading,
    TResult? Function(CartSuccess<T> value)? cartSuccess,
    TResult? Function(CartError<T> value)? cartError,
  }) {
    return cartSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartLoading<T> value)? cartLoading,
    TResult Function(CartSuccess<T> value)? cartSuccess,
    TResult Function(CartError<T> value)? cartError,
    required TResult orElse(),
  }) {
    if (cartSuccess != null) {
      return cartSuccess(this);
    }
    return orElse();
  }
}

abstract class CartSuccess<T> implements CartState<T> {
  const factory CartSuccess(final T data) = _$CartSuccessImpl<T>;

  T get data;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartSuccessImplCopyWith<T, _$CartSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CartErrorImplCopyWith<T, $Res> {
  factory _$$CartErrorImplCopyWith(
          _$CartErrorImpl<T> value, $Res Function(_$CartErrorImpl<T>) then) =
      __$$CartErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$CartErrorImplCopyWithImpl<T, $Res>
    extends _$CartStateCopyWithImpl<T, $Res, _$CartErrorImpl<T>>
    implements _$$CartErrorImplCopyWith<T, $Res> {
  __$$CartErrorImplCopyWithImpl(
      _$CartErrorImpl<T> _value, $Res Function(_$CartErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$CartErrorImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CartErrorImpl<T> implements CartError<T> {
  const _$CartErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'CartState<$T>.cartError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartErrorImplCopyWith<T, _$CartErrorImpl<T>> get copyWith =>
      __$$CartErrorImplCopyWithImpl<T, _$CartErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cartLoading,
    required TResult Function(T data) cartSuccess,
    required TResult Function(String error) cartError,
  }) {
    return cartError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cartLoading,
    TResult? Function(T data)? cartSuccess,
    TResult? Function(String error)? cartError,
  }) {
    return cartError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cartLoading,
    TResult Function(T data)? cartSuccess,
    TResult Function(String error)? cartError,
    required TResult orElse(),
  }) {
    if (cartError != null) {
      return cartError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartLoading<T> value) cartLoading,
    required TResult Function(CartSuccess<T> value) cartSuccess,
    required TResult Function(CartError<T> value) cartError,
  }) {
    return cartError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CartLoading<T> value)? cartLoading,
    TResult? Function(CartSuccess<T> value)? cartSuccess,
    TResult? Function(CartError<T> value)? cartError,
  }) {
    return cartError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartLoading<T> value)? cartLoading,
    TResult Function(CartSuccess<T> value)? cartSuccess,
    TResult Function(CartError<T> value)? cartError,
    required TResult orElse(),
  }) {
    if (cartError != null) {
      return cartError(this);
    }
    return orElse();
  }
}

abstract class CartError<T> implements CartState<T> {
  const factory CartError({required final String error}) = _$CartErrorImpl<T>;

  String get error;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartErrorImplCopyWith<T, _$CartErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
