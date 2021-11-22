import 'package:aktuel_brosurler/TabsS%C4%B1n%C4%B1flar%C4%B1/FavorilerList.dart';
import 'package:flutter/material.dart';

class Favoriler extends StatefulWidget {
  const Favoriler({Key? key}) : super(key: key);

  @override
  _FavorilerState createState() => _FavorilerState();
}

class _FavorilerState extends State<Favoriler> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FavorilerList(),
    );
  }
}
