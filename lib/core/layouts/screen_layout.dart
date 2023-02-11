import 'package:flutter/material.dart';
import 'package:qrcode_scanner/config/screens/config_screen.dart';
import 'package:qrcode_scanner/home/screens/home_screen.dart';

class ScreenLayout extends StatelessWidget {
  const ScreenLayout({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('QRCode Scanner'),
          actions: <Widget>[
            GestureDetector(
              child: Icon(
                ModalRoute.of(context)?.settings.name == ConfigScreen.route
                    ? Icons.home
                    : Icons.settings,
              ),
              onTap: () async {
                switch (ModalRoute.of(context)?.settings.name) {
                  case ConfigScreen.route:
                    await Navigator.pushNamed(context, HomeScreen.route);
                    break;
                  case HomeScreen.route:
                    await Navigator.pushNamed(context, ConfigScreen.route);
                    break;
                }
              },
            ),
          ],
        ),
        body: child,
      );
}
