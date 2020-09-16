import 'package:flutter/material.dart';
import 'package:flutter_pokemon_app/PokemonScrollPage.dart';
import 'package:flutter_pokemon_app/pokemon_provider.dart';
class PokemonPage extends StatefulWidget {
  @override
  _PokemonPageState createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  final pokemonProvider = new PokemonProvider();
  @override
  Widget build(BuildContext context) {
    pokemonProvider.getPokemones();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Pokemon Data'),
        centerTitle: true,
        backgroundColor:Colors.cyan ,
      ),
      body: _pokemonList(),
    );
  }

  Widget _pokemonList() {
    /*pokemonProvider.getPokemones().then((pokemon)=>
      //print(pokemon);
      new Center(child: new Text(pokemon[0].name),)

    );*/
    return new StreamBuilder(
        stream: pokemonProvider.pokemonesStream ,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return new PokemonScrollPage(pokemon: snapshot.data,);
          }else{
            return new Center(child: new CircularProgressIndicator());
          }
        }
    );
  }
}
