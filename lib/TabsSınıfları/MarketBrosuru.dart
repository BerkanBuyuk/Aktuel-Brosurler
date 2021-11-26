import 'dart:convert';
import 'package:aktuel_brosurler/Model/Marketler.dart';
import 'package:aktuel_brosurler/Model/MarketlerCevap.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class MarketBrosuru extends StatefulWidget {
  //const MarketBrosuru({Key? key}) : super(key: key);

  String marketin_adi;


  MarketBrosuru({required this.marketin_adi});

  @override
  _MarketBrosuruState createState() => _MarketBrosuruState();
}

class _MarketBrosuruState extends State<MarketBrosuru> {

  List<Marketler> parseNotlarCevap(String cevap){
    return MarketlerCevap.fromJson(json.decode(cevap)).marketlerListesi;
  }

  Future<List<Marketler>> tumMarketleriGoster() async {
    var url = Uri.parse("http://10.0.2.2/marketler/tum_marketler.php");
    var cevap = await http.get(url);
    return parseNotlarCevap(cevap.body);
  }



  int activeIndex = 0;



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
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.marketin_adi),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                      height: ekranYuksekligi/2,
                      initialPage: 0,
                      autoPlay: true,
                      autoPlayAnimationDuration: Duration(seconds: 3),
                      viewportFraction: 1,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason){
                        setState(() {
                          activeIndex = index;
                        });
                      }
                  ),
                  itemCount: marketlerListesi!.length,
                  itemBuilder: (context, indeks, realIndex){
                    var market = marketlerListesi[indeks];
                    return buildImage('http://10.0.2.2/marketler/resimler/brosurler/bim/', indeks);
                  },
                ),
                const SizedBox(height: 12,),
                AnimatedSmoothIndicator(
                  activeIndex: activeIndex,
                  count: marketlerListesi.length,
                  effect: SlideEffect(
                    activeDotColor: Colors.black,
                    dotColor: Colors.red,
                  ),
                ),
              ],
            ),
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


  Widget buildImage(String urlImage, int index) => Container(
    margin: EdgeInsets.symmetric(horizontal: 12),
    //color: Colors.white,
    child: Image.network(
      urlImage,
      //fit: BoxFit.fill,
    ),
  );
}
