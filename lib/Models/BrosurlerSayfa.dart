import 'package:aktuel_brosurler/Models/DetaySayfa.dart';
import 'package:aktuel_brosurler/Models/Brosurler.dart';
import 'package:aktuel_brosurler/Models/BrosurlerCevap.dart';
import 'package:aktuel_brosurler/Models/Kategoriler.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BrosurlerSayfa extends StatefulWidget {
  Kategoriler kategori;

  BrosurlerSayfa({required this.kategori});

  @override
  _BrosurlerSayfaState createState() => _BrosurlerSayfaState();
}

class _BrosurlerSayfaState extends State<BrosurlerSayfa> {

  List<Brosurler> parseBrosurlerCevap(String cevap){
    return BrosurlerCevap.fromJson(json.decode(cevap)).brosurlerListesi;
  }

  Future<List<Brosurler>> brosurleriGoster(int kategori_id) async {
    var url = Uri.parse("http://10.0.2.2/aktuel/filmler_by_kategori_id.php");
    var veri = {"kategori_id":kategori_id.toString()};
    var cevap = await http.post(url,body: veri);
    return parseBrosurlerCevap(cevap.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.kategori.kategori_ad} Broşürleri"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Brosurler>>(
        future: brosurleriGoster(int.parse(widget.kategori.kategori_id)),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var brosurlerListesi = snapshot.data;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3.5,
              ),
              itemCount: brosurlerListesi!.length,
              itemBuilder: (context,indeks){
                var brosur = brosurlerListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(brosur: brosur ,)));
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network("http://10.0.2.2/aktuel/resimler/brosurler/${brosur.brosur_resim}"),
                        ),
                        Text(brosur.brosur_ad,style: TextStyle(
                            fontSize: 18.6,
                            fontFamily: 'LobsterRegular',
                            color: Colors.red,
                        ),),
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            );
          }
        },
      ),

    );
  }
}
