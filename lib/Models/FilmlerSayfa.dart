import 'package:aktuel_brosurler/Models/DetaySayfa.dart';
import 'package:aktuel_brosurler/Models/Filmler.dart';
import 'package:aktuel_brosurler/Models/FilmlerCevap.dart';
import 'package:aktuel_brosurler/Models/Kategoriler.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FilmlerSayfa extends StatefulWidget {
  Kategoriler kategori;

  FilmlerSayfa({required this.kategori});

  @override
  _FilmlerSayfaState createState() => _FilmlerSayfaState();
}

class _FilmlerSayfaState extends State<FilmlerSayfa> {

  List<Filmler> parseFilmlerCevap(String cevap){
    return FilmlerCevap.fromJson(json.decode(cevap)).filmlerListesi;
  }

  Future<List<Filmler>> filmleriGoster(int kategori_id) async {
    var url = Uri.parse("http://10.0.2.2/aktuel/filmler_by_kategori_id.php");
    var veri = {"kategori_id":kategori_id.toString()};
    var cevap = await http.post(url,body: veri);
    return parseFilmlerCevap(cevap.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.kategori.kategori_ad} Broşürleri"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Filmler>>(
        future: filmleriGoster(int.parse(widget.kategori.kategori_id)),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var filmlerListesi = snapshot.data;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3.5,
              ),
              itemCount: filmlerListesi!.length,
              itemBuilder: (context,indeks){
                var film = filmlerListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(film: film ,)));
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network("http://10.0.2.2/aktuel/resimler/brosurler/${film.film_resim}"),
                        ),
                        Text(film.film_ad,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return Center();
          }
        },
      ),

    );
  }
}
