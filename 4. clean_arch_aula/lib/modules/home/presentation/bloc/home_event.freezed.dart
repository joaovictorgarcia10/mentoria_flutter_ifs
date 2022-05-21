// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeEventTearOff {
  const _$HomeEventTearOff();

  _$HomeEventBuscarEndereco buscarEndereco(
      {required BuscarEndrecoParams params}) {
    return _$HomeEventBuscarEndereco(
      params: params,
    );
  }

  _$HomeEventSaveEndereco saveEndereco({required EnderecoModel model}) {
    return _$HomeEventSaveEndereco(
      model: model,
    );
  }
}

/// @nodoc
const $HomeEvent = _$HomeEventTearOff();

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuscarEndrecoParams params) buscarEndereco,
    required TResult Function(EnderecoModel model) saveEndereco,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BuscarEndrecoParams params)? buscarEndereco,
    TResult Function(EnderecoModel model)? saveEndereco,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuscarEndrecoParams params)? buscarEndereco,
    TResult Function(EnderecoModel model)? saveEndereco,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$HomeEventBuscarEndereco value) buscarEndereco,
    required TResult Function(_$HomeEventSaveEndereco value) saveEndereco,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_$HomeEventBuscarEndereco value)? buscarEndereco,
    TResult Function(_$HomeEventSaveEndereco value)? saveEndereco,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$HomeEventBuscarEndereco value)? buscarEndereco,
    TResult Function(_$HomeEventSaveEndereco value)? saveEndereco,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res> implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  final HomeEvent _value;
  // ignore: unused_field
  final $Res Function(HomeEvent) _then;
}

/// @nodoc
abstract class _$$HomeEventBuscarEnderecoCopyWith<$Res> {
  factory _$$HomeEventBuscarEnderecoCopyWith(_$HomeEventBuscarEndereco value,
          $Res Function(_$HomeEventBuscarEndereco) then) =
      __$$HomeEventBuscarEnderecoCopyWithImpl<$Res>;
  $Res call({BuscarEndrecoParams params});
}

/// @nodoc
class __$$HomeEventBuscarEnderecoCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res>
    implements _$$HomeEventBuscarEnderecoCopyWith<$Res> {
  __$$HomeEventBuscarEnderecoCopyWithImpl(_$HomeEventBuscarEndereco _value,
      $Res Function(_$HomeEventBuscarEndereco) _then)
      : super(_value, (v) => _then(v as _$HomeEventBuscarEndereco));

  @override
  _$HomeEventBuscarEndereco get _value =>
      super._value as _$HomeEventBuscarEndereco;

  @override
  $Res call({
    Object? params = freezed,
  }) {
    return _then(_$HomeEventBuscarEndereco(
      params: params == freezed
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as BuscarEndrecoParams,
    ));
  }
}

/// @nodoc

class _$_$HomeEventBuscarEndereco implements _$HomeEventBuscarEndereco {
  const _$_$HomeEventBuscarEndereco({required this.params});

  @override
  final BuscarEndrecoParams params;

  @override
  String toString() {
    return 'HomeEvent.buscarEndereco(params: $params)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeEventBuscarEndereco &&
            const DeepCollectionEquality().equals(other.params, params));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(params));

  @JsonKey(ignore: true)
  @override
  _$$HomeEventBuscarEnderecoCopyWith<_$HomeEventBuscarEndereco> get copyWith =>
      __$$HomeEventBuscarEnderecoCopyWithImpl<_$HomeEventBuscarEndereco>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuscarEndrecoParams params) buscarEndereco,
    required TResult Function(EnderecoModel model) saveEndereco,
  }) {
    return buscarEndereco(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BuscarEndrecoParams params)? buscarEndereco,
    TResult Function(EnderecoModel model)? saveEndereco,
  }) {
    return buscarEndereco?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuscarEndrecoParams params)? buscarEndereco,
    TResult Function(EnderecoModel model)? saveEndereco,
    required TResult orElse(),
  }) {
    if (buscarEndereco != null) {
      return buscarEndereco(params);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$HomeEventBuscarEndereco value) buscarEndereco,
    required TResult Function(_$HomeEventSaveEndereco value) saveEndereco,
  }) {
    return buscarEndereco(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_$HomeEventBuscarEndereco value)? buscarEndereco,
    TResult Function(_$HomeEventSaveEndereco value)? saveEndereco,
  }) {
    return buscarEndereco?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$HomeEventBuscarEndereco value)? buscarEndereco,
    TResult Function(_$HomeEventSaveEndereco value)? saveEndereco,
    required TResult orElse(),
  }) {
    if (buscarEndereco != null) {
      return buscarEndereco(this);
    }
    return orElse();
  }
}

