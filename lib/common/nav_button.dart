import 'package:flutter/material.dart';
import 'package:flutterdevs/common/selectabe_adapter.dart';

class NavButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const NavButton({
    required this.title,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectableAdapter(
      child: SelectionContainer.disabled(
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            title,
          ),
        ),
      ),
    );
  }
}
