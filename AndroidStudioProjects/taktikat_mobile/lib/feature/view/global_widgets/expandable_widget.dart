import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpandableWidget<T extends GetxController> extends StatelessWidget {
  final Widget expanded;
  final Widget preview;

  const ExpandableWidget(
      {Key? key,
      required this.expanded,
      required this.preview,
      required this.logic})
      : super(key: key);

  final T logic;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      init: logic,
      builder: (_) {
        return ExpandableNotifier(
          child: ExpandablePanel(
            collapsed: const SizedBox.shrink(),
            header: preview,
            theme: const ExpandableThemeData(
              hasIcon: false,
              alignment: Alignment.topLeft,
              iconPadding: EdgeInsets.zero,
              tapHeaderToExpand: true,
            ),
            expanded: expanded,
          ),
        );
      },
    );
  }

}
