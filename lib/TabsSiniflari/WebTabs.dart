import 'package:aktuel_brosurler/Models/Kategoriler.dart';
import 'package:aktuel_brosurler/Models/KategorilerCevap.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

class WebTabs extends StatefulWidget {
  const WebTabs({Key? key}) : super(key: key);

  @override
  _WebTabsState createState() => _WebTabsState();
}

class _WebTabsState extends State<WebTabs> {

  List<Kategoriler> parseKategorilerCevap(String cevap){
    return KategorilerCevap.fromJson(json.decode(cevap)).kategorilerListesi;
  }

  Future<List<Kategoriler>> tumKategorileriGoster() async {
    var url = Uri.parse("http://10.0.2.2/aktuel/tum_kategoriler.php");
    var cevap = await http.get(url);
    return parseKategorilerCevap(cevap.body);
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Kategoriler>>(
      future: tumKategorileriGoster(),
      builder: (context,snapshot){
        if(snapshot.hasData){
          var kategorilerListesi = snapshot.data;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3.5,
            ),
            itemCount: kategorilerListesi!.length,
            itemBuilder: (context,indeks){
              var kategori = kategorilerListesi[indeks];
              return Card(
                child: Center(
                  child: WebView(
                    initialUrl: "${kategori.kategori_web}",
                    javascriptMode: JavascriptMode.unrestricted,
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