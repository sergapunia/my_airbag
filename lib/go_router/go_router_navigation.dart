import 'package:airbag_project_new/screens/home_screen.dart';
import 'package:airbag_project_new/screens/profile_screen.dart';
import 'package:airbag_project_new/screens/refills_screen.dart';
import 'package:go_router/go_router.dart';

class GoRouterNavigation {
  static late StatefulNavigationShell shellRoute;
  static final router = GoRouter(
    initialLocation: RoutesPath.profile,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) {
          shellRoute = shell;
          return HomeScreen();
        },
        branches: [
          profileBranch,
          refillBranch,
        ],
      ),
    ],
  );
}

class RoutesPath {
  static String home = "/";
  static String profile = "/profile";
  static String refills = "/refills";
}

StatefulShellBranch profileBranch = StatefulShellBranch(routes: [
  GoRoute(
    path: RoutesPath.profile,
    builder: (context, state) => ProfileScreen(),
  ),
]);
StatefulShellBranch refillBranch = StatefulShellBranch(routes: [
  GoRoute(
    path: RoutesPath.refills,
    builder: (context, state) => RefillsScreen(),
  ),
]);
