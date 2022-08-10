import 'package:flutter/material.dart';
import 'package:flutterdevs/common/compact_scaffold.dart';
import 'package:flutterdevs/common/full_scaffold.dart';
import 'package:flutterdevs/common/utils.dart';

class AdaptiveScaffold extends StatelessWidget {
  final Widget full;
  final Widget compact;

  const AdaptiveScaffold({
    required this.full,
    required this.compact,
    super.key,
  });

  factory AdaptiveScaffold.single({required Widget body}) {
    return AdaptiveScaffold(full: body, compact: body);
  }

  factory AdaptiveScaffold.multi({
    required Widget full,
    required Widget compact,
  }) {
    return AdaptiveScaffold(full: full, compact: compact);
  }

  @override
  Widget build(Object context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.isMobile) {
        return CompactScaffold(body: compact);
      } else {
        return FullScaffold(body: full);
      }
    });
  }
}
