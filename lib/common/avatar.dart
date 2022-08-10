import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final ImageProvider<Object>? backgroundImage;
  final bool showBorder;
  final double radius;

  const Avatar({
    super.key,
    this.backgroundImage,
    this.showBorder = true,
    this.radius = 64,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:
          showBorder ? Colors.white.withOpacity(0.95) : Colors.transparent,
      radius: radius,
      child: CircleAvatar(
        radius: radius - 4,
        backgroundImage: backgroundImage,
      ),
    );
  }
}
