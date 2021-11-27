import 'package:flutter/material.dart';

class FavorilerList extends StatefulWidget {
  const FavorilerList({Key? key}) : super(key: key);

  @override
  _FavorilerListState createState() => _FavorilerListState();
}

class _FavorilerListState extends State<FavorilerList> {
  @override
  Widget build(BuildContext context) {


    final urlBim = 'https://upload.wikimedia.org/wikipedia/commons/3/30/Logo_of_B%C4%B0M.PNG';

    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;


    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, indeks){
        var kisi = [indeks];
        return GestureDetector(
          onTap: (){},
          child: Card(
            child: SizedBox(
              height: 80,
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
                          Text("Bim", style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("30 Kasım Bim Broşürü"),
                          Text("3 Sayfa"),
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
  }
}
