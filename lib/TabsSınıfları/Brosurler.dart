import 'package:aktuel_brosurler/NotlarApi/Notlar.dart';
import 'package:aktuel_brosurler/NotlarApi/NotlarCevap.dart';
import 'package:aktuel_brosurler/TabsS%C4%B1n%C4%B1flar%C4%B1/BrosurlerList.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;



class Brosurler extends StatefulWidget {
  const Brosurler({Key? key}) : super(key: key);

  @override
  _BrosurlerState createState() => _BrosurlerState();
}

class _BrosurlerState extends State<Brosurler> {

  List<Notlar> parseNotlarCevap(String cevap){
    return NotlarCevap.fromJson(json.decode(cevap)).notlarListesi;
  }

  Future<List<Notlar>> tumNotlarGoster() async {
    var url = Uri.parse("https://raw.githubusercontent.com/BerkanBuyuk/notlar/main/tum_notlar1.php");
    var cevap = await http.get(url);
    return parseNotlarCevap(cevap.body);
  }

  @override
  Widget build(BuildContext context) {
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
                onTap: (){

                },
                child: Card(
                  child: SizedBox(height: 50,
                    child: Row(
                      children: [
                        Text(not.ders_adi),
                        Text(not.not1),
                        Text(not.not2),
                      ],
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













