import 'package:aktuel_brosurler/Model/Brosurler.dart';

class BrosurlerCevap{
  int success;
  List<Brosurler> brosurlerListesi;

  BrosurlerCevap(this.success, this.brosurlerListesi);

  factory BrosurlerCevap.fromJson(Map<String, dynamic> json){
    var jsonArray = json["brosurler"] as List;
    List<Brosurler> marketlerListesi = jsonArray.map((jsonArrayNesnesi) => Brosurler.fromJson(jsonArrayNesnesi)).toList();

    return BrosurlerCevap(json["success"] as int, marketlerListesi);
  }
}