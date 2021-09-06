import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Appsettings extends ChangeNotifier {
  late SharedPreferences _sharedPreferences;
  Map<String, String> localeName = {
    'locale': 'pt_BR',
    'name': 'R\$',
  };

  Appsettings() {
    _startSettings();
  }

  _startSettings() async {
    await _startSettings();
    await _readLocale();
  }

  // ignore: unused_element
  Future<void> _startSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  _readLocale() {
    final locale = _sharedPreferences.getString('locale') ?? 'pt_BR';
    final name = _sharedPreferences.getString('name') ?? 'R\$';
    localeName = {
      'locale': locale,
      'name': name,
    };

    notifyListeners();
  }

  setLocale(String local, String name) async {
    await _sharedPreferences.setString('locale', local);
    await _sharedPreferences.setString('name', name);
    await _readLocale();
  }
}
