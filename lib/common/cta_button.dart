import 'package:flutter/material.dart';
import 'package:flutterdevs/common/selectabe_adapter.dart';
import 'package:flutterdevs/common/typography.dart';

class CtaButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;

  const CtaButton({
    required this.title,
    this.padding,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectableAdapter(
      child: SelectionContainer.disabled(
        child: OutlinedButton(
          style: ElevatedButton.styleFrom(
            padding: padding ??
                const EdgeInsets.symmetric(horizontal: 36, vertical: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            side: const BorderSide(
              // width: 1,
              color: Colors.transparent,
            ),
            primary: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          ),
          onPressed: onPressed,
          child: Text(
            title,
            style: context.titleMedium?.w900,
          ),
        ),
      ),
    );
  }
}
