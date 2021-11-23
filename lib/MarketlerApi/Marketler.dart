class Marketler {
  String market_id;
  String market_adi;
  String aciklama;
  String sayfa_sayisi;


  Marketler(this.market_id, this.market_adi, this.aciklama, this.sayfa_sayisi);

  factory Marketler.fromJson(Map<String, dynamic> json){
    return Marketler(
        json["market_id"] as String,
        json["market_adi"] as String,
        json["aciklama"] as String,
        json["sayfa_sayisi"] as String
    );
  }
}