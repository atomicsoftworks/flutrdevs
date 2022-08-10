import 'package:flutter/material.dart';
import 'package:flutterdevs/common/avatar.dart';
import 'package:flutterdevs/common/fake_data.dart';
import 'package:flutterdevs/common/icon_text.dart';
import 'package:flutterdevs/common/selectabe_adapter.dart';
import 'package:flutterdevs/common/typography.dart';

class ProfileRow extends StatelessWidget {
  final bool isDense;
  final Function() onPressed;

  const ProfileRow({
    required this.onPressed,
    this.isDense = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SelectableAdapter(
        cursor: SystemMouseCursors.click,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            // backgroundColor: Theme.of(context).cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            side: BorderSide(
              width: 0.8,
              color: Theme.of(context).dividerColor.withOpacity(0.08),
            ),
          ),
          child: SelectionContainer.disabled(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
              child: SelectableAdapter(
                child: Row(children: [
                  Flexible(
                    flex: isDense ? 1 : 2,
                    child: Avatar(
                      radius: isDense ? 48 : 64,
                      backgroundImage: NetworkImage(
                        randomProfile,
                      ),
                    ),
                  ),
                  isDense
                      ? const SizedBox(width: 12)
                      : const SizedBox(width: 24),
                  Flexible(
                    flex: isDense ? 3 : 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                faker.job.title(),
                                maxLines: 1,
                                style: context.titleLarge?.bold,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                            isDense
                                ? const SizedBox()
                                : const Flexible(
                                    child: IconText(
                                      text: 'Available soon',
                                      color: Colors.green,
                                      alignRight: true,
                                    ),
                                  ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          faker.lorem.sentences(8).join(' '),
                          maxLines: 4,
                          style: context.titleMedium,
                          overflow: TextOverflow.visible,
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
        ),
      );
    });
  }
}
