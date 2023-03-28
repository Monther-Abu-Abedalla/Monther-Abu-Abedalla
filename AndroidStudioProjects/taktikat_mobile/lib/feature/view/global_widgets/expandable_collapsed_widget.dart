import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpandableCollapsedWidget<T extends GetxController>
    extends StatelessWidget {
  final Widget expanded;
  final Widget preview;

  const ExpandableCollapsedWidget(
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
            collapsed: preview,
            header: const SizedBox.shrink(),
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
