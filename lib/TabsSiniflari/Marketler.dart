import 'package:aktuel_brosurler/Models/BrosurlerSayfa.dart';
import 'package:aktuel_brosurler/Models/Kategoriler.dart';
import 'package:aktuel_brosurler/Models/KategorilerCevap.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class Marketler extends StatefulWidget {
  const Marketler({Key? key}) : super(key: key);

  @override
  _MarketlerState createState() => _MarketlerState();
}

class _MarketlerState extends State<Marketler> {

  List<Kategoriler> parseKategorilerCevap(String cevap){
    return KategorilerCevap.fromJson(json.decode(cevap)).kategorilerListesi;
  }

  Future<List<Kategoriler>> tumKategorileriGoster() async {
    var url = Uri.parse("http://10.0.2.2/aktuel/tum_kategoriler.php");
    var cevap = await http.get(url);
    return parseKategorilerCevap(cevap.body);
  }


  bool bimFavoriMi = false;
  bool a101FavoriMi = false;
  bool sokFavoriMi = false;
  bool migrosFavoriMi = false;
  bool carrefourFavoriMi = false;

  bool bimBildirim = false;
  bool a101Bildirim = false;
  bool sokBildirim = false;
  bool migrosBildirim = false;
  bool carrefourBildirim = false;



  @override
  Widget build(BuildContext context) {


    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;


    return FutureBuilder<List<Kategoriler>>(
      future: tumKategorileriGoster(),
      builder: (context,snapshot){
        if(snapshot.hasData){
          var kategoriListesi = snapshot.data;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2 / 3.5,
            ),
            itemCount: kategoriListesi!.length,
            itemBuilder: (context,indeks){
              var kategori = kategoriListesi[indeks];
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BrosurlerSayfa(kategori: kategori,)));
                },
                child: Card(
                  child: SizedBox(
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Spacer(),
                        Image.network("http://10.0.2.2/aktuel/resimler/marketler/${kategori.kategori_resim}"),
                        Spacer(),
                        Text(kategori.kategori_ad, style: TextStyle(
                          fontFamily: 'LobsterRegular',
                          fontSize: 25,
                          color: Colors.red,
                        ),),
                        Spacer(),

                      ],
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
    );

  }
}
