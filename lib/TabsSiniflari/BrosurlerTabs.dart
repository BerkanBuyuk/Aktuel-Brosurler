import 'package:aktuel_brosurler/Models/Brosurler.dart';
import 'package:aktuel_brosurler/Models/BrosurlerCevap.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class BrosurlerTabs extends StatefulWidget {
  //const BrosurlerTabs({Key? key}) : super(key: key);


  @override
  _BrosurlerTabsState createState() => _BrosurlerTabsState();
}

class _BrosurlerTabsState extends State<BrosurlerTabs> {

  List<Brosurler> parseBrosurlerCevap(String cevap){
    return BrosurlerCevap.fromJson(json.decode(cevap)).brosurlerListesi;
  }

  Future<List<Brosurler>> brosurleriGoster() async {
    var url = Uri.parse("http://10.0.2.2/aktuel/tum_brosurler.php");
    var cevap = await http.get(url);
    return parseBrosurlerCevap(cevap.body);
  }




  @override
  Widget build(BuildContext context) {


    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;


    return FutureBuilder<List<Brosurler>>(
      future: brosurleriGoster(),
      builder: (context,snapshot){
        if(snapshot.hasData){
          var brosurlerListesi = snapshot.data;
          return ListView.builder(
            itemCount: brosurlerListesi!.length,
            itemBuilder: (context,indeks){
              var brosur = brosurlerListesi[indeks];
              return GestureDetector(
                onTap: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(brosur: brosur ,)));
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
    );
  }
}
