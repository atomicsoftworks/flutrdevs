import 'package:flutter/material.dart';
import 'package:flutterdevs/common/typography.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;
  final bool alignRight;

  const IconText({
    required this.text,
    this.icon = Icons.check_circle_rounded,
    this.color,
    this.alignRight = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          alignRight ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: color,
          size: 18,
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            text,
            textAlign: TextAlign.left,
            style: context.bodyMedium?.w800?.setColor(
              color?.withOpacity(0.8),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
