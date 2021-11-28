class Kategoriler {
  String kategori_id;
  String kategori_ad;
  String kategori_resim;

  Kategoriler(this.kategori_id, this.kategori_ad, this.kategori_resim);

  factory Kategoriler.fromJson(Map<String,dynamic> json){
    return Kategoriler(
        json["kategori_id"] as String,
        json["kategori_ad"] as String,
        json["kategori_resim"] as String,
    );
  }
}