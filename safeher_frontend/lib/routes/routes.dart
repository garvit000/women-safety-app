import 'package:go_router/go_router.dart';
import 'package:safeher_frontend/screens/alert_history/alert_history_screen.dart';
import 'package:safeher_frontend/screens/contacts/contacts_screen.dart';
import 'package:safeher_frontend/screens/home/home_screen.dart';
import 'package:safeher_frontend/screens/live_tracking/live_tracking_screen.dart';
import 'package:safeher_frontend/screens/login/login_screen.dart';
import 'package:safeher_frontend/screens/onboarding/onboarding_screen.dart';
import 'package:safeher_frontend/screens/safety_tools/safety_tools_screen.dart';
import 'package:safeher_frontend/screens/settings/settings_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

final router = GoRouter(
  redirect: (context, state) {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;
    final isGoingToLogin = state.matchedLocation == '/login';
    final isAtRoot = state.matchedLocation == '/';

    // If logged in and at root or login, redirect to home
    if (isLoggedIn && (isAtRoot || isGoingToLogin)) {
      return '/home';
    }

    // If not logged in and not already going to login, redirect to login
    if (!isLoggedIn && !isGoingToLogin) {
      return '/login';
    }
    
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/contacts',
      builder: (context, state) => const ContactsScreen(),
    ),
    GoRoute(
      path: '/safety-tools',
      builder: (context, state) => const SafetyToolsScreen(),
    ),
    GoRoute(
      path: '/alert-history',
      builder: (context, state) => const AlertHistoryScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/live-tracking',
      builder: (context, state) => const LiveTrackingScreen(),
    ),
  ],
);
