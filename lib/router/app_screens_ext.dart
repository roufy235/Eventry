import 'package:eventry/router/app_screens.dart';

extension AppScreensExtension on AppScreens {
  String get toPath {
    switch(this) {
      case AppScreens.home: return 'home';
      case AppScreens.onboarding: return 'onboarding';
      case AppScreens.login: return 'login';
      case AppScreens.register: return 'register';
      case AppScreens.interest: return 'interest';
      case AppScreens.registerDone: return 'registerDone';
      case AppScreens.notification: return 'notification';
      case AppScreens.bookmark: return 'bookmark';
      case AppScreens.featured: return 'featured';
      case AppScreens.eventDetails: return 'eventDetails';
      case AppScreens.eventDetailsDiscussion: return 'eventDetailsDiscussion';
    }
  }

  String get toName {
    switch(this) {
      case AppScreens.home: return 'home';
      case AppScreens.onboarding: return 'onboarding';
      case AppScreens.login: return 'login';
      case AppScreens.register: return 'register';
      case AppScreens.interest: return 'interest';
      case AppScreens.registerDone: return 'registerDone';
      case AppScreens.notification: return 'notification';
      case AppScreens.bookmark: return 'bookmark';
      case AppScreens.featured: return 'featured';
      case AppScreens.eventDetails: return 'eventDetails';
      case AppScreens.eventDetailsDiscussion: return 'eventDetailsDiscussion';
    }
  }
}
