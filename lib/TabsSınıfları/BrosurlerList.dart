import 'package:aktuel_brosurler/MarketlerApi/Marketler.dart';
import 'package:aktuel_brosurler/MarketlerApi/MarketlerCevap.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class BrosurlerList extends StatefulWidget {
  const BrosurlerList({Key? key}) : super(key: key);

  @override
  _BrosurlerListState createState() => _BrosurlerListState();
}

class _BrosurlerListState extends State<BrosurlerList> {

  List<Marketler> parseNotlarCevap(String cevap){
    return MarketlerCevap.fromJson(json.decode(cevap)).marketlerListesi;
  }

  Future<List<Marketler>> tumMarketleriGoster() async {
    var url = Uri.parse("https://raw.githubusercontent.com/BerkanBuyuk/Aktuel-Brosurler/master/api.json?token=ATUAH2RQT5Q223OHF3WOLN3BUZRRM");
    var cevap = await http.get(url);
    return parseNotlarCevap(cevap.body);
  }


  @override
  Widget build(BuildContext context) {

    final urlBim = 'https://upload.wikimedia.org/wikipedia/commons/3/30/Logo_of_B%C4%B0M.PNG';
    final urlA101 = 'https://upload.wikimedia.org/wikipedia/commons/b/bd/A101_LOGO.jpg';


    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return FutureBuilder<List<Marketler>>(
        future: tumMarketleriGoster(),
    builder: (context, snapshot){
    if(snapshot.hasData){
    var marketlerListesi = snapshot.data;
    return ListView.builder(
      itemCount: marketlerListesi!.length,
      itemBuilder: (context, indeks){
        var not = marketlerListesi[indeks];
        return GestureDetector(
          onTap: (){},
          child: Card(
            child: SizedBox(
              height: ekranYuksekligi/9,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.network(urlA101),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(not.market_adi, style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(not.aciklama),
                          Text(not.sayfa_sayisi),
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
    );
  }
}
