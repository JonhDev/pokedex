// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SearchPageStateTearOff {
  const _$SearchPageStateTearOff();

  _SearchPageState call(
      {SearchState state = SearchState.emptyContent,
      String search = '',
      List<Pokemon> pokemonList = const <Pokemon>[]}) {
    return _SearchPageState(
      state: state,
      search: search,
      pokemonList: pokemonList,
    );
  }
}

/// @nodoc
const $SearchPageState = _$SearchPageStateTearOff();

/// @nodoc
mixin _$SearchPageState {
  SearchState get state => throw _privateConstructorUsedError;
  String get search => throw _privateConstructorUsedError;
  List<Pokemon> get pokemonList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchPageStateCopyWith<SearchPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchPageStateCopyWith<$Res> {
  factory $SearchPageStateCopyWith(
          SearchPageState value, $Res Function(SearchPageState) then) =
      _$SearchPageStateCopyWithImpl<$Res>;
  $Res call({SearchState state, String search, List<Pokemon> pokemonList});
}

/// @nodoc
class _$SearchPageStateCopyWithImpl<$Res>
    implements $SearchPageStateCopyWith<$Res> {
  _$SearchPageStateCopyWithImpl(this._value, this._then);

  final SearchPageState _value;
  // ignore: unused_field
  final $Res Function(SearchPageState) _then;

  @override
  $Res call({
    Object? state = freezed,
    Object? search = freezed,
    Object? pokemonList = freezed,
  }) {
    return _then(_value.copyWith(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as SearchState,
      search: search == freezed
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      pokemonList: pokemonList == freezed
          ? _value.pokemonList
          : pokemonList // ignore: cast_nullable_to_non_nullable
              as List<Pokemon>,
    ));
  }
}

/// @nodoc
abstract class _$SearchPageStateCopyWith<$Res>
    implements $SearchPageStateCopyWith<$Res> {
  factory _$SearchPageStateCopyWith(
          _SearchPageState value, $Res Function(_SearchPageState) then) =
      __$SearchPageStateCopyWithImpl<$Res>;
  @override
  $Res call({SearchState state, String search, List<Pokemon> pokemonList});
}

/// @nodoc
class __$SearchPageStateCopyWithImpl<$Res>
    extends _$SearchPageStateCopyWithImpl<$Res>
    implements _$SearchPageStateCopyWith<$Res> {
  __$SearchPageStateCopyWithImpl(
      _SearchPageState _value, $Res Function(_SearchPageState) _then)
      : super(_value, (v) => _then(v as _SearchPageState));

  @override
  _SearchPageState get _value => super._value as _SearchPageState;

  @override
  $Res call({
    Object? state = freezed,
    Object? search = freezed,
    Object? pokemonList = freezed,
  }) {
    return _then(_SearchPageState(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as SearchState,
      search: search == freezed
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      pokemonList: pokemonList == freezed
          ? _value.pokemonList
          : pokemonList // ignore: cast_nullable_to_non_nullable
              as List<Pokemon>,
    ));
  }
}

/// @nodoc

class _$_SearchPageState implements _SearchPageState {
  const _$_SearchPageState(
      {this.state = SearchState.emptyContent,
      this.search = '',
      this.pokemonList = const <Pokemon>[]});

  @JsonKey()
  @override
  final SearchState state;
  @JsonKey()
  @override
  final String search;
  @JsonKey()
  @override
  final List<Pokemon> pokemonList;

  @override
  String toString() {
    return 'SearchPageState(state: $state, search: $search, pokemonList: $pokemonList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchPageState &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.search, search) &&
            const DeepCollectionEquality()
                .equals(other.pokemonList, pokemonList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(search),
      const DeepCollectionEquality().hash(pokemonList));

  @JsonKey(ignore: true)
  @override
  _$SearchPageStateCopyWith<_SearchPageState> get copyWith =>
      __$SearchPageStateCopyWithImpl<_SearchPageState>(this, _$identity);
}

abstract class _SearchPageState implements SearchPageState {
  const factory _SearchPageState(
      {SearchState state,
      String search,
      List<Pokemon> pokemonList}) = _$_SearchPageState;

  @override
  SearchState get state;
  @override
  String get search;
  @override
  List<Pokemon> get pokemonList;
  @override
  @JsonKey(ignore: true)
  _$SearchPageStateCopyWith<_SearchPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
