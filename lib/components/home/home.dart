import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:momoyama/components/barcode_scan_tab/barcode_scan_tab.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 1;

  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('桃山点呼'),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Center(
          child: _getPage(currentPage),
        ),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(
            iconData: Icons.camera_alt,
            title: 'QRコード',
            onclick: () => print(0),
          ),
          TabData(
            iconData: Icons.home,
            title: 'ホーム',
            onclick: () => print(1),
          ),
          TabData(
            iconData: Icons.playlist_add_check,
            title: '名簿',
            onclick: () => print(2),
          )
        ],
        initialSelection: 1,
        key: bottomNavigationKey,
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: const <Widget>[Text('Hello'), Text('World')],
        ),
      ),
    );
  }

  Widget _getPage(int page) {
    switch (page) {
      case 0:
        return BarcodeScanTab();
      case 1:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Text('ここに点呼の状況を表示する.'),
          ],
        );
      default:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Text('QRコードがない場合を考慮して、'),
            Text('手動で点呼できる仕組みを用意する.'),
          ],
        );
    }
  }
}
