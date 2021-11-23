import 'package:aktuel_brosurler/NotlarApi/Notlar.dart';
import 'package:aktuel_brosurler/NotlarApi/NotlarCevap.dart';
import 'package:aktuel_brosurler/TabsS%C4%B1n%C4%B1flar%C4%B1/BrosurlerList.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;



class Brosurler extends StatefulWidget {
  const Brosurler({Key? key}) : super(key: key);

  @override
  _BrosurlerState createState() => _BrosurlerState();
}

class _BrosurlerState extends State<Brosurler> {

  @override
  Widget build(BuildContext context) {
    return BrosurlerList();
  }
}













