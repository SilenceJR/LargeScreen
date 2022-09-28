import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:large_screen/logic/app_logic.dart';
import 'package:large_screen/router.dart';

void main() {
  // Start app
  registerSingletons();
  // if (defaultTargetPlatform==TargetPlatform.windows) {
  //   Window.hideWindowControls();
  // }
  runApp(ScreenApp());
  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
      break;
    case TargetPlatform.fuchsia:
      break;
    case TargetPlatform.iOS:
      break;
    case TargetPlatform.linux:
    case TargetPlatform.macOS:
    case TargetPlatform.windows:
      doWhenWindowReady(() {
        const initialSize = Size(600, 450);
        appWindow.minSize = initialSize;
        appWindow.size = initialSize;
        appWindow.alignment = Alignment.center;
        appWindow.show();
      });
      break;
  }
}

class ScreenApp extends StatelessWidget with GetItMixin {
  ScreenApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: appRouter.routerDelegate,
      routeInformationProvider: appRouter.routeInformationProvider,
      routeInformationParser: appRouter.routeInformationParser,
      theme: ThemeData(),
      localizationsDelegates: const [
        // AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

void registerSingletons() {
  GetIt.I.registerLazySingleton<AppLogic>(() => AppLogic());
}

AppLogic get appLogic => GetIt.I.get<AppLogic>();
