import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const proje_imece());
}

class proje_imece extends StatelessWidget {
  const proje_imece({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Literatür Tarama Motoru',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LiteraturTaramaMotoru(),
    );
  }
}

///////////////////////////////////////////





class LiteraturTaramaMotoru extends StatefulWidget { //Literatür taraması motoru sayfası başlatılır.
  const LiteraturTaramaMotoru({Key? key}) : super(key: key);

  @override
  State<LiteraturTaramaMotoru> createState() => _LiteraturTaramaMotoruState(); //Literatür taraması motoru sayfasının state methodu oluşturulur.
}

class _LiteraturTaramaMotoruState extends State<LiteraturTaramaMotoru> { //Literatür taraması motoru sayfasının state methodu için class açılır.
  final controller = PageController(initialPage: 1); //Sayfa görüntüleyicide web sayfaları arasında gezintiyi kontrol edecek kontrolcü tanımlanır.

  @override
  void dispose(){ //Kontrolcünün en son çalıştığında hafızasında kalan veriyi sıfırlar.
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.shade400,  //Tarama motoru sayfasının üst barının rengi ayarlanır.
      ),
      drawer: const NavigationDrawer(),//Üst barın sol tarafına yan menü widgetı eklenir.
      body: PageView( //Ekran görüntüleyici ile Tarama motoru sayfasının kapsamında bulunan web sayfaları arasında ekranı kaydırarak geçiş sağlanır.
        children: [
          Container( //Ekran görüntüleyicinin bulundurduğu sayfaların ilki.
            child: WebView( //İlk sayfa olan "Google Akademik"in webden çekilmesi sağlanır.
              initialUrl: 'https://scholar.google.com/schhp?hl=tr',
            ),
            ),
          Container( //Ekran görüntüleyicinin bulundurduğu sayfaların ikincisi.
            child: WebView( //İkinci sayfa olan "Yök Tez"in webden çekilmesi sağlanır.
              initialUrl: 'https://tez.yok.gov.tr/UlusalTezMerkezi/',
            ),
          ),
          Container( //Ekran görüntüleyicinin bulundurduğu sayfaların üçüncüsü.
            child: WebView( //Üçüncü sayfa olan "Ulakbim"in webden çekilmesi sağlanır.
              initialUrl: 'https://ulakbim.tubitak.gov.tr/',
            ),
          ),
          Container(  //Ekran görüntüleyicinin bulundurduğu sayfaların dördüncüsü.
            child: WebView( //Dördüncü sayfa olan "Springer Link"in webden çekilmesi sağlanır.
              initialUrl: 'https://link.springer.com/',
            ),
          ),
          Container(  //Ekran görüntüleyicinin bulundurduğu sayfaların beşincisi.
            child: WebView( //Beşinci sayfa olan "Pub Med"in webden çekilmesi sağlanır.
              initialUrl: 'https://pubmed.ncbi.nlm.nih.gov/',
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NavigationDrawer extends StatelessWidget {  //Yan menü widgetı oluşturmak için class açılmıştır.
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer( //Widget inşasına başlanır.
    child: SingleChildScrollView( //Yan menünün içerisindeki bileşenlerin dikey yönde kaydırılabilmesi sağlanır.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, //Yan menü bileşenlerinin yatay yönde kaydırılabilmesi sağlanır.
        children:<Widget>[
          buildHeader(context), //Yan menü başlığının bileşiği, alt tarafta widget olarak tanımlanmıştır.
          buildMenuItems(context), //Yan menü maddelerinin içeriği, alt tarafta widget olarak tanımlanmıştır.
        ],
      ),
    ),
  );

  Widget buildHeader(BuildContext context) => Container(  //Yan menünün başlık içeriği widget olarak tanımlanır.
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top, //Yan menünün üst kısmında boşluk bırakılmasını sağlar.
    ),
  );
  Widget buildMenuItems(BuildContext context) => Container( //Yan menünün içerikleri widget olarak tanımlanır.
    padding: const EdgeInsets.all(24), //Yan menünün bütün kenarlarında eşit boşluk bırakılmasını sağlar.
    child: Wrap(
      runSpacing: 16,//Yan menünün yatayda boşluk bırakarak başlamasını sağlar.
      children: [
        ListTile( //Yan menünün ilk içeriği
          leading: const Icon(Icons.picture_as_pdf), //İlk içeriğin ikonu
          title: const Text('Rapor Örnekleri'), //İlk içeriğin başlığı
          onTap:(){

          },
        ),
        ListTile(
          leading: const Icon(Icons.plagiarism),
          title: const Text('Literatür Tarama Motoru'),
          onTap:(){},
        ),
        ListTile(
          leading: const Icon(Icons.fact_check),
          title: const Text('Yazım Hatası Ayıklama'),
          onTap:(){},
        ),
        ListTile(
          leading: const Icon(Icons.filter_7),
          title: const Text('Raporda Kelime Sayacı'),
          onTap:(){},
        ),
      ],
    ),

  );
}
