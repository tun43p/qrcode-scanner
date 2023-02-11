import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:qrcode_scanner/config/screens/config_screen.dart';
import 'package:qrcode_scanner/config/services/config_services.dart';
import 'package:qrcode_scanner/core/i18n/i18n.g.dart';
import 'package:qrcode_scanner/core/theme/main_theme.dart';
import 'package:qrcode_scanner/home/screens/home_screen.dart';

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
  await registerConfigService();

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
        theme: mainTheme,
        initialRoute: HomeScreen.route,
        routes: <String, WidgetBuilder>{
          ConfigScreen.route: (BuildContext context) => const ConfigScreen(),
          HomeScreen.route: (BuildContext context) => const HomeScreen(),
        },
      );
}
