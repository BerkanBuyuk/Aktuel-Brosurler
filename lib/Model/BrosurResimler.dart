class BrosurResimler{
  String brosur_resim_id;
  String brosur_resim;
  String aktif;

  BrosurResimler(this.brosur_resim_id, this.brosur_resim, this.aktif);

  factory BrosurResimler.fromJson(Map<String, dynamic> json){
    return BrosurResimler(
      json["brosur_resim_id"] as String,
      json["brosur_resim"] as String,
      json["aktif"] as String,
    );
  }
}