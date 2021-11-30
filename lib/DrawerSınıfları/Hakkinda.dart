import 'package:flutter/material.dart';

class Hakkinda extends StatefulWidget {
  const Hakkinda({Key? key}) : super(key: key);

  @override
  _HakkindaState createState() => _HakkindaState();
}

class _HakkindaState extends State<Hakkinda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Hakkında"),
        centerTitle: true,
      ),
    );  }
}
