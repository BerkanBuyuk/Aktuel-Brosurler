import 'package:flutter/material.dart';

class TavsiyeEdin extends StatefulWidget {
  const TavsiyeEdin({Key? key}) : super(key: key);

  @override
  _TavsiyeEdinState createState() => _TavsiyeEdinState();
}

class _TavsiyeEdinState extends State<TavsiyeEdin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Tavsiye Edin"),
        centerTitle: true,
      ),
    );  }
}
