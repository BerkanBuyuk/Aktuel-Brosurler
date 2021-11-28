import 'package:aktuel_brosurler/TabsSiniflari/Brosurler.dart';
import 'package:aktuel_brosurler/TabsSiniflari/Favoriler.dart';
import 'package:aktuel_brosurler/TabsSiniflari/Marketler.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {

  @override
  Widget build(BuildContext context) {

    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;


    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: ekranYuksekligi/12,
          title: Text("Aktüel Broşürler"),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: "Marketler", icon: Icon(Icons.shopping_cart),),
              Tab(text: "Broşürler", icon: Icon(Icons.text_snippet),),
              Tab(text: "Favoriler", icon: Icon(Icons.favorite),),
            ],
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
          ),
        ),
        drawer: Drawer(),
        body: TabBarView(
          children: [
            Marketler(),
            Brosurler(),
            Favoriler(),
          ],
        ),
      ),
    );
  }
}
