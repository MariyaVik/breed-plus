// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../features/profile/domain/profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Passport> passports) loaded,
    required TResult Function() empty,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Passport> passports)? loaded,
    TResult? Function()? empty,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Passport> passports)? loaded,
    TResult Function()? empty,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileInitial value) initial,
    required TResult Function(ProfileLoading value) loading,
    required TResult Function(ProfileLoaded value) loaded,
    required TResult Function(ProfileEmpty value) empty,
    required TResult Function(ProfileError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileInitial value)? initial,
    TResult? Function(ProfileLoading value)? loading,
    TResult? Function(ProfileLoaded value)? loaded,
    TResult? Function(ProfileEmpty value)? empty,
    TResult? Function(ProfileError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileInitial value)? initial,
    TResult Function(ProfileLoading value)? loading,
    TResult Function(ProfileLoaded value)? loaded,
    TResult Function(ProfileEmpty value)? empty,
    TResult Function(ProfileError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProfileInitialImplCopyWith<$Res> {
  factory _$$ProfileInitialImplCopyWith(_$ProfileInitialImpl value,
          $Res Function(_$ProfileInitialImpl) then) =
      __$$ProfileInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileInitialImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileInitialImpl>
    implements _$$ProfileInitialImplCopyWith<$Res> {
  __$$ProfileInitialImplCopyWithImpl(
      _$ProfileInitialImpl _value, $Res Function(_$ProfileInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProfileInitialImpl implements ProfileInitial {
  const _$ProfileInitialImpl();

  @override
  String toString() {
    return 'ProfileState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProfileInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Passport> passports) loaded,
    required TResult Function() empty,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Passport> passports)? loaded,
    TResult? Function()? empty,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Passport> passports)? loaded,
    TResult Function()? empty,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileInitial value) initial,
    required TResult Function(ProfileLoading value) loading,
    required TResult Function(ProfileLoaded value) loaded,
    required TResult Function(ProfileEmpty value) empty,
    required TResult Function(ProfileError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileInitial value)? initial,
    TResult? Function(ProfileLoading value)? loading,
    TResult? Function(ProfileLoaded value)? loaded,
    TResult? Function(ProfileEmpty value)? empty,
    TResult? Function(ProfileError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileInitial value)? initial,
    TResult Function(ProfileLoading value)? loading,
    TResult Function(ProfileLoaded value)? loaded,
    TResult Function(ProfileEmpty value)? empty,
    TResult Function(ProfileError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ProfileInitial implements ProfileState {
  const factory ProfileInitial() = _$ProfileInitialImpl;
}

/// @nodoc
abstract class _$$ProfileLoadingImplCopyWith<$Res> {
  factory _$$ProfileLoadingImplCopyWith(_$ProfileLoadingImpl value,
          $Res Function(_$ProfileLoadingImpl) then) =
      __$$ProfileLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileLoadingImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileLoadingImpl>
    implements _$$ProfileLoadingImplCopyWith<$Res> {
  __$$ProfileLoadingImplCopyWithImpl(
      _$ProfileLoadingImpl _value, $Res Function(_$ProfileLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProfileLoadingImpl implements ProfileLoading {
  const _$ProfileLoadingImpl();

  @override
  String toString() {
    return 'ProfileState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProfileLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Passport> passports) loaded,
    required TResult Function() empty,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Passport> passports)? loaded,
    TResult? Function()? empty,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Passport> passports)? loaded,
    TResult Function()? empty,
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
    required TResult Function(ProfileInitial value) initial,
    required TResult Function(ProfileLoading value) loading,
    required TResult Function(ProfileLoaded value) loaded,
    required TResult Function(ProfileEmpty value) empty,
    required TResult Function(ProfileError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileInitial value)? initial,
    TResult? Function(ProfileLoading value)? loading,
    TResult? Function(ProfileLoaded value)? loaded,
    TResult? Function(ProfileEmpty value)? empty,
    TResult? Function(ProfileError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileInitial value)? initial,
    TResult Function(ProfileLoading value)? loading,
    TResult Function(ProfileLoaded value)? loaded,
    TResult Function(ProfileEmpty value)? empty,
    TResult Function(ProfileError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ProfileLoading implements ProfileState {
  const factory ProfileLoading() = _$ProfileLoadingImpl;
}

/// @nodoc
abstract class _$$ProfileLoadedImplCopyWith<$Res> {
  factory _$$ProfileLoadedImplCopyWith(
          _$ProfileLoadedImpl value, $Res Function(_$ProfileLoadedImpl) then) =
      __$$ProfileLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Passport> passports});
}

/// @nodoc
class __$$ProfileLoadedImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileLoadedImpl>
    implements _$$ProfileLoadedImplCopyWith<$Res> {
  __$$ProfileLoadedImplCopyWithImpl(
      _$ProfileLoadedImpl _value, $Res Function(_$ProfileLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passports = null,
  }) {
    return _then(_$ProfileLoadedImpl(
      null == passports
          ? _value._passports
          : passports // ignore: cast_nullable_to_non_nullable
              as List<Passport>,
    ));
  }
}

/// @nodoc

class _$ProfileLoadedImpl implements ProfileLoaded {
  const _$ProfileLoadedImpl(final List<Passport> passports)
      : _passports = passports;

  final List<Passport> _passports;
  @override
  List<Passport> get passports {
    if (_passports is EqualUnmodifiableListView) return _passports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_passports);
  }

  @override
  String toString() {
    return 'ProfileState.loaded(passports: $passports)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._passports, _passports));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_passports));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileLoadedImplCopyWith<_$ProfileLoadedImpl> get copyWith =>
      __$$ProfileLoadedImplCopyWithImpl<_$ProfileLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Passport> passports) loaded,
    required TResult Function() empty,
    required TResult Function(String message) error,
  }) {
    return loaded(passports);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Passport> passports)? loaded,
    TResult? Function()? empty,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(passports);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Passport> passports)? loaded,
    TResult Function()? empty,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(passports);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileInitial value) initial,
    required TResult Function(ProfileLoading value) loading,
    required TResult Function(ProfileLoaded value) loaded,
    required TResult Function(ProfileEmpty value) empty,
    required TResult Function(ProfileError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileInitial value)? initial,
    TResult? Function(ProfileLoading value)? loading,
    TResult? Function(ProfileLoaded value)? loaded,
    TResult? Function(ProfileEmpty value)? empty,
    TResult? Function(ProfileError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileInitial value)? initial,
    TResult Function(ProfileLoading value)? loading,
    TResult Function(ProfileLoaded value)? loaded,
    TResult Function(ProfileEmpty value)? empty,
    TResult Function(ProfileError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ProfileLoaded implements ProfileState {
  const factory ProfileLoaded(final List<Passport> passports) =
      _$ProfileLoadedImpl;

  List<Passport> get passports;
  @JsonKey(ignore: true)
  _$$ProfileLoadedImplCopyWith<_$ProfileLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileEmptyImplCopyWith<$Res> {
  factory _$$ProfileEmptyImplCopyWith(
          _$ProfileEmptyImpl value, $Res Function(_$ProfileEmptyImpl) then) =
      __$$ProfileEmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileEmptyImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileEmptyImpl>
    implements _$$ProfileEmptyImplCopyWith<$Res> {
  __$$ProfileEmptyImplCopyWithImpl(
      _$ProfileEmptyImpl _value, $Res Function(_$ProfileEmptyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProfileEmptyImpl implements ProfileEmpty {
  const _$ProfileEmptyImpl();

  @override
  String toString() {
    return 'ProfileState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProfileEmptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Passport> passports) loaded,
    required TResult Function() empty,
    required TResult Function(String message) error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Passport> passports)? loaded,
    TResult? Function()? empty,
    TResult? Function(String message)? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Passport> passports)? loaded,
    TResult Function()? empty,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileInitial value) initial,
    required TResult Function(ProfileLoading value) loading,
    required TResult Function(ProfileLoaded value) loaded,
    required TResult Function(ProfileEmpty value) empty,
    required TResult Function(ProfileError value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileInitial value)? initial,
    TResult? Function(ProfileLoading value)? loading,
    TResult? Function(ProfileLoaded value)? loaded,
    TResult? Function(ProfileEmpty value)? empty,
    TResult? Function(ProfileError value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileInitial value)? initial,
    TResult Function(ProfileLoading value)? loading,
    TResult Function(ProfileLoaded value)? loaded,
    TResult Function(ProfileEmpty value)? empty,
    TResult Function(ProfileError value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class ProfileEmpty implements ProfileState {
  const factory ProfileEmpty() = _$ProfileEmptyImpl;
}

/// @nodoc
abstract class _$$ProfileErrorImplCopyWith<$Res> {
  factory _$$ProfileErrorImplCopyWith(
          _$ProfileErrorImpl value, $Res Function(_$ProfileErrorImpl) then) =
      __$$ProfileErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ProfileErrorImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileErrorImpl>
    implements _$$ProfileErrorImplCopyWith<$Res> {
  __$$ProfileErrorImplCopyWithImpl(
      _$ProfileErrorImpl _value, $Res Function(_$ProfileErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ProfileErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProfileErrorImpl implements ProfileError {
  const _$ProfileErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ProfileState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileErrorImplCopyWith<_$ProfileErrorImpl> get copyWith =>
      __$$ProfileErrorImplCopyWithImpl<_$ProfileErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Passport> passports) loaded,
    required TResult Function() empty,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Passport> passports)? loaded,
    TResult? Function()? empty,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Passport> passports)? loaded,
    TResult Function()? empty,
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
    required TResult Function(ProfileInitial value) initial,
    required TResult Function(ProfileLoading value) loading,
    required TResult Function(ProfileLoaded value) loaded,
    required TResult Function(ProfileEmpty value) empty,
    required TResult Function(ProfileError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileInitial value)? initial,
    TResult? Function(ProfileLoading value)? loading,
    TResult? Function(ProfileLoaded value)? loaded,
    TResult? Function(ProfileEmpty value)? empty,
    TResult? Function(ProfileError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileInitial value)? initial,
    TResult Function(ProfileLoading value)? loading,
    TResult Function(ProfileLoaded value)? loaded,
    TResult Function(ProfileEmpty value)? empty,
    TResult Function(ProfileError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ProfileError implements ProfileState {
  const factory ProfileError(final String message) = _$ProfileErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ProfileErrorImplCopyWith<_$ProfileErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}