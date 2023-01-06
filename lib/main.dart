// ignore_for_file: unused_import, unnecessary_import, camel_case_types

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:qr_scanner_app_flutter/homepage.dart';
import 'package:qr_scanner_app_flutter/main.dart';
import 'package:qr_scanner_app_flutter/qrpage.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homepage());
  }
}
