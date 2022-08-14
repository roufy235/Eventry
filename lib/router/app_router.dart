import 'package:eventry/router/app_screens.dart';
import 'package:eventry/router/app_screens_ext.dart';
import 'package:eventry/screens/home/home_screen.dart';
import 'package:eventry/screens/login/login_screen.dart';
import 'package:eventry/screens/onboard/onboarding_screen.dart';
import 'package:eventry/screens/register/registration_screen.dart';
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
          builder: (BuildContext context, GoRouterState state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/${AppScreens.login.toPath}',
        name: AppScreens.login.toName,
        builder: (BuildContext context, GoRouterState state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/${AppScreens.register.toPath}',
        name: AppScreens.register.toName,
        builder: (BuildContext context, GoRouterState state) => const RegistrationScreen(),
      ),
      GoRoute(
          path: '/${AppScreens.home.toPath}',
          name: AppScreens.home.toName,
          builder: (BuildContext context, GoRouterState state) => const HomeScreen()
      )
    ]
  );
}
