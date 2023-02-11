import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> registerConfigService() async {
  GetIt.I.registerSingleton<ConfigService>(ConfigService());
  await GetIt.I.get<ConfigService>().init();
}

// TODO(tun43p): Document methods
class ConfigService {
  late final SharedPreferences _instance;
  static const String _urlsKey = 'urls';
  static const String _launchKey = 'launch';

  Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  bool get isFirstLaunch => _instance.getBool(_launchKey) ?? true;

  Future<bool> setIsFirstLaunch({required bool value}) async =>
      _instance.setBool(_launchKey, value);

  List<String> get urls => _instance.getStringList(_urlsKey) ?? <String>[];

  Future<bool> setUrls(List<String> value) async => _instance.setStringList(
        _urlsKey,
        value,
      );

  Future<bool> addSingleUrl(String value) async =>
      _instance.setStringList(_urlsKey, <String>[
        ...urls,
        value,
      ]);

  Future<bool> removeSingleUrl(String value) async {
    final List<String> filteredUrls = urls
      ..removeWhere((String url) => url == value);

    return _instance.setStringList(_urlsKey, filteredUrls);
  }
}
