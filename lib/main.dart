import 'package:aktuel_brosurler/TabsS%C4%B1n%C4%B1flar%C4%B1/Brosurler.dart';
import 'package:aktuel_brosurler/TabsS%C4%B1n%C4%B1flar%C4%B1/Favoriler.dart';
import 'package:aktuel_brosurler/TabsS%C4%B1n%C4%B1flar%C4%B1/Marketler.dart';
import 'package:aktuel_brosurler/Widget/NavigationDrawerWidget.dart';
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Aktüel Broşürler"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Broşürler", icon: Icon(Icons.text_snippet),),
              Tab(text: "Favoriler", icon: Icon(Icons.favorite),),
              Tab(text: "Marketler", icon: Icon(Icons.shopping_cart),),
            ],
            indicatorColor: Colors.white,
            labelColor: Colors.white,
          ),
        ),
        drawer: NavigationDrawerWidget(),
        body: TabBarView(
          children: [
            Brosurler(),
            Favoriler(),
            Marketler(),
          ],
        ),
      ),
    );
  }
}
