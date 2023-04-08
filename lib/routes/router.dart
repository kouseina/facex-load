import 'package:facex_load/routes/routes_path.dart';
import 'package:facex_load/routes/scaffold_with_bottom_navbar.dart';
import 'package:facex_load/screens/download_screen.dart';
import 'package:facex_load/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: RoutesPath.home,
  routes: <RouteBase>[
    ShellRoute(
      builder: (context, state, child) =>
          ScaffoldWithBottomNavbar(child: child),
      routes: [
        GoRoute(
          path: RoutesPath.home,
          pageBuilder: (context, state) => noTransition(
            context: context,
            state: state,
            child: const HomeScreen(),
          ),
        ),
        GoRoute(
          path: RoutesPath.download,
          pageBuilder: (context, state) => noTransition(
            context: context,
            state: state,
            child: const DownloadedScreen(),
          ),
        ),
      ],
    ),
  ],
);

CustomTransitionPage<dynamic> noTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<dynamic>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        child,
  );
}