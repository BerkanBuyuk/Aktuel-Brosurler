import 'package:aktuel_brosurler/Models/Kategoriler.dart';
import 'package:aktuel_brosurler/Models/Yonetmenler.dart';

class Filmler {
  String film_id;
  String film_ad;
  String film_yil;
  String film_resim;
  Kategoriler kategori;
  Yonetmenler yonetmen;

  Filmler(this.film_id, this.film_ad, this.film_yil, this.film_resim,
      this.kategori, this.yonetmen);

  factory Filmler.fromJson(Map<String,dynamic> json){
    return Filmler(
        json["brosur_id"] as String,
        json["brosur_ad"] as String,
        json["brosur_yil"] as String,
        json["brosur_resim"] as String,
        Kategoriler.fromJson(json["kategori"]),
        Yonetmenler.fromJson(json["aciklama"]));
  }
}