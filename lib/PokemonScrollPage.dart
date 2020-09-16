import 'package:flutter/material.dart';
import 'package:flutter_pokemon_app/pokemon_model.dart';

class PokemonScrollPage extends StatelessWidget {
  final List<Pokemon> pokemon;
  PokemonScrollPage({@required this.pokemon});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: pokemon.length,
        itemBuilder:(BuildContext context, int index){
          return new Padding(
            padding: const EdgeInsets.all(2.0),
            child: new InkWell(
              child: new Card(
                elevation: 3.0,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Container(
                      height: 100.0,
                      width: 100.0,
                      child: new FadeInImage(
                            placeholder: new NetworkImage('https://blog.stylingandroid.com/wp-content/themes/lontano-pro/images/no-image-slide.png'),
                            image: new NetworkImage(pokemon[index].getPosterImg()),
                        ),
                    ),
                    new Text(
                      pokemon[index].name,
                      style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
