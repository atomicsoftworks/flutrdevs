import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';

import 'package:flutterdevs/common/selectabe_adapter.dart';
import 'package:flutterdevs/pages/home/home_page.dart';

import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoButton extends StatelessWidget {
  const LogoButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return GestureDetector(
        onTap: () {
          context.goNamed(HomeScreen.routeName);
        },
        child: SelectableAdapter(
          cursor: SystemMouseCursors.click,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding:  EdgeInsets.only(bottom: 4.0),
                child:  Icon(
                  AntIcons.fireFilled,
                  size: 26,
                ),
              ),
              const SizedBox(width: 4),
              SelectionContainer.disabled(
                child: Text(
                  'FlutrDevs',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
