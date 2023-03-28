import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  final Widget expandedContent;
  final Widget collapsedContent;
  final double expandedHeight;
  final double collapsedHeight;

  const CustomSliverAppBar({
    Key? key,
    required this.expandedContent,
    required this.collapsedContent,
    required this.expandedHeight,
    required this.collapsedHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: expandedHeight,
      collapsedHeight: collapsedHeight,
      toolbarHeight: 30,
      leading: const SizedBox.shrink(),
      actions: const [],
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxHeight < expandedHeight) {
            return Container(
              alignment: Alignment.bottomCenter,
              child: collapsedContent,
            );
          }
          return FlexibleSpaceBar(
            background: expandedContent,
          );
        },
      ),
      pinned: true,
    );
  }
}
