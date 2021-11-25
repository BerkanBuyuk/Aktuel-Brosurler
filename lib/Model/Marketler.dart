class Marketler {
  String market_id;
  String market_adi;
  String aciklama;
  String sayfa_sayisi;
  String market_resim;


  Marketler(this.market_id, this.market_adi, this.aciklama, this.sayfa_sayisi, this.market_resim);

  factory Marketler.fromJson(Map<String, dynamic> json){
    return Marketler(
        json["market_id"] as String,
        json["market_adi"] as String,
        json["aciklama"] as String,
        json["sayfa_sayisi"] as String,
        json["market_resim"] as String,
    );
  }
}