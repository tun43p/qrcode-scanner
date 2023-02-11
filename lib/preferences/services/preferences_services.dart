import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _kUrlsKey = 'urls_prefs';

Future<void> registerPreferencesService() async {
  GetIt.I.registerSingleton<PreferencesService>(PreferencesService());
  await GetIt.I.get<PreferencesService>().init();
}

// TODO(tun43p): Document methods
class PreferencesService {
  late final SharedPreferences _instance;

  Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  List<String> get urls => _instance.getStringList(_kUrlsKey) ?? <String>[];

  Future<bool> setUrls(List<String> value) async => _instance.setStringList(
        _kUrlsKey,
        value,
      );

  Future<bool> addSingleUrl(String value) async =>
      _instance.setStringList(_kUrlsKey, <String>[
        ...urls,
        value,
      ]);

  Future<bool> removeSingleUrl(String value) async {
    final List<String> filteredUrls = urls
      ..removeWhere((String url) => url == value);

    return _instance.setStringList(_kUrlsKey, filteredUrls);
  }
}
