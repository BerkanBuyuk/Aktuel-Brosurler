import 'package:flutter/material.dart';

class FavorilerList extends StatefulWidget {
  const FavorilerList({Key? key}) : super(key: key);

  @override
  _FavorilerListState createState() => _FavorilerListState();
}

class _FavorilerListState extends State<FavorilerList> {
  @override
  Widget build(BuildContext context) {
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 30,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("kisi.kisi_ad"),
                          Text("kisi.kisi_tel"),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("18:31", style: TextStyle(color: Colors.blueGrey),),
                          Spacer(),
                          Text("data"),
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
