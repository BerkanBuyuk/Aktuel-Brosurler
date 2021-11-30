import 'package:flutter/material.dart';

class Iletisim extends StatefulWidget {
  const Iletisim({Key? key}) : super(key: key);

  @override
  _IletisimState createState() => _IletisimState();
}

class _IletisimState extends State<Iletisim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İletişim"),
        centerTitle: true,
      ),
    );  }
}
