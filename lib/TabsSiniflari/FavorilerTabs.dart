import 'package:flutter/material.dart';

class FavorilerTabs extends StatefulWidget {
  const FavorilerTabs({Key? key}) : super(key: key);

  @override
  _FavorilerTabsState createState() => _FavorilerTabsState();
}

class _FavorilerTabsState extends State<FavorilerTabs> {
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
