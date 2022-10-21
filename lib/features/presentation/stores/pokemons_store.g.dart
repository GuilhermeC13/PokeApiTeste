// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemons_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonsStore on _PokemonsStoreBase, Store {
  Computed<bool>? _$isLastPageComputed;

  @override
  bool get isLastPage =>
      (_$isLastPageComputed ??= Computed<bool>(() => super.isLastPage,
              name: '_PokemonsStoreBase.isLastPage'))
          .value;
  Computed<bool>? _$errorComputed;

  @override
  bool get error => (_$errorComputed ??=
          Computed<bool>(() => super.error, name: '_PokemonsStoreBase.error'))
      .value;

  late final _$getPokemonsAsyncAction =
      AsyncAction('_PokemonsStoreBase.getPokemons', context: context);

  @override
  Future<List<PokemonEntity>> getPokemons(int offSet) {
    return _$getPokemonsAsyncAction.run(() => super.getPokemons(offSet));
  }

  @override
  String toString() {
    return '''
isLastPage: ${isLastPage},
error: ${error}
    ''';
  }
}
