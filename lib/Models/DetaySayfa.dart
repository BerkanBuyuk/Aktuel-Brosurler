import 'package:aktuel_brosurler/Models/Brosurler.dart';
import 'package:flutter/material.dart';

class DetaySayfa extends StatefulWidget {
  Brosurler brosur;

  DetaySayfa({required this.brosur});

  @override
  _DetaySayfaState createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(widget.brosur.brosur_ad),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.network("http://10.0.2.2/aktuel/resimler/brosurler/${widget.brosur.brosur_resim}"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.brosur.brosur_yil,style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'LobsterRegular',
                    color: Colors.red,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.brosur.aciklama.aciklama_ad,style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'LobsterRegular',
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
