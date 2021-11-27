import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MarketlerGridView extends StatefulWidget {
  const MarketlerGridView({Key? key}) : super(key: key);

  @override
  State<MarketlerGridView> createState() => _MarketlerGridViewState();
}

class _MarketlerGridViewState extends State<MarketlerGridView> {


  bool bimFavoriMi = false;
  bool a101FavoriMi = false;
  bool sokFavoriMi = false;
  bool migrosFavoriMi = false;
  bool carrefourFavoriMi = false;

  bool bimBildirim = false;
  bool a101Bildirim = false;
  bool sokBildirim = false;
  bool migrosBildirim = false;
  bool carrefourBildirim = false;

  @override
  Widget build(BuildContext context) {

    final urlBim = 'https://upload.wikimedia.org/wikipedia/commons/3/30/Logo_of_B%C4%B0M.PNG';
    final urlA101 = 'https://upload.wikimedia.org/wikipedia/commons/b/bd/A101_LOGO.jpg';
    final urlSok = 'https://upload.wikimedia.org/wikipedia/tr/3/3e/%C5%9Eok_Logo.png';
    final urlMigros = 'https://www.logovector.org/wp-content/uploads/logos/png/m/migros_logo.png';
    final urlCarrefour = 'https://logos-download.com/wp-content/uploads/2016/05/Carrefour_logo_logotype.png';

    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;


    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: [

        GestureDetector(
          onTap: (){},
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(urlBim,height: ekranYuksekligi/14,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: ekranGenisligi/10,
                        height: ekranYuksekligi/20,
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              bimBildirim = !bimBildirim;

                              if(bimBildirim == true){
                                Fluttertoast.showToast(
                                  msg: "Bim Bildirimleri Açık",
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                );
                              }

                              if(bimBildirim == false){
                                Fluttertoast.showToast(
                                  msg: "Bim Bildirimleri Kapalı",
                                  backgroundColor: Colors.red,
                                  textColor: Colors.black,
                                  fontSize: 16.0,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                );
                              }

                            });
                          },
                          child: Icon(bimBildirim ? Icons.notifications_active : Icons.notifications_off_outlined),
                        ),
                      ),
                    ),

                    Spacer(),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: ekranGenisligi/10,
                        height: ekranYuksekligi/20,
                        child: FloatingActionButton(
                          isExtended: true,
                          onPressed: () {
                            setState(() {
                              bimFavoriMi = !bimFavoriMi;

                              if(bimFavoriMi == true){
                                Fluttertoast.showToast(
                                  msg: "Bim Favorilere Eklendi",
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                );
                              }

                              if(bimFavoriMi == false){
                                Fluttertoast.showToast(
                                  msg: "Bim Favorilerden Çıkarıldı",
                                  backgroundColor: Colors.red,
                                  textColor: Colors.black,
                                  fontSize: 16.0,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                );
                              }

                            });
                          },
                          child: Icon(bimFavoriMi ? Icons.favorite : Icons.favorite_border),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: (){},
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(urlA101,height: ekranYuksekligi/14,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: ekranGenisligi/10,
                        height: ekranYuksekligi/20,
                        child: FloatingActionButton(
                          isExtended: true,
                          onPressed: () {
                            setState(() {
                              a101Bildirim = !a101Bildirim;

                              if(a101Bildirim == true){
                                Fluttertoast.showToast(
                                  msg: "A101 Bildirimleri Açık",
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                );
                              }

                              if(a101Bildirim == false){
                                Fluttertoast.showToast(
                                  msg: "A101 Bildirimleri Kapalı",
                                  backgroundColor: Colors.red,
                                  textColor: Colors.black,
                                  fontSize: 16.0,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                );
                              }

                            });
                          },
                          child: Icon(a101Bildirim ? Icons.notifications_active : Icons.notifications_off_outlined),
                        ),
                      ),
                    ),

                    Spacer(),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: ekranGenisligi/10,
                        height: ekranYuksekligi/20,
                        child: FloatingActionButton(
                          isExtended: true,
                          onPressed: () {
                            setState(() {
                              a101FavoriMi = !a101FavoriMi;

                              if(a101FavoriMi == true){
                                Fluttertoast.showToast(
                                  msg: "A101 Favorilere Eklendi",
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                );
                              }

                              if(a101FavoriMi == false){
                                Fluttertoast.showToast(
                                  msg: "A101 Favorilerden Çıkarıldı",
                                  backgroundColor: Colors.red,
                                  textColor: Colors.black,
                                  fontSize: 16.0,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                );
                              }

                            });
                          },
                          child: Icon(a101FavoriMi ? Icons.favorite : Icons.favorite_border),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: (){},
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(urlSok,height: ekranYuksekligi/14,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: ekranGenisligi/10,
                        height: ekranYuksekligi/20,
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              sokBildirim = !sokBildirim;

                              if(sokBildirim == true){
                                Fluttertoast.showToast(
                                  msg: "Şok Bildirimleri Açık",
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                );
                              }

                              if(sokBildirim == false){
                                Fluttertoast.showToast(
                                  msg: "Şok Bildirimleri Kapalı",
                                  backgroundColor: Colors.red,
                                  textColor: Colors.black,
                                  fontSize: 16.0,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                );
                              }

                            });
                          },
                          child: Icon(sokBildirim ? Icons.notifications_active : Icons.notifications_off_outlined),
                        ),
                      ),
                    ),

                    Spacer(),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: ekranGenisligi/10,
                        height: ekranYuksekligi/20,
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              sokFavoriMi = !sokFavoriMi;

                              if(sokFavoriMi == true){
                                Fluttertoast.showToast(
                                  msg: "A101 Favorilere Eklendi",
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                );
                              }

                              if(sokFavoriMi == false){
                                Fluttertoast.showToast(
                                  msg: "A101 Favorilerden Çıkarıldı",
                                  backgroundColor: Colors.red,
                                  textColor: Colors.black,
                                  fontSize: 16.0,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                );
                              }

                            });
                          },
                          child: Icon(sokFavoriMi ? Icons.favorite : Icons.favorite_border),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: (){},
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(urlMigros,height: ekranYuksekligi/14,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: ekranGenisligi/10,
                        height: ekranYuksekligi/20,
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              migrosBildirim = !migrosBildirim;

                              if(migrosBildirim == true){
                                Fluttertoast.showToast(
                                  msg: "Migros Bildirimleri Açık",
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                );
                              }

                              if(migrosBildirim == false){
                                Fluttertoast.showToast(
                                  msg: "Migros Bildirimleri Kapalı",
                                  backgroundColor: Colors.red,
                                  textColor: Colors.black,
                                  fontSize: 16.0,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                );
                              }

                            });
                          },
                          child: Icon(migrosBildirim ? Icons.notifications_active : Icons.notifications_off_outlined),
                        ),
                      ),
                    ),

                    Spacer(),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: ekranGenisligi/10,
                        height: ekranYuksekligi/20,
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              migrosFavoriMi = !migrosFavoriMi;

                              if(migrosFavoriMi == true){
                                Fluttertoast.showToast(
                                  msg: "Migros Favorilere Eklendi",
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                );
                              }

                              if(migrosFavoriMi == false){
                                Fluttertoast.showToast(
                                  msg: "Migros Favorilerden Çıkarıldı",
                                  backgroundColor: Colors.red,
                                  textColor: Colors.black,
                                  fontSize: 16.0,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                );
                              }

                            });
                          },
                          child: Icon(migrosFavoriMi ? Icons.favorite : Icons.favorite_border),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: (){},
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(urlCarrefour,height: ekranYuksekligi/14,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: ekranGenisligi/10,
                        height: ekranYuksekligi/20,
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              carrefourBildirim = !carrefourBildirim;

                              if(carrefourBildirim == true){
                                Fluttertoast.showToast(
                                  msg: "Carrefour Bildirimleri Açık",
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                );
                              }

                              if(carrefourBildirim == false){
                                Fluttertoast.showToast(
                                  msg: "Carrefour Bildirimleri Kapalı",
                                  backgroundColor: Colors.red,
                                  textColor: Colors.black,
                                  fontSize: 16.0,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                );
                              }

                            });
                          },
                          child: Icon(carrefourBildirim ? Icons.notifications_active : Icons.notifications_off_outlined),
                        ),
                      ),
                    ),

                    Spacer(),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: ekranGenisligi/10,
                        height: ekranYuksekligi/20,
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              carrefourFavoriMi = !carrefourFavoriMi;

                              if(carrefourFavoriMi == true){
                                Fluttertoast.showToast(
                                  msg: "Carrefour Favorilere Eklendi",
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                );
                              }

                              if(carrefourFavoriMi == false){
                                Fluttertoast.showToast(
                                  msg: "Carrefour Favorilerden Çıkarıldı",
                                  backgroundColor: Colors.red,
                                  textColor: Colors.black,
                                  fontSize: 16.0,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                );
                              }

                            });
                          },
                          child: Icon(carrefourFavoriMi ? Icons.favorite : Icons.favorite_border),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
