import 'package:flutter/material.dart';
import 'package:flutterdevs/common/selectabe_adapter.dart';

class LinkButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const LinkButton({
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
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          child: Text(
            title,
          ),
        ),
      ),
    );
  }
}
