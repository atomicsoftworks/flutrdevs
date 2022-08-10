import 'dart:ui';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutterdevs/common/theme.dart';
import 'package:flutterdevs/router/router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(App());
}

class App extends StatelessWidget {
  final settings = ValueNotifier(ThemeSettings(
    sourceColor: Colors.purple.shade700,
    themeMode: ThemeMode.dark,
  ));

  App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) => ThemeProvider(
        fontFamily: 'Inter',
        lightDynamic: lightDynamic,
        darkDynamic: darkDynamic,
        settings: settings,
        child: NotificationListener<ThemeSettingChange>(
          onNotification: (notification) {
            settings.value = notification.settings;
            return true;
          },
          child: ValueListenableBuilder<ThemeSettings>(
            valueListenable: settings,
            builder: (context, value, _) {
              final theme = ThemeProvider.of(context);
              return Builder(builder: (context) {
                final router =
                    Provider.of<AppRouter>(context, listen: false).router;

                return MaterialApp.router(
                  title: 'Flutter Devs',
                  theme: theme.light(settings.value.sourceColor),
                  darkTheme: theme.dark(settings.value.sourceColor),
                  themeMode: theme.themeMode(),
                  scrollBehavior: AppScrollBehavior(),
                  routeInformationParser: router.routeInformationParser,
                  routerDelegate: router.routerDelegate,
                  debugShowCheckedModeBanner: false,
                );
              });
            },
          ),
        ),
      ),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
      };
}
