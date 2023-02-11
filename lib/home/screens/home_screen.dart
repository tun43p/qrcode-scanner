import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qrcode_scanner/config/services/config_services.dart';
import 'package:qrcode_scanner/core/layouts/screen_layout.dart';
import 'package:qrcode_scanner/home/widgets/scanner_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String route = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ConfigService _configService = GetIt.I.get<ConfigService>();

  List<String> _urls = <String>[];

  @override
  void initState() {
    super.initState();
    unawaited(_initState());
  }

  Future<void> _initState() async {
    _urls = GetIt.I.get<ConfigService>().urls;
  }

  @override
  Widget build(BuildContext context) => ScreenLayout(
        child: Column(
          children: <Widget>[
            ScannerWidget(
              onDetect: (BarcodeCapture capture) async {
                final List<Barcode> barcodes = capture.barcodes;
                for (final Barcode barcode in barcodes) {
                  if (!_configService.urls.contains(barcode.rawValue)) {
                    await _configService.addSingleUrl(barcode.rawValue!);

                    setState(() {
                      _urls = <String>[..._urls, barcode.rawValue!];
                    });
                  }
                }
              },
            ),
            ..._urls.map(
              Text.new,
            )
          ],
        ),
      );
}
