class Aciklamalar {
  String aciklama_id;
  String aciklama_ad;

  Aciklamalar(
      this.aciklama_id,
      this.aciklama_ad,
      );

  factory Aciklamalar.fromJson(Map<String,dynamic> json){
    return Aciklamalar(
        json["aciklama_id"] as String,
        json["aciklama_ad"] as String,
    );
  }
}