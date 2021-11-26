class Brosurler{
  String brosur_id;
  String brosur_baslik;
  String baslangic_tarih;
  String bitis_tarih;
  String aktif;

  Brosurler(this.brosur_id, this.brosur_baslik, this.baslangic_tarih,
      this.bitis_tarih, this.aktif);

  factory Brosurler.fromJson(Map<String, dynamic> json){
    return Brosurler(
      json["brosur_id"] as String,
      json["brosur_baslik"] as String,
      json["baslangic_tarih"] as String,
      json["bitis_tarih"] as String,
      json["aktif"] as String,
    );
  }
}