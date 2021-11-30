import 'dart:ui';
import 'package:aktuel_brosurler/DrawerS%C4%B1n%C4%B1flar%C4%B1/Hatirlatmalar.dart';
import 'package:aktuel_brosurler/DrawerS%C4%B1n%C4%B1flar%C4%B1/Indirilenler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DrawerSınıfları/Ayarlar.dart';
import 'DrawerSınıfları/Hakkinda.dart';
import 'DrawerSınıfları/Iletisim.dart';
import 'DrawerSınıfları/Kaydedilenler.dart';
import 'DrawerSınıfları/KullanimIpuclari.dart';
import 'DrawerSınıfları/TavsiyeEdin.dart';



class DrawerWidget extends StatefulWidget{
  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {

  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  themeListener(){
    if(mounted){
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context){

    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    final urlImage = 'https://p7.hiclipart.com/preview/1008/303/692/shopping-cart-icon-product-return-shopping-cart-png.jpg';


    return Drawer(
      child: Material(
        color: Colors.white,
        child: ListView(
          //padding: padding,
          children: [
            SizedBox(
              height: ekranYuksekligi/9,
              child: DrawerHeader(
                //padding: EdgeInsets.zero,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [

                        CircleAvatar(
                          radius: ekranYuksekligi/30,
                          backgroundImage: NetworkImage(urlImage),
                          child: Opacity(
                            opacity: 0.1,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Aktüel Broşürler", style: TextStyle(color: Colors.white),),
                        ),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
              ),
            ),



            Container(
              //padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  buildMenuItem(
                    text: 'Hatırlatmalar',
                    icon: Icons.access_alarm,
                    onClicked: () => selectedItem(context, 0),
                  ),

                  const SizedBox(height: 8),
                  buildMenuItem(
                    text: 'İndirilenler',
                    icon: Icons.download,
                    onClicked: () => selectedItem(context, 1),
                  ),

                  const SizedBox(height: 8,),
                  buildMenuItem(
                    text: 'Kaydedilenler',
                    icon: Icons.save,
                    onClicked: () => selectedItem(context, 2),
                  ),

                  const SizedBox(height: 8,),
                  buildMenuItem(
                    text: 'Ayarlar',
                    icon: Icons.settings,
                    onClicked: () => selectedItem(context, 3),
                  ),

                  const SizedBox(height: 8,),
                  buildMenuItem(
                    text: 'Tavsiye Edin',
                    icon: Icons.share,
                    onClicked: () => selectedItem(context, 4),
                  ),

                  const SizedBox(height: 8,),
                  buildMenuItem(
                    text: 'İletişim',
                    icon: Icons.email_outlined,
                    onClicked: () => selectedItem(context, 5),
                  ),

                  const SizedBox(height: 5,),
                  Divider(color: Colors.blueGrey,),
                  const SizedBox(height: 5,),

                  buildMenuItem(
                    text: 'Hakkında',
                    icon: Icons.person,
                    onClicked: () => selectedItem(context, 6),
                  ),

                  const SizedBox(height: 10,),
                  buildMenuItem(
                    text: 'Kullanım İpuçları',
                    icon: Icons.contact_support_outlined,
                    onClicked: () => selectedItem(context, 7),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }){
    final color = Colors.black;
    final hoverColor = Colors.black;

    return ListTile(
      leading: Icon(icon, size: 30,),
      title: Text(text, style: TextStyle(color: color),),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index){

      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Hatirlatmalar(),
        ));
        break;

      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Indirilenler(),
        ));
        break;

      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Kaydedilenler(),
        ));
        break;

      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Ayarlar(),
        ));
        break;

      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TavsiyeEdin(),
        ));
        break;

      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Iletisim(),
        ));
        break;

      case 6:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Hakkinda(),
        ));
        break;

      case 7:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => KullanimIpuclari(),
        ));
        break;
    }
  }
}


