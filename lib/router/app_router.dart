import 'package:eventry/resource/hive_repository.dart';
import 'package:eventry/router/app_screens.dart';
import 'package:eventry/router/app_screens_ext.dart';
import 'package:eventry/screens/bookmark/bookmark_screen.dart';
import 'package:eventry/screens/checkout/checkout_screen.dart';
import 'package:eventry/screens/checkout/payment_screen.dart';
import 'package:eventry/screens/event_details/event_details_screen.dart';
import 'package:eventry/screens/event_details/organizer_profile_screen.dart';
import 'package:eventry/screens/event_details/particpant_discussion_screen.dart';
import 'package:eventry/screens/event_ticket/generate_ticket_screen.dart';
import 'package:eventry/screens/featured/featured_screen.dart';
import 'package:eventry/screens/home/home_screen.dart';
import 'package:eventry/screens/interest/interest_screen.dart';
import 'package:eventry/screens/login/login_screen.dart';
import 'package:eventry/screens/notification/notification_screen.dart';
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
            path: '/${AppScreens.generateTicket.toPath}',
            name: AppScreens.generateTicket.toName,
            builder: (BuildContext context, GoRouterState state) => const GenerateTicketScreen(),
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
            builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
          routes: [
            GoRoute(
                path: AppScreens.notification.toPath,
                name: AppScreens.notification.toName,
                builder: (BuildContext context, GoRouterState state) => const NotificationScreen()
            ),
            GoRoute(
                path: AppScreens.bookmark.toPath,
                name: AppScreens.bookmark.toName,
                builder: (BuildContext context, GoRouterState state) => const BookmarkScreen()
            ),
            GoRoute(
                path: AppScreens.featured.toPath,
                name: AppScreens.featured.toName,
                builder: (BuildContext context, GoRouterState state) => const FeaturedScreen()
            ),
            GoRoute(
                path: AppScreens.eventDetails.toPath,
                name: AppScreens.eventDetails.toName,
                builder: (BuildContext context, GoRouterState state) {
                  final eventImageName = state.queryParams['eventImageName'];
                  return EventDetailsScreen(
                    eventImageName: eventImageName,
                  );
                },
              routes: [
                GoRoute(
                    path: AppScreens.eventDetailsDiscussion.toPath,
                    name: AppScreens.eventDetailsDiscussion.toName,
                    builder: (BuildContext context, GoRouterState state) => const ParticipantDiscussionScreen()
                ),
                GoRoute(
                    path: AppScreens.eventOrganizerProfile.toPath,
                    name: AppScreens.eventOrganizerProfile.toName,
                    builder: (BuildContext context, GoRouterState state) => const OrganizerProfileScreen()
                ),
                GoRoute(
                    path: AppScreens.checkout.toPath,
                    name: AppScreens.checkout.toName,
                    builder: (BuildContext context, GoRouterState state) => const CheckoutScreen(),
                  routes: [
                    GoRoute(
                        path: AppScreens.checkoutPayment.toPath,
                        name: AppScreens.checkoutPayment.toName,
                        builder: (BuildContext context, GoRouterState state) => const PaymentScreen()
                    ),
                  ]
                ),
              ]
            )
          ]
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
        //final isGoingLoginLocation = state.subloc == loginLocation.replaceAll('?', '');

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
          // if (isGoingLoginLocation || isGoingOnboardingLocation) {
          //   return homeLocation;
          // }

          if (isGoingOnboardingLocation) {
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
