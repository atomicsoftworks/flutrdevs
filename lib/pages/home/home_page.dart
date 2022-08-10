import 'package:flutter/material.dart';
import 'package:flutterdevs/common/adaptive_scaffold.dart';
import 'package:flutterdevs/common/cta_button.dart';
import 'package:flutterdevs/common/profile_row.dart';
import 'package:flutterdevs/common/typography.dart';
import 'package:flutterdevs/pages/home/home_provider.dart';
import 'package:flutterdevs/pages/profile/profile_page.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';
import 'package:flutterdevs/common/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  static const routeName = 'home';

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      full: _FullView(
        controller: _controller,
        formKey: _formKey,
      ),
      compact: _CompactView(
        controller: _controller,
        formKey: _formKey,
      ),
    );
  }
}

class _FullView extends StatelessWidget {
  const _FullView({
    Key? key,
    required TextEditingController controller,
    required GlobalKey<FormState> formKey,
  })  : _controller = controller,
        _formKey = formKey,
        super(key: key);

  final TextEditingController _controller;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Center(
          child: Column(
        children: [
          const SizedBox(height: 80),
          Text(
            'Reverse job board for',
            textAlign: TextAlign.center,
            style: context.displayMedium?.w800?.scaleDisplay(constraints),
          ),
          Text(
            'Flutter developers',
            textAlign: TextAlign.center,
            style: context.displayMedium?.w800?.scaleDisplay(constraints),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 800,
            child: Text(
              'Stop searching for your next gig. Let businesses reach out to you!',
              textAlign: TextAlign.center,
              style: context.headlineSmall,
            ),
          ),
          const SizedBox(height: 40),
          Selector<HomeProvider, bool>(
            selector: (_, provider) => provider.emailSubmitted,
            builder: (_, emailSubmitted, child) {
              if (emailSubmitted) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Thank you! You will be notified when we are ready.',
                      textAlign: TextAlign.center,
                      style: context.titleLarge?.primaryColor(context),
                    ),
                  ],
                );
              }
              return Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: 800,
                    child: Text(
                      'Coming soon. Get notified when we launch.',
                      textAlign: TextAlign.center,
                      style: context.titleLarge?.primaryColor(context),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EmailForm(fromKey: _formKey, controller: _controller),
                      const SizedBox(width: 4),
                      NotifyButton(
                        fromKey: _formKey,
                        controller: _controller,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          // const CallToActions(),
          const SizedBox(height: 120),
          SizedBox(
            width: 1024,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return ProfileRow(
                  onPressed: () {
                    context.goNamed(ProfilePage.routeName);
                  },
                );
              },
            ),
          )
        ],
      ));
    });
  }
}

class _CompactView extends StatelessWidget {
  const _CompactView({
    Key? key,
    required TextEditingController controller,
    required GlobalKey<FormState> formKey,
  })  : _controller = controller,
        _formKey = formKey,
        super(key: key);

  final TextEditingController _controller;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Text(
                    'Reverse job board for',
                    textAlign: TextAlign.center,
                    style:
                        context.displayMedium?.w800?.scaleDisplay(constraints),
                  ),
                  Text(
                    'Flutter developers',
                    textAlign: TextAlign.center,
                    style:
                        context.displayMedium?.w800?.scaleDisplay(constraints),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 800,
                    child: Text(
                      'Stop searching for your next gig. Let businesses reach out to you!',
                      textAlign: TextAlign.center,
                      style: context.headlineSmall?.scaleHeadline(constraints),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Selector<HomeProvider, bool>(
                    selector: (_, provider) => provider.emailSubmitted,
                    builder: (_, emailSubmitted, child) {
                      if (emailSubmitted) {
                        return Column(
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            Text(
                              'Thank you! You will be notified when we are ready.',
                              textAlign: TextAlign.center,
                              style: context.titleLarge?.primaryColor(context),
                            ),
                          ],
                        );
                      }
                      return Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            width: 800,
                            child: Text(
                              'Coming soon. Get notified when we launch.',
                              textAlign: TextAlign.center,
                              style: context.titleLarge?.primaryColor(context),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              EmailForm(
                                fromKey: _formKey,
                                controller: _controller,
                                isDense: true,
                              ),
                              const SizedBox(height: 6),
                              NotifyButton(
                                fromKey: _formKey,
                                controller: _controller,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                  // const CallToActions(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
            SizedBox(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return ProfileRow(
                    isDense: true,
                    onPressed: () {
                      context.goNamed(ProfilePage.routeName);
                    },
                  );
                },
              ),
            )
          ],
        ));
      },
    );
  }
}

class NotifyButton extends StatelessWidget {
  const NotifyButton({
    Key? key,
    required this.fromKey,
    required this.controller,
    this.padding,
  }) : super(key: key);

  final GlobalKey<FormState> fromKey;
  final TextEditingController controller;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return CtaButton(
      title: 'Notify me',
      padding: padding,
      onPressed: () {
        if (fromKey.currentState!.validate()) {
          context.read<HomeProvider>().notifyMe(
                email: controller.text,
              );
          controller.clear();
        }
      },
    );
  }
}

class EmailForm extends StatelessWidget {
  const EmailForm({
    Key? key,
    required this.fromKey,
    required this.controller,
    this.isDense = false,
  }) : super(key: key);

  final GlobalKey<FormState> fromKey;
  final TextEditingController controller;
  final bool isDense;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Form(
        key: fromKey,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            } else if (!value.isValidEmail()) {
              return 'Please enter a valid email';
            }
            return null;
          },
          style: context.titleMedium,
          decoration: InputDecoration(
            isDense: isDense,
            contentPadding: isDense
                ? const EdgeInsets.symmetric(vertical: 12, horizontal: 12)
                : null,
            border: const OutlineInputBorder(),
            hintText: "Email",
            hintStyle: context.titleMedium?.setColor(
              Theme.of(context).hintColor,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
                  width: 3.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  width: 3.0),
            ),
          ),
        ),
      ),
    );
  }
}

class CallToActions extends StatelessWidget {
  const CallToActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CtaButton(
          title: 'Get started',
          onPressed: () {},
        ),
        const SizedBox(width: 12),
        CtaButton(
          title: 'Learn more',
          onPressed: () {},
        ),
      ],
    );
  }
}
