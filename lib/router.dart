import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'page/home/home_page.dart';

class PagePaths {
  static String home = '/home';
}

final appRouter = GoRouter(
    initialLocation: PagePaths.home,
    redirect: _handleRedirect,
    routes: [
      AppRoute(PagePaths.home, (_) => HomePage()),
    ]);

class AppRoute extends GoRoute {
  AppRoute(String path, Widget Function(GoRouterState s) builder,
      {List<GoRoute> routes = const [], this.useFade = false})
      : super(
          path: path,
          routes: routes,
          pageBuilder: (context, state) {
            final pageContent = Scaffold(
              body: builder(state),
              resizeToAvoidBottomInset: false,
            );
            if (useFade) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: pageContent,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            }
            return CupertinoPage(child: pageContent);
          },
        );
  final bool useFade;
}

String? _handleRedirect(GoRouterState state) {
  // Prevent anyone from navigating away from `/` if app is starting up.
  // if (!appLogic.isBootstrapComplete && state.location != ScreenPaths.splash) {
  //   return ScreenPaths.splash;
  // }
  // debugPrint('Navigate to: ${state.location}');
  return null; // do nothing
}
