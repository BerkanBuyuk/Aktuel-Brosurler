import 'package:aktuel_brosurler/DrawerWidget.dart';
import 'package:aktuel_brosurler/TabsSiniflari/BrosurlerTabs.dart';
import 'package:aktuel_brosurler/TabsSiniflari/WebTabs.dart';
import 'package:aktuel_brosurler/TabsSiniflari/MarketlerTabs.dart';
import 'package:aktuel_brosurler/theme/ThemeConstans.dart';
import 'package:aktuel_brosurler/theme/ThemeManager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener(){
    if(mounted){
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
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

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          toolbarHeight: ekranYuksekligi/12,
          title: Text("Aktüel Broşürler"),
          centerTitle: true,
          actions: [
            Switch(value: _themeManager.themeMode == ThemeMode.dark, onChanged: (newValue){
              _themeManager.toggleTheme(newValue);
            }),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: "Marketler", icon: Icon(Icons.shopping_cart),),
              Tab(text: "Broşürler", icon: Icon(Icons.text_snippet),),
              Tab(text: "Web", icon: Icon(Icons.web),),
            ],
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
          ),
        ),
        drawer: DrawerWidget(),
        body: TabBarView(
          children: [
            MarketlerTabs(),
            BrosurlerTabs(),
            WebTabs(),
          ],
        ),
      ),
    );
  }
}
