import 'package:flutter/material.dart';
import 'package:flutterdevs/common/theme.dart';

class LightSwitch extends StatelessWidget {
  const LightSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return IconButton(
      padding: const EdgeInsets.all(16.0),
      icon: Theme.of(context).brightness == Brightness.light
          ? const Icon(Icons.brightness_4)
          : const Icon(Icons.brightness_7),
      onPressed: () {
        final themeProvider = ThemeProvider.of(context);
        final settings = themeProvider.settings.value;
        final newSettings = ThemeSettings(
          sourceColor: settings.sourceColor,
          themeMode: isDark ? ThemeMode.light : ThemeMode.dark,
        );
        ThemeSettingChange(settings: newSettings).dispatch(context);
      },
    );
  }
}
