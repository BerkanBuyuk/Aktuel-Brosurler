import 'package:aktuel_brosurler/TabsSiniflari/FilmResimler.dart';

class FilmResimlerCevap{
  int success;
  List<FilmResimler> filmResimlerListesi;


  FilmResimlerCevap(this.success, this.filmResimlerListesi);

  factory FilmResimlerCevap.fromJson(Map<String,dynamic> json){
    var jsonArray = json["film_resim"] as List;
    List<FilmResimler> kategorilerListesi = jsonArray.map((jsonArrayNesnesi) => FilmResimler.fromJson(jsonArrayNesnesi)).toList();
    return FilmResimlerCevap(json["success"] as int,kategorilerListesi);
  }
}