// ignore_for_file: avoid_print

import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scanner_app_flutter/homepage.dart';

List qrlinks = [];

class QRPage extends StatefulWidget {
  const QRPage({super.key});

  @override
  State<QRPage> createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  //QR GEÇMİŞİ İÇİN LİSTE
  void saveLinkToLocalStorage(String link) {
    // Implement saving the link to local storage here
    qrlinks.add(link.toString());
  }

//KAMERA İZİN
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  
  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Expanded(
          flex: 5,
          child: QRView(key: qrKey, onQRViewCreated: _onQRViewCreated),
        ),
        Expanded(
          flex: 2,
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                if (result != null)
                  Text(
                    'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 175, 76, 172),
                      fontSize: 15,
                    ),
                  )
                else
                  const Text('Scan a code'),

                  //GERİ BUTONU
                Center(
                    child: ElevatedButton(
                  onPressed: () {
                    saveLinkToLocalStorage(result!.code.toString());
                    print(result.toString());
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Homepage()));
                  },
                  onHover: update(),
                  // ignore: sort_child_properties_last
                  child: const Text("Geri"),
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(10),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 179, 5, 179)),
                      shadowColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 95, 125, 166)),
                      fixedSize: MaterialStateProperty.all(const Size(60, 35)),
                      minimumSize:
                          MaterialStateProperty.all(const Size(20, 10)),
                      side: MaterialStateProperty.all(
                          const BorderSide(color: Colors.black))),
                ))
              ])),
        ),
      ]),
    );
  }
}
update(){}