import 'package:flutter/material.dart';
import 'package:flutterdevs/common/footer.dart';
import 'package:flutterdevs/common/light_switch.dart';
import 'package:flutterdevs/common/navigation_bar.dart' as common;

class FullScaffold extends StatelessWidget {
  final Widget body;

  const FullScaffold({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectionArea(
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              title: common.NavigationBar(
                showLinks: false,
              ),
              centerTitle: false,
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 48),
                  child: LightSwitch(),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: body,
            ),
            const SliverToBoxAdapter(
              child: Footer(),
            ),
          ],
        ),
      ),
    );
  }
}
