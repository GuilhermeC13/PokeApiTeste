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

  late final _$pokemonsAtom =
      Atom(name: '_PokemonsStoreBase.pokemons', context: context);

  @override
  List<PokemonEntity> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(List<PokemonEntity> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  late final _$offSetAtom =
      Atom(name: '_PokemonsStoreBase.offSet', context: context);

  @override
  int get offSet {
    _$offSetAtom.reportRead();
    return super.offSet;
  }

  @override
  set offSet(int value) {
    _$offSetAtom.reportWrite(value, super.offSet, () {
      super.offSet = value;
    });
  }

  late final _$getPokemonsAsyncAction =
      AsyncAction('_PokemonsStoreBase.getPokemons', context: context);

  @override
  ObservableFuture getPokemons() {
    return ObservableFuture(
        _$getPokemonsAsyncAction.run(() => super.getPokemons()));
  }

  @override
  String toString() {
    return '''
pokemons: ${pokemons},
offSet: ${offSet},
isLastPage: ${isLastPage},
error: ${error}
    ''';
  }
}
