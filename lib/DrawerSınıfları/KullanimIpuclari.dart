import 'package:flutter/material.dart';

class KullanimIpuclari extends StatefulWidget {
  const KullanimIpuclari({Key? key}) : super(key: key);

  @override
  _KullanimIpuclariState createState() => _KullanimIpuclariState();
}

class _KullanimIpuclariState extends State<KullanimIpuclari> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Kullanım İpuçları"),
        centerTitle: true,
      ),
    );  }
}
