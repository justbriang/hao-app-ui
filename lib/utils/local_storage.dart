import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> clearCache() async {
    final prefs = await _prefs;
    return prefs.clear();
  }

  Future<String?> getThemeMode() async {
    final prefs = await _prefs;
    return prefs.getString('theme_mode');
  }

  Future<bool> setThemeMode(ThemeMode themeMode) async {
    final prefs = await _prefs;
    return prefs.setString('theme_mode', themeMode.name);
  }

  Future<void> setOnBoardingStatus(bool status) async {
    final prefs = await _prefs;
    prefs.setBool('onboarding', status);
  }

  Future<bool?> getOnBoardingStatus() async {
    final prefs = await _prefs;
    return prefs.getBool('onboarding');
  }
}
