import 'package:aktuel_brosurler/Model/Marketler.dart';

class MarketlerCevap {
  int success;
  List<Marketler> marketlerListesi;

  MarketlerCevap(this.success, this.marketlerListesi);

  factory MarketlerCevap.fromJson(Map<String, dynamic> json){
    var jsonArray = json["marketler"] as List;
    List<Marketler> notlarListesi = jsonArray.map((jsonArrayNesnesi) => Marketler.fromJson(jsonArrayNesnesi)).toList();

    return MarketlerCevap(json["success"] as int, notlarListesi);
  }
}