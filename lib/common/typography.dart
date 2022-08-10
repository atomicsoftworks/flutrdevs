import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterdevs/common/theme.dart';
import 'package:flutterdevs/common/utils.dart';

extension TypographyUtils on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => theme.colorScheme;
  TextStyle? get displayLarge => theme.textTheme.displayLarge;
  TextStyle? get displayMedium => theme.textTheme.displayMedium;
  TextStyle? get displaySmall => theme.textTheme.displaySmall;
  TextStyle? get headlineLarge => theme.textTheme.headlineLarge;
  TextStyle? get headlineMedium => theme.textTheme.headlineMedium;
  TextStyle? get headlineSmall => theme.textTheme.headlineSmall;
  TextStyle? get titleLarge => theme.textTheme.titleLarge;
  TextStyle? get titleMedium => theme.textTheme.titleMedium;
  TextStyle? get titleSmall => theme.textTheme.titleSmall;
  TextStyle? get labelLarge => theme.textTheme.labelLarge;
  TextStyle? get labelMedium => theme.textTheme.labelMedium;
  TextStyle? get labelSmall => theme.textTheme.labelSmall;
  TextStyle? get bodyLarge => theme.textTheme.bodyLarge;
  TextStyle? get bodyMedium => theme.textTheme.bodyMedium;
  TextStyle? get bodySmall => theme.textTheme.bodySmall;
}

extension TextStyleHelper on TextStyle {
  TextStyle? get w100 => copyWith(fontWeight: FontWeight.w100);

  TextStyle? get w200 => copyWith(fontWeight: FontWeight.w200);

  TextStyle? get w300 => copyWith(fontWeight: FontWeight.w300);

  TextStyle? get w400 => copyWith(fontWeight: FontWeight.w400);

  TextStyle? get w500 => copyWith(fontWeight: FontWeight.w500);

  TextStyle? get w600 => copyWith(fontWeight: FontWeight.w600);

  TextStyle? get w700 => copyWith(fontWeight: FontWeight.w700);

  TextStyle? get w800 => copyWith(fontWeight: FontWeight.w800);

  TextStyle? get w900 => copyWith(fontWeight: FontWeight.w900);

  TextStyle? get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle? primaryColor(context) => copyWith(
        color: ThemeProvider.primary(context),
      );

  TextStyle? setFontSize(double? fontSize) => copyWith(fontSize: fontSize);

  TextStyle? setColor(Color? color) => copyWith(color: color);

  //60, 48, 30
  TextStyle? scaleDisplay(BoxConstraints constraints) {
    if (constraints.isDesktop) {
      return this;
    } else if (constraints.isTablet) {
      return copyWith(fontSize: max(0.8 * fontSize!, 12));
    }
    return copyWith(fontSize: max(0.5 * fontSize!, 12));
  }

  //20, 18, 16
  TextStyle? scaleHeadline(BoxConstraints constraints) {
    if (constraints.isDesktop) {
      return this;
    } else if (constraints.isTablet) {
      return copyWith(fontSize: max(0.9 * fontSize!, 12));
    }
    return copyWith(fontSize: max(0.8 * fontSize!, 12));
  }
}
