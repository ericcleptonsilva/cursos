import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Appsettings extends ChangeNotifier {
  //late SharedPreferences _sharedPreferences;
  late Box box;
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
  Future<void> _startPreferences() async {
    //_sharedPreferences = await SharedPreferences.getInstance();
    box = await Hive.openBox('preferencias');
  }

  _readLocale() {
      final locale = box.get('locale') ?? 'pt_BR';
    final name = box.get('name') ?? 'R\$';

    localeName = {
      'locale': locale,
      'name': name,
    };
    notifyListeners();
    }

  setLocale(String local, String name) async {
    await box.put('locale', local);
    await box.put('name', name);
    await _readLocale();
  }
}
