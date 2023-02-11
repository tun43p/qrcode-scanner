import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:qrcode_scanner/counter/screens/counter_screen.dart';
import 'package:qrcode_scanner/i18n/i18n.g.dart';
import 'package:qrcode_scanner/preferences/screens/preferences_screen.dart';
import 'package:qrcode_scanner/preferences/services/preferences_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Block landscape orientation.
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // If you want to hard code a predefined language, you can do:
  // LocaleSettings.setLocaleRaw('en');
  LocaleSettings.useDeviceLocale();

  // Register preferences singleton and initialize it.
  await registerPreferencesService();

  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'QRCode Scanner',
        locale: AppLocaleUtils.findDeviceLocale().flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: const <LocalizationsDelegate<Object>>[
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CounterScreen(title: 'QRCode Scanner'),
        initialRoute: CounterScreen.route,
        routes: <String, WidgetBuilder>{
          CounterScreen.route: (BuildContext context) =>
              const CounterScreen(title: 'QRCode Scanner'),
          PreferencesScreen.route: (BuildContext context) =>
              const PreferencesScreen(),
        },
      );
}
