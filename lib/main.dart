import 'package:flutter/material.dart';
import 'package:flutter_pokemon_app/pokemon_page.dart';

void main()=>runApp(new MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokemon',
      home: new PokemonPage(),
    );
  }
}
