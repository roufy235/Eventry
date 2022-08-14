import 'package:eventry/router/app_screens.dart';

extension AppScreensExtension on AppScreens {
  String get toPath {
    switch(this) {
      case AppScreens.home: return 'home';
      case AppScreens.onboarding: return 'onboarding';
      case AppScreens.login: return 'login';
      case AppScreens.register: return 'register';
    }
  }

  String get toName {
    switch(this) {
      case AppScreens.home: return 'home';
      case AppScreens.onboarding: return 'onboarding';
      case AppScreens.login: return 'login';
      case AppScreens.register: return 'register';
    }
  }
}
