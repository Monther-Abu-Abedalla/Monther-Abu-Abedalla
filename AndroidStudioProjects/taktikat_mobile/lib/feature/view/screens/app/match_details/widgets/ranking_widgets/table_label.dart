import 'package:flutter/material.dart';

import '../../../../../../core/theme/text_theme/text_font_size.dart';

class TableLabel extends StatelessWidget {
  const TableLabel({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.onPrimary,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(2),
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.background,
                  fontSize: FontSize.fontSize6,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
