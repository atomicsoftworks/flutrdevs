import 'package:flutter/material.dart';
import 'package:flutterdevs/common/logo_button.dart';
import 'package:flutterdevs/common/nav_button.dart';

class NavigationBar extends StatelessWidget {
  final bool showLinks;
  final EdgeInsetsGeometry? padding;

  const NavigationBar({
    this.showLinks = true,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: padding ??
              const EdgeInsets.symmetric(
                horizontal: 48.0,
              ),
          child: const LogoButton(),
        ),
        Visibility(
          visible: showLinks,
          child: Row(
            children: [
              NavButton(
                title: 'Developers',
                onPressed: () {},
              ),
              const SizedBox(
                width: 20,
              ),
              NavButton(
                title: 'Pricing',
                onPressed: () {},
              ),
              const SizedBox(
                width: 20,
              ),
              NavButton(
                title: 'About',
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
