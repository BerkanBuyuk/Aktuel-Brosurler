import 'package:aktuel_brosurler/Models/BrosurlerSayfa.dart';
import 'package:aktuel_brosurler/Models/Kategoriler.dart';
import 'package:aktuel_brosurler/Models/KategorilerCevap.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MarketlerTabs extends StatefulWidget {
  const MarketlerTabs({Key? key}) : super(key: key);

  @override
  _MarketlerTabsState createState() => _MarketlerTabsState();
}

class _MarketlerTabsState extends State<MarketlerTabs> {

  List<Kategoriler> parseKategorilerCevap(String cevap){
    return KategorilerCevap.fromJson(json.decode(cevap)).kategorilerListesi;
  }

  Future<List<Kategoriler>> tumKategorileriGoster() async {
    var url = Uri.parse("http://10.0.2.2/aktuel/tum_kategoriler.php");
    var cevap = await http.get(url);
    return parseKategorilerCevap(cevap.body);
  }


  bool bimBildirim = false;
  bool a101Bildirim = false;
  bool sokBildirim = false;
  bool migrosBildirim = false;
  bool carrefourBildirim = false;
  bool metroBildirim = false;
  bool kimBildirim = false;
  bool onurBildirim = false;
  bool fileBildirim = false;


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

                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: ekranGenisligi/10,
                              height: ekranYuksekligi/20,
                              child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {

                                    if(kategori.kategori_ad == "Bim"){
                                      bimBildirim = !bimBildirim;

                                      if(bimBildirim == true){
                                        Fluttertoast.showToast(
                                          msg: "${kategori.kategori_ad} Bildirimleri Açık",
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                        );
                                      }

                                      if(bimBildirim == false){
                                        Fluttertoast.showToast(
                                          msg: "${kategori.kategori_ad} Bildirimleri Kapalı",
                                          backgroundColor: Colors.red,
                                          textColor: Colors.black,
                                          fontSize: 16.0,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                        );
                                      }
                                    }


                                    if(kategori.kategori_ad == "A101"){
                                      a101Bildirim = !a101Bildirim;

                                      if(a101Bildirim == true){
                                        Fluttertoast.showToast(
                                          msg: "${kategori.kategori_ad} Bildirimleri Açık",
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                        );
                                      }

                                      if(a101Bildirim == false){
                                        Fluttertoast.showToast(
                                          msg: "${kategori.kategori_ad} Bildirimleri Kapalı",
                                          backgroundColor: Colors.red,
                                          textColor: Colors.black,
                                          fontSize: 16.0,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                        );
                                      }
                                    }

                                    if(kategori.kategori_ad == "Şok"){
                                      sokBildirim = !sokBildirim;

                                      if(sokBildirim == true){
                                        Fluttertoast.showToast(
                                          msg: "${kategori.kategori_ad} Bildirimleri Açık",
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                        );
                                      }

                                      if(sokBildirim == false){
                                        Fluttertoast.showToast(
                                          msg: "${kategori.kategori_ad} Bildirimleri Kapalı",
                                          backgroundColor: Colors.red,
                                          textColor: Colors.black,
                                          fontSize: 16.0,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                        );
                                      }
                                    }

                                    if(kategori.kategori_ad == "Migros"){
                                      migrosBildirim = !migrosBildirim;

                                      if(migrosBildirim == true){
                                        Fluttertoast.showToast(
                                          msg: "${kategori.kategori_ad} Bildirimleri Açık",
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                        );
                                      }

                                      if(migrosBildirim == false){
                                        Fluttertoast.showToast(
                                          msg: "${kategori.kategori_ad} Bildirimleri Kapalı",
                                          backgroundColor: Colors.red,
                                          textColor: Colors.black,
                                          fontSize: 16.0,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                        );
                                      }
                                    }

                                    if(kategori.kategori_ad == "Carrefour"){
                                      carrefourBildirim = !carrefourBildirim;

                                      if(carrefourBildirim == true){
                                        Fluttertoast.showToast(
                                          msg: "${kategori.kategori_ad} Bildirimleri Açık",
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                        );
                                      }

                                      if(carrefourBildirim == false){
                                        Fluttertoast.showToast(
                                          msg: "${kategori.kategori_ad} Bildirimleri Kapalı",
                                          backgroundColor: Colors.red,
                                          textColor: Colors.black,
                                          fontSize: 16.0,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                        );
                                      }
                                    }

                                    if(kategori.kategori_ad == "Metro"){
                                      metroBildirim = !metroBildirim;

                                      if(metroBildirim == true){
                                        Fluttertoast.showToast(
                                          msg: "${kategori.kategori_ad} Bildirimleri Açık",
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                        );
                                      }

                                      if(metroBildirim == false){
                                        Fluttertoast.showToast(
                                          msg: "${kategori.kategori_ad} Bildirimleri Kapalı",
                                          backgroundColor: Colors.red,
                                          textColor: Colors.black,
                                          fontSize: 16.0,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                        );
                                      }
                                    }

                                    if(kategori.kategori_ad == "Kim"){
                                      kimBildirim = !kimBildirim;

                                      if(kimBildirim == true){
                                        Fluttertoast.showToast(
                                          msg: "${kategori.kategori_ad} Bildirimleri Açık",
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                        );
                                      }

                                      if(kimBildirim == false){
                                        Fluttertoast.showToast(
                                          msg: "${kategori.kategori_ad} Bildirimleri Kapalı",
                                          backgroundColor: Colors.red,
                                          textColor: Colors.black,
                                          fontSize: 16.0,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                        );
                                      }
                                    }

                                    if(kategori.kategori_ad == "Onur"){
                                      onurBildirim = !onurBildirim;

                                      if(onurBildirim == true){
                                        Fluttertoast.showToast(
                                          msg: "${kategori.kategori_ad} Bildirimleri Açık",
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                        );
                                      }

                                      if(onurBildirim == false){
                                        Fluttertoast.showToast(
                                          msg: "${kategori.kategori_ad} Bildirimleri Kapalı",
                                          backgroundColor: Colors.red,
                                          textColor: Colors.black,
                                          fontSize: 16.0,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                        );
                                      }
                                    }

                                    if(kategori.kategori_ad == "File"){
                                      fileBildirim = !fileBildirim;

                                      if(fileBildirim == true){
                                        Fluttertoast.showToast(
                                          msg: "${kategori.kategori_ad} Bildirimleri Açık",
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                        );
                                      }

                                      if(fileBildirim == false){
                                        Fluttertoast.showToast(
                                          msg: "${kategori.kategori_ad} Bildirimleri Kapalı",
                                          backgroundColor: Colors.red,
                                          textColor: Colors.black,
                                          fontSize: 16.0,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                        );
                                      }
                                    }

                                  });
                                },
                                child: Icon(Icons.notifications_active),
                              ),
                            ),
                          ),
                        ),

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