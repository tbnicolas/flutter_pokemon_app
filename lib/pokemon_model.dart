class Pokemones{
  List<Pokemon> dataPokemon = new List();
  Pokemones();
  Pokemones.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null) return;
    jsonList.forEach((item){
      final pokemon = new Pokemon.fromJsonMap(item);
      dataPokemon.add(pokemon);
    });
  }

}
class Pokemon {
  int id;
  String num;
  String name;
  String img;
  String height;
  String weight;
  String candy;
  String spawnTime;
  List<double> multipliers;

  Pokemon({
    this.id,
    this.num,
    this.name,
    this.img,
    this.height,
    this.weight,
    this.candy,
    this.spawnTime,
    this.multipliers,
  });

  Pokemon.fromJsonMap(Map<String, dynamic> json){
    this.id           = json['id'];
    this.num          = json['num'];
    this.name         = json['name'];
    this.img          = json['img'];
    this.height       = json['height'];
    this.weight       = json['wight'];
    this.candy        = json['candy'];
    this.spawnTime    = json['spawn_time'];
    this.multipliers  = json['multiplers'];
  }
  getPosterImg() {
    if (img == null) {
      return 'https://cdn11.bigcommerce.com/s-7a906/stencil/46ff6970-3185-0138-f9d5-0242ac110013/e/23482910-3189-0138-58c5-0242ac110012/icons/icon-no-image.svg';
    } else {
      return img;
    }
  }
}