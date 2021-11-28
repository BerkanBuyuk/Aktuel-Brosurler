import 'package:aktuel_brosurler/Models/Filmler.dart';
import 'package:flutter/material.dart';

class DetaySayfa extends StatefulWidget {
  Filmler film;

  DetaySayfa({required this.film});

  @override
  _DetaySayfaState createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.film.film_ad),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.network("http://10.0.2.2/aktuel/resimler/brosurler/${widget.film.film_resim}"),
              Text(widget.film.film_yil.toString(),style: TextStyle(fontSize: 30),),
              Text(widget.film.yonetmen.yonetmen_ad,style: TextStyle(fontSize: 30),),
            ],
          ),
        ),
      ),

    );
  }
}
