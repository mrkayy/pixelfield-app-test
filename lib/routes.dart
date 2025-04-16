import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pixel_field_app/features/collections/presentation_layer/collection_details.page.dart';
import 'package:pixel_field_app/features/collections/presentation_layer/collections.page.dart';
import 'package:pixel_field_app/features/onboarding/presentation_layer/signin.page.dart';
import 'package:pixel_field_app/features/onboarding/presentation_layer/signup.page.dart';
import 'package:pixel_field_app/features/onboarding/presentation_layer/splash_screen.page.dart';
import 'package:pixel_field_app/features/onboarding/presentation_layer/welcome.page.dart';
import 'package:pixel_field_app/features/page_navigation.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: "root",
);

GlobalKey<NavigatorState> get navigatorKey => _rootNavigatorKey;

enum Routes {
  root("/"),
  signin("/signin_page"),
  signup("/signup_page"),
  welcome("/welcome_page"),
  shoppage("/shoppage"),
  scanpage("/screen_page"),
  collectionpage("/collection_page"),
  collectiondetaiilpage("/collection_details_page"),
  settingpage("/setting_page");

  const Routes(this.path);
  final String path;

  String get navPath {
    final currentPath = path;
    if (currentPath.startsWith("/")) return currentPath.substring(1);
    return currentPath;
  }
}

class AppRoutes {
  GoRouter get routesConfig => _router;
  static final GoRouter _router = GoRouter(
    refreshListenable: null,
    debugLogDiagnostics: kDebugMode,
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.root.path,

    routes: [
      // root route as entry point of the application
      GoRoute(
        path: Routes.root.path,
        builder: (context, state) => const SplashScreenPage(),
        routes: <RouteBase>[
          GoRoute(
            path: Routes.welcome.navPath,
            builder: (context, state) => WelcomePage(),
          ),
          GoRoute(
            path: Routes.signin.navPath,
            builder: (context, state) => SigninPage(),
          ),
          GoRoute(
            path: Routes.signup.navPath,
            builder: (context, state) => SignupPage(),
          ),
          GoRoute(
            path: Routes.collectiondetaiilpage.navPath,
            builder: (context, state) => CollectionsDetailsPage(),
          ),
        ],
      ),
      // App Routes
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: _rootNavigatorKey,
        builder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return TabNavigationScreen(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          // Home tab routes
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: Routes.scanpage.path,
                builder: (BuildContext context, GoRouterState state) {
                  return Scaffold();
                },
                routes: [],
              ),
            ],
          ),
          // Ponds tab routesR
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: Routes.collectionpage.path,
                builder: (BuildContext context, GoRouterState state) {
                  return CollectionsPage();
                },
                routes: [],
              ),
            ],
          ),
          //
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: Routes.shoppage.path,
                builder: (BuildContext context, GoRouterState state) {
                  return Scaffold();
                },
              ),
            ],
          ),
          //
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: Routes.settingpage.path,
                builder: (BuildContext context, GoRouterState state) {
                  return Scaffold();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
