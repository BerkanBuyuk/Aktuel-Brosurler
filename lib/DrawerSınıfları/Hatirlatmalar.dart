import 'package:flutter/material.dart';

class Hatirlatmalar extends StatefulWidget {
  const Hatirlatmalar({Key? key}) : super(key: key);

  @override
  _HatirlatmalarState createState() => _HatirlatmalarState();
}

class _HatirlatmalarState extends State<Hatirlatmalar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hatırlatmalar"),
        centerTitle: true,
      ),
    );
  }
}
