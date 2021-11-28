class Yonetmenler {
  String yonetmen_id;
  String yonetmen_ad;

  Yonetmenler(this.yonetmen_id, this.yonetmen_ad);

  factory Yonetmenler.fromJson(Map<String,dynamic> json){
    return Yonetmenler(json["aciklama_id"] as String, json["aciklama_ad"] as String);
  }
}