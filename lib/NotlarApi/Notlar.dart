class Notlar {
  String not_id;
  String ders_adi;
  String not1;
  String not2;

  Notlar(this.not_id, this.ders_adi, this.not1, this.not2);

  factory Notlar.fromJson(Map<String, dynamic> json){
    return Notlar(
        json["not_id"] as String,
        json["ders_adi"] as String,
        json["not1"] as String,
        json["not2"] as String
    );
  }
}