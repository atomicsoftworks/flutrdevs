import 'package:flutter/material.dart';
import 'package:flutterdevs/pages/home/home_provider.dart';
import 'package:flutterdevs/pages/profile/profile_page.dart';
import 'package:flutterdevs/pages/error/error_page.dart';
import 'package:flutterdevs/pages/home/home_page.dart';
import 'package:flutterdevs/repository/repository.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppRouter {
  AppRouter();

  late final router = GoRouter(
    debugLogDiagnostics: true,
    urlPathStrategy: UrlPathStrategy.path,
    routes: [
      GoRoute(
        name: HomeScreen.routeName,
        path: '/',
        pageBuilder: (context, state) => MaterialPage<void>(
          child: ChangeNotifierProvider(
            create: (_) => HomeProvider(
              repository: Repository(),
            ),
            child: const HomeScreen(title: 'Home'),
          ),
        ),
      ),
      GoRoute(
        name: ProfilePage.routeName,
        path: '/profile',
        pageBuilder: (context, state) => const MaterialPage<void>(
          child: ProfilePage(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: ErrorPage(error: state.error),
    ),
  );
}
