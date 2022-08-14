import 'package:eventry/router/app_screens.dart';
import 'package:eventry/router/app_screens_ext.dart';
import 'package:eventry/screens/onboard/onboarding_screen.dart';
import 'package:eventry/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter(
    initialLocation: '/${AppScreens.onboarding.toPath}',
    routes: <GoRoute>[
      GoRoute(
          path: '/${AppScreens.onboarding.toPath}',
          name: AppScreens.onboarding.toName,
          builder: (BuildContext context, GoRouterState state) => const OnboardingScreen()
      ),
      GoRoute(
          path: '/${AppScreens.welcome.toPath}',
          name: AppScreens.welcome.toName,
          builder: (BuildContext context, GoRouterState state) => const WelcomeScreen()
      )
    ]
  );
}
