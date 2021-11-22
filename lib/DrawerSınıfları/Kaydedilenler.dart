import 'package:flutter/material.dart';

class Kaydedilenler extends StatefulWidget {
  const Kaydedilenler({Key? key}) : super(key: key);

  @override
  _KaydedilenlerState createState() => _KaydedilenlerState();
}

class _KaydedilenlerState extends State<Kaydedilenler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kaydedilenler"),
        centerTitle: true,
      ),
    );
  }
}
