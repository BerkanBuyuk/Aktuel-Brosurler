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


    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;

    return FutureBuilder<List<Kategoriler>>(
      future: tumKategorileriGoster(),
      builder: (context,snapshot){
        if(snapshot.hasData){
          var kategorilerListesi = snapshot.data;
          return ListView.builder(
            itemCount: kategorilerListesi!.length,
            itemBuilder: (context,indeks){
              var kategori = kategorilerListesi[indeks];
              return SizedBox(
                height: ekranYuksekligi,
                child: Card(
                  child: Center(
                    child: WebView(
                      initialUrl: "${kategori.kategori_web}",
                      javascriptMode: JavascriptMode.unrestricted,
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