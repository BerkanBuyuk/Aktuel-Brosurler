import 'dart:io';

import 'package:aktuel_brosurler/Model/Marketler.dart';
import 'package:aktuel_brosurler/Model/MarketlerCevap.dart';
import 'package:aktuel_brosurler/TabsS%C4%B1n%C4%B1flar%C4%B1/MarketBrosuru.dart';
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
    var url = Uri.parse("http://10.0.2.2/marketler/tum_marketler.php");
    var cevap = await http.get(url);
    return parseNotlarCevap(cevap.body);
  }



  @override
  Widget build(BuildContext context) {


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
        var market = marketlerListesi[indeks];
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MarketBrosuru(marketin_adi: market.market_adi)));
          },
          child: Card(
            child: SizedBox(
              height: ekranYuksekligi/9,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: ekranGenisligi/3,
                        height: ekranYuksekligi/10,
                        child: Image.network("http://10.0.2.2/marketler/resimler/${market.market_resim}"),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(market.market_adi, style: TextStyle(fontWeight: FontWeight.bold),),
                          Spacer(),
                          Text(market.aciklama),
                          Spacer(),
                          Text(market.sayfa_sayisi),
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
