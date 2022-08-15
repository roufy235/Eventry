import 'package:eventry/resource/hive_repository.dart';
import 'package:eventry/router/app_screens.dart';
import 'package:eventry/router/app_screens_ext.dart';
import 'package:eventry/screens/home/home_screen.dart';
import 'package:eventry/screens/interest/interest_screen.dart';
import 'package:eventry/screens/login/login_screen.dart';
import 'package:eventry/screens/onboard/onboarding_screen.dart';
import 'package:eventry/screens/register/account_created_screen.dart';
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
          routes: [
            GoRoute(
              path: AppScreens.registerDone.toPath,
              name: AppScreens.registerDone.toName,
              builder: (BuildContext context, GoRouterState state) => const AccountCreatedScreen(),
            )
          ]
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
        // login screen
        final loginLocation = state.namedLocation(AppScreens.login.toPath);
        final isGoingLoginLocation = state.subloc == loginLocation.replaceAll('?', '');

        // onboard screen
        final onboardingLocation = state.namedLocation(AppScreens.onboarding.toPath);
        final isGoingOnboardingLocation = state.subloc == onboardingLocation.replaceAll('?', '');

        // home screen
        final homeLocation = state.namedLocation(AppScreens.home.toPath);
        final isGoingHomeLocation = state.subloc == homeLocation.replaceAll('?', '');

        // register screen
        final registerLocation = state.namedLocation(AppScreens.register.toPath);
        final isGoingRegisterLocation = state.subloc == registerLocation.replaceAll('?', '');

        // interest screen
        //final interestLocation = state.namedLocation(AppScreens.interest.toPath);
        //final isGoingInterestLocation = state.subloc == interestLocation.replaceAll('?', '');

        // registration completed screen
        final registrationCompletedLocation = state.namedLocation(AppScreens.registerDone.toPath);
        //final isGoingInterestLocation = state.subloc == interestLocation.replaceAll('?', '');

        User? currentUser = FirebaseAuth.instance.currentUser;
        bool isLoggedIn = currentUser != null;

        if (isLoggedIn) {
          if (isGoingLoginLocation || isGoingOnboardingLocation) {
            return homeLocation;
          }

          if (isGoingRegisterLocation) {
            return registrationCompletedLocation;
          }
        }

        if (!isLoggedIn) {
          if (isGoingHomeLocation) {
            return loginLocation;
          }

          if (isGoingOnboardingLocation) {
            int? value = HiveRepository().getOnboardingViewedStatus;
            if (value != null && value == 1) {
              return loginLocation;
            }
          }

        }
        return null;
      }

  );
}
