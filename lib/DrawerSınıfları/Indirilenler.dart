import 'package:flutter/material.dart';

class Indirilenler extends StatefulWidget {
  const Indirilenler({Key? key}) : super(key: key);

  @override
  _IndirilenlerState createState() => _IndirilenlerState();
}

class _IndirilenlerState extends State<Indirilenler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("İndirilenler"),
        centerTitle: true,
      ),
    );
  }
}
