
import 'package:aktuel_brosurler/NotlarApi/Notlar.dart';
import 'package:aktuel_brosurler/NotlarApi/NotlarCevap.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class BrosurlerList extends StatefulWidget {
  const BrosurlerList({Key? key}) : super(key: key);


  @override
  _BrosurlerListState createState() => _BrosurlerListState();
}

class _BrosurlerListState extends State<BrosurlerList> {

  List<Notlar> parseNotlarCevap(String cevap){
    return NotlarCevap.fromJson(json.decode(cevap)).notlarListesi;
  }

  Future<List<Notlar>> tumNotlarGoster() async {
    var url = Uri.parse("https://raw.githubusercontent.com/BerkanBuyuk/Aktuel-Brosurler/master/api.json?token=ATUAH2RGY5ZT5KMQ243KYZLBUZM2K");
    var cevap = await http.get(url);
    return parseNotlarCevap(cevap.body);
  }


  @override
  Widget build(BuildContext context) {

    final urlBim = 'https://upload.wikimedia.org/wikipedia/commons/3/30/Logo_of_B%C4%B0M.PNG';


    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return FutureBuilder<List<Notlar>>(
        future: tumNotlarGoster(),
    builder: (context, snapshot){
    if(snapshot.hasData){
    var notlarListesi = snapshot.data;
    return ListView.builder(
      itemCount: notlarListesi!.length,
      itemBuilder: (context, indeks){
        var not = notlarListesi[indeks];
        return GestureDetector(
          onTap: (){},
          child: Card(
            child: SizedBox(
              height: ekranYuksekligi/9,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.network(urlBim),
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
        child: Text("Veri gelmedi"),
          );
        }
      },
    );
  }
}
