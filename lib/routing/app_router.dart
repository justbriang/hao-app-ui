import 'package:flutter/material.dart';
import 'package:hao_app/home_screen.dart';

import '../onboarding/onboarding_screen.dart';
import '../splash_screen.dart';
import '../utils/local_storage.dart';
import 'app_routes.dart';
import 'app_state_manager.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final AppStateManager appStateManager;
  final heroController = HeroController();
  final LocalStorage _localStorage = LocalStorage();

  AppRouter({
    required this.appStateManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
    _localStorage.getThemeMode().then((value) {
      appStateManager.darkMode = ThemeMode.values.byName(value ?? 'system');
    });
    _localStorage.getOnBoardingStatus().then((value) {
      appStateManager.setOnBoardingStatus = value ?? false;
    });
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      observers: [
        heroController,
      ],
      pages: [
        if (!appStateManager.isInitialized) SplashScreen.page(),
        if (appStateManager.isInitialized &&
            !appStateManager.isOnboardingComplete)
          HomeScreen.page(),
      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    if (route.settings.name == AppRoutes.ag) {
      appStateManager.setGoToAGPage = false;
    }

    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async => () {};
}
