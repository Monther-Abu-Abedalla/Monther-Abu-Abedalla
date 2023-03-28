import 'package:flutter/material.dart';
import 'package:taktikat/feature/core/theme/size/app_size.dart';
import 'package:taktikat/feature/core/theme/text_theme/text_font_size.dart';

class TextButtonWithPoint extends StatelessWidget {
  const TextButtonWithPoint({
    super.key,
    this.isActive = false,
    required this.text,
    this.onPressed,
  });

  final bool isActive;
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.h45,
      child: TextButton(
        onPressed: () {
          if (onPressed != null) {
            onPressed!();
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isActive) ...[
              Container(
                width: AppSize.w8,
                height: AppSize.h8,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: FontSize.fontSize13,
                    color: isActive
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).hintColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
