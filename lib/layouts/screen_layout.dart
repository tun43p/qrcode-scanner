import 'package:flutter/material.dart';
import 'package:qrcode_scanner/counter/screens/counter_screen.dart';
import 'package:qrcode_scanner/preferences/screens/preferences_screen.dart';

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
                ModalRoute.of(context)?.settings.name == CounterScreen.route
                    ? Icons.settings
                    : Icons.home,
              ),
              onTap: () async {
                switch (ModalRoute.of(context)?.settings.name) {
                  case CounterScreen.route:
                    await Navigator.pushNamed(context, PreferencesScreen.route);
                    break;
                  case PreferencesScreen.route:
                    await Navigator.pushNamed(context, CounterScreen.route);
                    break;
                }
              },
            ),
          ],
        ),
        body: child,
      );
}
