class FilmResimler{
  String film_resim_id;
  String birinci_resim;
  String ikinci_resim;
  String ucuncu_resim;

  FilmResimler(this.film_resim_id, this.birinci_resim, this.ikinci_resim,
      this.ucuncu_resim);

  factory FilmResimler.fromJson(Map<String, dynamic> json){
    return FilmResimler(
      json["film_resim_id"],
      json["birinci_resim"],
      json["ikinci_resim"],
      json["ucuncu_resim"],
    );
  }
}