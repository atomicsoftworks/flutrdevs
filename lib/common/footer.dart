import 'package:flutter/material.dart';
import 'package:flutterdevs/common/link_button.dart';
import 'package:flutterdevs/common/typography.dart';

class Footer extends StatelessWidget {
  final double height;

  const Footer({
    this.height = 300.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: 1024,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Center(
          //       child: Row(
          //         children: [
          //           LinkButton(
          //             title: 'About',
          //             onPressed: () {},
          //           ),
          //           LinkButton(
          //             title: 'Support',
          //             onPressed: () {},
          //           ),
          //           LinkButton(
          //             title: 'Privacy policy',
          //             onPressed: () {},
          //           ),
          //           LinkButton(
          //             title: 'Terms and conditions',
          //             onPressed: () {},
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 24),
          Text(
            '© 2022 FlutrDevs. All rights reserved.',
            style: context.bodyLarge,
          ),
          // const SizedBox(height: 24),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: const [
          //     Text('Built with Flutter'),
          //     SizedBox(width: 6),
          //     Icon(Icons.flutter_dash, size: 20)
          //   ],
          // ),
        ],
      ),
    );
  }
}
