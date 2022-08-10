import 'package:flutter/material.dart';
import 'package:flutterdevs/common/adaptive_scaffold.dart';
import 'package:flutterdevs/common/typography.dart';

//ignore: must_be_immutable
class ErrorPage extends StatelessWidget {
  final Exception? error;
  late String message;

  ErrorPage({Key? key, this.error}) : super(key: key) {
    if (error != null) {
      message = error.toString();
    } else {
      message = 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold.single(
      body: LayoutBuilder(builder: (context, constraints) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 120),
              Text(
                '404',
                textAlign: TextAlign.center,
                style: context.displayMedium?.w800
                    ?.setFontSize(200)
                    ?.scaleHeadline(constraints),
              ),
              Text(
                'Page not found',
                textAlign: TextAlign.center,
                style: context.titleLarge?.w800,
              ),
              const SizedBox(height: 120),
            ],
          ),
        );
      }),
    );
  }
}
