import 'package:flutter/material.dart';
import 'package:flutterdevs/common/adaptive_scaffold.dart';
import 'package:flutterdevs/common/avatar.dart';
import 'package:flutterdevs/common/cta_button.dart';
import 'package:flutterdevs/common/fake_data.dart';
import 'package:flutterdevs/common/icon_text.dart';
import 'package:flutterdevs/common/typography.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const routeName = 'profile';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      full: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              border: Border.all(
                color: Theme.of(context).disabledColor.withOpacity(0.1),
              ),
            ),
            child: SizedBox(
              width: 1024,
              child: Stack(
                children: [
                  const Background(),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 64.0,
                      left: 24.0,
                      right: 24.0,
                      bottom: 24.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Avatar(
                          backgroundImage: NetworkImage(
                            randomProfile,
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          height:
                              600, // TODO: Not sure if this should be hard coded
                          child: Row(
                            children: [
                              Flexible(
                                flex: 5,
                                child: Description(),
                              ),
                              const Flexible(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 24),
                                  child: Stats(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      compact: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).disabledColor.withOpacity(0.1),
            ),
          ),
          child: SizedBox(
            width: 1024,
            child: Stack(
              children: [
                const Background(radius: 0),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 64.0,
                    left: 24.0,
                    right: 24.0,
                    bottom: 24.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Avatar(
                        backgroundImage: NetworkImage(
                          randomProfile,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Description(isDense: true),
                      const SizedBox(height: 12),
                      const Divider(),
                      const SizedBox(height: 12),
                      const Stats(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  final double radius;

  const Background({
    this.radius = 8.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            randomBanner,
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  final bool isDense;

  Description({
    this.isDense = false,
    Key? key,
  }) : super(key: key);

  Widget title(BuildContext context) => Text(
        faker.job.title(),
        textAlign: TextAlign.left,
        style: context.headlineSmall?.copyWith(
          fontWeight: FontWeight.w800,
        ),
      );

  Widget cta(BuildContext context) => CtaButton(
        title: 'Message',
        onPressed: () {},
        padding: isDense
            ? const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              )
            : null,
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isDense
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  title(context),
                  const SizedBox(height: 12),
                  cta(context),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  title(context),
                  cta(context),
                ],
              ),
        const SizedBox(height: 12),
        const Divider(),
        const SizedBox(height: 12),
        Text(
          faker.lorem.sentences(10).join(' '),
          textAlign: TextAlign.left,
          style: context.bodyMedium,
        ),
      ],
    );
  }
}

class Stats extends StatelessWidget {
  const Stats({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconText(
          text: faker.person.name(),
          color: Colors.green,
        ),
        const SizedBox(height: 12),
        IconText(
          text: faker.person.name(),
          color: Colors.green,
          icon: Icons.search,
        ),
        const SizedBox(height: 12),
        const Divider(),
        const SizedBox(height: 12),
        Text('Interested in roles',
            textAlign: TextAlign.left, style: context.bodyMedium),
        const SizedBox(height: 12),
        IconText(text: faker.person.name()),
        const SizedBox(height: 12),
        IconText(text: faker.person.name()),
        const SizedBox(height: 12),
        const Divider(),
        const SizedBox(height: 12),
        Text('Interested in roles',
            textAlign: TextAlign.left, style: context.bodyMedium),
        const SizedBox(height: 12),
        IconText(text: faker.person.name()),
        const SizedBox(height: 12),
        IconText(text: faker.person.name()),
        const SizedBox(height: 12),
        const Divider(),
        const SizedBox(height: 12),
        IconText(icon: Icons.home_work_rounded, text: faker.address.city()),
        const SizedBox(height: 12),
        IconText(icon: Icons.work_history, text: faker.address.country()),
      ],
    );
  }
}