abstract class _$HomeEventBuscarEndereco implements HomeEvent {
  const factory _$HomeEventBuscarEndereco(
      {required BuscarEndrecoParams params}) = _$_$HomeEventBuscarEndereco;

  BuscarEndrecoParams get params;
  @JsonKey(ignore: true)
  _$$HomeEventBuscarEnderecoCopyWith<_$HomeEventBuscarEndereco> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeEventSaveEnderecoCopyWith<$Res> {
  factory _$$HomeEventSaveEnderecoCopyWith(_$HomeEventSaveEndereco value,
          $Res Function(_$HomeEventSaveEndereco) then) =
      __$$HomeEventSaveEnderecoCopyWithImpl<$Res>;
  $Res call({EnderecoModel model});
}

/// @nodoc
class __$$HomeEventSaveEnderecoCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res>
    implements _$$HomeEventSaveEnderecoCopyWith<$Res> {
  __$$HomeEventSaveEnderecoCopyWithImpl(_$HomeEventSaveEndereco _value,
      $Res Function(_$HomeEventSaveEndereco) _then)
      : super(_value, (v) => _then(v as _$HomeEventSaveEndereco));

  @override
  _$HomeEventSaveEndereco get _value => super._value as _$HomeEventSaveEndereco;

  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_$HomeEventSaveEndereco(
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as EnderecoModel,
    ));
  }
}

/// @nodoc

class _$_$HomeEventSaveEndereco implements _$HomeEventSaveEndereco {
  const _$_$HomeEventSaveEndereco({required this.model});

  @override
  final EnderecoModel model;

  @override
  String toString() {
    return 'HomeEvent.saveEndereco(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeEventSaveEndereco &&
            const DeepCollectionEquality().equals(other.model, model));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(model));

  @JsonKey(ignore: true)
  @override
  _$$HomeEventSaveEnderecoCopyWith<_$HomeEventSaveEndereco> get copyWith =>
      __$$HomeEventSaveEnderecoCopyWithImpl<_$HomeEventSaveEndereco>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuscarEndrecoParams params) buscarEndereco,
    required TResult Function(EnderecoModel model) saveEndereco,
  }) {
    return saveEndereco(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BuscarEndrecoParams params)? buscarEndereco,
    TResult Function(EnderecoModel model)? saveEndereco,
  }) {
    return saveEndereco?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuscarEndrecoParams params)? buscarEndereco,
    TResult Function(EnderecoModel model)? saveEndereco,
    required TResult orElse(),
  }) {
    if (saveEndereco != null) {
      return saveEndereco(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$HomeEventBuscarEndereco value) buscarEndereco,
    required TResult Function(_$HomeEventSaveEndereco value) saveEndereco,
  }) {
    return saveEndereco(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_$HomeEventBuscarEndereco value)? buscarEndereco,
    TResult Function(_$HomeEventSaveEndereco value)? saveEndereco,
  }) {
    return saveEndereco?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$HomeEventBuscarEndereco value)? buscarEndereco,
    TResult Function(_$HomeEventSaveEndereco value)? saveEndereco,
    required TResult orElse(),
  }) {
    if (saveEndereco != null) {
      return saveEndereco(this);
    }
    return orElse();
  }
}

abstract class _$HomeEventSaveEndereco implements HomeEvent {
  const factory _$HomeEventSaveEndereco({required EnderecoModel model}) =
      _$_$HomeEventSaveEndereco;

  EnderecoModel get model;
  @JsonKey(ignore: true)
  _$$HomeEventSaveEnderecoCopyWith<_$HomeEventSaveEndereco> get copyWith =>
      throw _privateConstructorUsedError;
}
