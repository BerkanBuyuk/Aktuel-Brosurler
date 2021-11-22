import 'package:aktuel_brosurler/TabsS%C4%B1n%C4%B1flar%C4%B1/MarketlerGridView.dart';
import 'package:flutter/material.dart';

class Marketler extends StatefulWidget {
  const Marketler({Key? key}) : super(key: key);

  @override
  _MarketlerState createState() => _MarketlerState();
}

class _MarketlerState extends State<Marketler> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MarketlerGridView(),
    );
  }
}
