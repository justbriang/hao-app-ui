
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final List<String> _clearItems = [
    'firebase_token',
    'app_token',
    'phone_number',
    'name',
    'email',
    'user_id',
    'fms_token'
  ];

  Future<bool> setFirebaseToken(String token) async {
    final prefs = await _prefs;
    return await prefs.setString('firebase_token', token);
  }

  Future<String?> getFirebaseToken() async {
    final prefs = await _prefs;
    return prefs.getString('firebase_token');
  }

  Future<bool> setAppToken(String token) async {
    final prefs = await _prefs;
    return await prefs.setString('app_token', token);
  }

  Future<String?> getAppToken() async {
    final prefs = await _prefs;
    return prefs.getString('app_token');
  }

  Future<bool> setPhoneNumber(String token) async {
    final prefs = await _prefs;
    return await prefs.setString('phone_number', token);
  }

  Future<String?> getPhoneNumber() async {
    final prefs = await _prefs;
    return prefs.getString('phone_number');
  }

  Future<bool> setEmail(String email) async {
    final prefs = await _prefs;
    return await prefs.setString('email', email);
  }

  Future<String?> getEmail() async {
    final prefs = await _prefs;
    return prefs.getString('email');
  }

  Future<bool> setName(String name) async {
    final prefs = await _prefs;
    return await prefs.setString('name', name);
  }

  Future<String?> getName() async {
    final prefs = await _prefs;
    return prefs.getString('name');
  }

  Future<bool> setUserId(int userId) async {
    final prefs = await _prefs;
    return await prefs.setInt('user_id', userId);
  }

  Future<int?> getUserId() async {
    final prefs = await _prefs;
    return prefs.getInt('user_id');
  }

  Future<bool> setFMSToken(String token) async {
    final prefs = await _prefs;
    return await prefs.setString('fms_token', token);
  }

  Future<String?> getFMSToken() async {
    final prefs = await _prefs;
    return prefs.getString('fms_token');
  }

  Future<bool> clearCache() async {
    final prefs = await _prefs;
    return prefs.clear();
  }

  Future<void> logOutClear() async {
    final prefs = await _prefs;
    for (String key in _clearItems) {
      prefs.remove(key);
    }
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
