import 'package:aktuel_brosurler/Models/Kategoriler.dart';
import 'package:aktuel_brosurler/Models/Aciklamalar.dart';

class Brosurler {
  String brosur_id;
  String brosur_ad;
  String brosur_yil;
  String brosur_resim;
  Kategoriler kategori;
  Aciklamalar aciklama;

  Brosurler(
      this.brosur_id,
      this.brosur_ad,
      this.brosur_yil,
      this.brosur_resim,
      this.kategori,
      this.aciklama,
      );

  factory Brosurler.fromJson(Map<String,dynamic> json){
    return Brosurler(
        json["brosur_id"] as String,
        json["brosur_ad"] as String,
        json["brosur_yil"] as String,
        json["brosur_resim"] as String,
        Kategoriler.fromJson(json["kategori"]),
        Aciklamalar.fromJson(json["aciklama"]));
  }
}