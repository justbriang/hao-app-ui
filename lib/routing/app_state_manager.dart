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

  bool _isOnline = false;
  bool get isOnline => _isOnline;

  bool _authenticated = false;
  bool get isAuthenticated => _authenticated;

  void initializeApp() async {
    // checkAuth();
    Timer(
      const Duration(seconds: 4),
      () async {
        _initialized = true;
        notifyListeners();
      },
    );
  }

  void checkAuth() async {
    var isLoggedIn = await _localStorage.getAppToken();

    if (isLoggedIn != null && isLoggedIn.isNotEmpty) {
      _onboardingComplete = true;
      _authenticated = true;
      notifyListeners();
    }
  }

  set setAuthenticated(bool status) {
    _onboardingComplete = true;
    _authenticated = status;
    notifyListeners();
  }

  //go To login
  bool _goToLoginScreen = false;

  bool get goToLoginScreen => _goToLoginScreen;

  set setGoToLoginScreen(bool value) {
    _goToLoginScreen = value;
    notifyListeners();
  }

  //go To Signup
  bool _goToSignupScreen = false;

  bool get goToSignupScreen => _goToSignupScreen;

  set setGoToSignupScreen(bool value) {
    _goToSignupScreen = value;
    notifyListeners();
  }

  Future<bool> _updateConnectionStatus() async {
    bool isConnected;
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
      } else {
        isConnected = false;
      }
    } on SocketException catch (_) {
      isConnected = false;
    }

    return isConnected;
  }

  bool _goToHome = false;

  bool get goToHome => _goToHome;

  set setGoToHomePage(bool value) {
    _goToHome = value;
    notifyListeners();
  }

  int _selectedTab = AppTab.home;

  int get getSelectedTab => _selectedTab;

  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

  bool _goToAG = false;

  bool get goToAG => _goToAG;

  set setGoToAGPage(bool value) {
    _goToAG = value;
    notifyListeners();
  }

  bool _goToAGCreate = false;

  bool get goToAGCreate => _goToAGCreate;

  set setGoToAGCreatePage(bool value) {
    _goToAGCreate = value;
    notifyListeners();
  }

  bool _goToAGReview = false;

  bool get goToAGReview => _goToAGReview;

  set setGoToAGReviewPage(bool value) {
    _goToAGReview = value;
    notifyListeners();
  }

  bool _goToAGGoalScreen = false;

  bool get goToAGGoalScreen => _goToAGGoalScreen;

  set setGoToAGGoalPage(bool value) {
    _goToAGGoalScreen = value;
    notifyListeners();
  }

  bool _goToMining = false;

  bool get goToMining => _goToMining;

  set setGoToMiningPage(bool value) {
    _goToMining = value;
    notifyListeners();
  }

  bool _goToMiningCreate = false;

  bool get goToMiningCreate => _goToMiningCreate;

  set setGoToMiningCreatePage(bool value) {
    _goToMiningCreate = value;
    notifyListeners();
  }

  bool _goToMiningReview = false;

  bool get goToMiningReview => _goToMiningReview;

  set setGoToMiningReviewPage(bool value) {
    _goToMiningReview = value;
    notifyListeners();
  }

  bool _goToMiningGoals = false;

  bool get goToMiningGoals => _goToMiningGoals;

  set setGoToMiningGoalsPage(bool value) {
    _goToMiningGoals = value;
    notifyListeners();
  }

  bool _goToScale = false;

  bool get goToScale => _goToScale;

  set setGoToScalePage(bool value) {
    _goToScale = value;
    notifyListeners();
  }

  bool _goToScaleReview = false;

  bool get goToScaleReview => _goToScaleReview;

  set setGoToScaleReviewPage(bool value) {
    _goToScaleReview = value;
    notifyListeners();
  }

  bool _goToScaleGoals = false;

  bool get goToScaleGoals => _goToScaleGoals;

  set setGoToScaleGoalsPage(bool value) {
    _goToScaleGoals = value;
    notifyListeners();
  }

  bool _goToKineticsScreen = false;

  bool get goToKineticsScreen => _goToKineticsScreen;

  set setGoToKineticsScreen(bool value) {
    _goToKineticsScreen = value;
    notifyListeners();
  }

  bool _goToKineticsReviewScreen = false;

  bool get goToKineticsReviewScreen => _goToKineticsReviewScreen;

  set setGoToKineticsReviewScreen(bool value) {
    _goToKineticsReviewScreen = value;
    notifyListeners();
  }

  bool _goToKineticsGoalsScreen = false;

  bool get goToKineticsGoalsScreen => _goToKineticsGoalsScreen;

  set setGoToKineticsGoalsScreen(bool value) {
    _goToKineticsGoalsScreen = value;
    notifyListeners();
  }

  bool _goToTreasuresScreen = false;

  bool get goToTreasuresScreen => _goToTreasuresScreen;

  set setGoToTreasuresScreen(bool value) {
    _goToTreasuresScreen = value;
    notifyListeners();
  }

  bool _goToTreasuresReviewScreen = false;

  bool get goToTreasuresReviewScreen => _goToTreasuresReviewScreen;

  set setGoToTreasuresReviewScreen(bool value) {
    _goToTreasuresReviewScreen = value;
    notifyListeners();
  }

  bool _goToTreasuresGoalsScreen = false;

  bool get goToTreasuresGoalsScreen => _goToTreasuresGoalsScreen;

  set setGoToTreasuresGoalsScreen(bool value) {
    _goToTreasuresGoalsScreen = value;
    notifyListeners();
  }

  bool _goToSendoffScreen = false;

  bool get goToSendoffScreen => _goToSendoffScreen;

  set setGoToSendoffScreen(bool value) {
    _goToSendoffScreen = value;
    notifyListeners();
  }

  bool _goToSendoffExampleScreen = false;

  bool get goToSendoffExampleScreen => _goToSendoffExampleScreen;

  set setGoToSendoffExampleScreen(bool value) {
    _goToSendoffExampleScreen = value;
    notifyListeners();
  }

  bool _goToSendoffCreateScreen = false;

  bool get goToSendoffCreateScreen => _goToSendoffCreateScreen;

  set setGoToSendoffCreateScreen(bool value) {
    _goToSendoffCreateScreen = value;
    notifyListeners();
  }

  bool _goToSendoffReviewScreen = false;

  bool get goToSendoffReviewScreen => _goToSendoffReviewScreen;

  set setGoToSendoffReviewScreen(bool value) {
    _goToSendoffReviewScreen = value;
    notifyListeners();
  }

  bool _goToSendoffViewScreen = false;

  bool get goToSendoffViewScreen => _goToSendoffViewScreen;

  set setGoToSendoffViewScreen(bool value) {
    _goToSendoffViewScreen = value;
    notifyListeners();
  }

  //go To Profile
  bool _goToProfileScreen = false;

  bool get goToProfileScreen => _goToProfileScreen;

  set setGoToProfileScreen(bool value) {
    _goToProfileScreen = value;
    notifyListeners();
  }

  //go To Forgot Password State
  bool _goToForgotPasswordScreen = false;

  bool get goToForgotPasswordScreen => _goToForgotPasswordScreen;

  set setGoToForgotPasswordScreen(bool value) {
    _goToForgotPasswordScreen = value;
    notifyListeners();
  }
}
