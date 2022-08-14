import 'package:eventry/router/app_screens.dart';
import 'package:eventry/router/app_screens_ext.dart';
import 'package:eventry/screens/home/home_screen.dart';
import 'package:eventry/screens/interest/interest_screen.dart';
import 'package:eventry/screens/login/login_screen.dart';
import 'package:eventry/screens/onboard/onboarding_screen.dart';
import 'package:eventry/screens/register/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter(
      initialLocation: '/${AppScreens.onboarding.toPath}',
      refreshListenable: GoRouterRefreshStream(FirebaseAuth.instance.authStateChanges()),
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
        ),
        GoRoute(
            path: '/${AppScreens.interest.toPath}',
            name: AppScreens.interest.toName,
            builder: (BuildContext context, GoRouterState state) => const InterestScreen()
        )
      ],
      redirect: (GoRouterState state) {
        final loginLocation = state.namedLocation(AppScreens.login.toPath);
        final isGoingLoginLocation = state.subloc == loginLocation.replaceAll('?', '');

        final onboardingLocation = state.namedLocation(AppScreens.onboarding.toPath);
        final isGoingOnboardingLocation = state.subloc == onboardingLocation.replaceAll('?', '');

        final homeLocation = state.namedLocation(AppScreens.home.toPath);
        final isGoingHomeLocation = state.subloc == homeLocation.replaceAll('?', '');

        User? currentUser = FirebaseAuth.instance.currentUser;
        bool isLoggedIn = currentUser != null;

        if (!isLoggedIn && isGoingHomeLocation) {
          return loginLocation;
        }

        if (isLoggedIn && (isGoingLoginLocation || isGoingOnboardingLocation)) {
          return homeLocation;
        }

        return null;
      }

  );
}
