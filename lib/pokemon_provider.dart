import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_pokemon_app/pokemon_model.dart';

class PokemonProvider{
  String _url = 'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  bool _cargando = false;
  List<Pokemon> _pokemones = new List();
  final _pokemonesStreamController = new StreamController<List<Pokemon>>.broadcast();

  Function(List<Pokemon>) get pokemonesSink => _pokemonesStreamController.sink.add;

  Stream<List<Pokemon>> get pokemonesStream => _pokemonesStreamController.stream;

  void disposeStreams(){
    _pokemonesStreamController?.close();
  }

  Future<List<Pokemon>> getPokemones() async{
    //if(_cargando)return[];
   // _cargando=true;
    final resp = await http.get(Uri.encodeFull(_url));
    //print(resp.body);
    final decodedData = json.decode(resp.body);
    //print(decodedData.toString());
    final pokemon = new Pokemones.fromJsonList(decodedData['pokemon']);
    _pokemones.addAll(pokemon.dataPokemon);
    pokemonesSink(_pokemones);
    //_cargando=false;
    return pokemon.dataPokemon;
  }
}