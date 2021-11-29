import 'package:aktuel_brosurler/Models/DetaySayfa.dart';
import 'package:aktuel_brosurler/Models/Brosurler.dart';
import 'package:aktuel_brosurler/Models/BrosurlerCevap.dart';
import 'package:aktuel_brosurler/Models/Kategoriler.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BrosurlerSayfa extends StatefulWidget {
  Kategoriler kategori;

  BrosurlerSayfa({required this.kategori,});

  @override
  _BrosurlerSayfaState createState() => _BrosurlerSayfaState();
}

class _BrosurlerSayfaState extends State<BrosurlerSayfa> {

  List<Brosurler> parseBrosurlerCevap(String cevap){
    return BrosurlerCevap.fromJson(json.decode(cevap)).brosurlerListesi;
  }

  Future<List<Brosurler>> brosurleriGoster(int kategori_id) async {
    var url = Uri.parse("http://10.0.2.2/aktuel/brosurler_by_kategori_id.php");
    var veri = {"kategori_id":kategori_id.toString()};
    var cevap = await http.post(url,body: veri);
    return parseBrosurlerCevap(cevap.body);
  }

  @override
  Widget build(BuildContext context) {


    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;


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
            return ListView.builder(
              itemCount: brosurlerListesi!.length,
              itemBuilder: (context,indeks){
                var brosur = brosurlerListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(brosur: brosur ,)));
                  },
                  child: Card(
                    child: SizedBox(
                      height: ekranYuksekligi/8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                            width: ekranGenisligi/3,
                            height: ekranYuksekligi/10,
                            child: Image.network(
                              "http://10.0.2.2/aktuel/resimler/brosurler/${brosur.brosur_resim}",
                              fit: BoxFit.cover,
                            ),
                        ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(brosur.brosur_ad,style: TextStyle(
                                  fontSize: 18.6,
                                  fontFamily: 'LobsterRegular',
                                  color: Colors.red,
                                  ),
                                 ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
