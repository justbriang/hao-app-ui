import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/local_storage.dart';

class AppTab {
  static const int home = 0;
  static const int about = 1;
  static const int services = 2;
  static const int careers = 3;
  static const int myHealth = 4;
}

class AppStateManager extends ChangeNotifier {
  final LocalStorage _localStorage = LocalStorage();

  ThemeMode _darkMode = ThemeMode.system;
  ThemeMode get darkMode => _darkMode;

  set darkMode(ThemeMode darkMode) {
    _localStorage.setThemeMode(darkMode);
    _darkMode = darkMode;
    notifyListeners();
  }

  bool _onboardingComplete = false;

  bool get isOnboardingComplete => _onboardingComplete;

  set setOnBoardingStatus(bool status) {
    _localStorage.setOnBoardingStatus(status);
    _onboardingComplete = status;
    notifyListeners();
  }

  bool _initialized = false;

  bool get isInitialized => _initialized;

  void initializeApp() async {
    Timer(
      const Duration(seconds: 4),
      () async {
        _initialized = true;
        notifyListeners();
      },
    );
  }

  //go To propertydetail
  bool _goToPropertyDetailsScreen = false;

  bool get goToPropertyDetailsScreen => _goToPropertyDetailsScreen;

  set setGoToPropertyDetailsScreen(bool value) {
    _goToPropertyDetailsScreen = value;
    notifyListeners();
  }
  
}
