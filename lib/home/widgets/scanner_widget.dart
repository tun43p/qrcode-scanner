import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerWidget extends StatefulWidget {
  const ScannerWidget({required this.onDetect, super.key});

  final void Function(BarcodeCapture barcodeCapture) onDetect;

  @override
  State<ScannerWidget> createState() => _ScannerWidgetState();
}

class _ScannerWidgetState extends State<ScannerWidget> {
  late final MobileScannerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = MobileScannerController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxWidth / 1.5,
          child: MobileScanner(
            controller: _controller,
            onDetect: widget.onDetect,
          ),
        ),
      );
}
