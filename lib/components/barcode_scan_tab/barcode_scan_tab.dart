import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BarcodeScanTab extends StatefulWidget {
  @override
  _BarcodeScanTabState createState() => _BarcodeScanTabState();
}

class _BarcodeScanTabState extends State<BarcodeScanTab> {
  ScanResult scanResult;

  Future _scan() async {
    try {
      final result = await BarcodeScanner.scan();
      setState(() => scanResult = result);
    } on PlatformException catch (e) {
      final result = ScanResult(
        type: ResultType.Error,
        format: BarcodeFormat.unknown,
      );
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result.rawContent = 'カメラへのアクセスが許可されていません!';
        });
      } else {
        result.rawContent = 'エラー: $e';
      }
      setState(() {
        scanResult = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final contentList = <Widget>[
      if (scanResult != null)
        Card(
          child: Column(
            children: <Widget>[
              ListTile(
                title: const Text('Result Type'),
                subtitle: Text(scanResult.type?.toString() ?? ''),
              ),
              ListTile(
                title: const Text('RawContent'),
                subtitle: Text(scanResult.rawContent ?? ''),
              ),
              ListTile(
                title: const Text('Format'),
                subtitle: Text(scanResult.format?.toString() ?? ''),
              ),
              ListTile(
                title: const Text('Format note'),
                subtitle: Text(scanResult.formatNote ?? ''),
              ),
            ],
          ),
        ),
      const ListTile(
        title: Text('ボタンを押してカメラを起動してください'),
        subtitle: Text('カメラをQRコードに向けてください'),
      ),
    ];

    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: contentList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scan,
        tooltip: 'Scan',
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
