// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(r'(.+)@(.+){2,}\.(.+){2,}').hasMatch(this);
  }
}

extension BreakpointUtils on BoxConstraints {
  bool get isTablet => maxWidth > 730;
  bool get isDesktop => maxWidth > 1200;
  bool get isMobile => !isTablet && !isDesktop;
}
