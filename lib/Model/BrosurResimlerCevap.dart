import 'package:aktuel_brosurler/Model/BrosurResimler.dart';

class BrosurResimlerCevap{
  int success;
  List<BrosurResimler> brosurResimlerListesi;

  BrosurResimlerCevap(this.success, this.brosurResimlerListesi);

  factory BrosurResimlerCevap.fromJson(Map<String, dynamic> json){
    var jsonArray = json["brosur_resimler"] as List;
    List<BrosurResimler> marketlerListesi = jsonArray.map((jsonArrayNesnesi) => BrosurResimler.fromJson(jsonArrayNesnesi)).toList();

    return BrosurResimlerCevap(json["success"] as int, marketlerListesi);
  }
}