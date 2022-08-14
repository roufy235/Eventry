import 'package:eventry/router/app_screens.dart';

extension AppScreensExtension on AppScreens {
  String get toPath {
    switch(this) {
      case AppScreens.welcome: return 'welcome';
      case AppScreens.onboarding: return 'onboarding';
    }
  }

  String get toName {
    switch(this) {
      case AppScreens.welcome: return 'welcome';
      case AppScreens.onboarding: return 'onboarding';
    }
  }
}
