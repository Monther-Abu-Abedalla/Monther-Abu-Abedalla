import 'package:flutter/material.dart';
import 'package:taktikat/feature/core/theme/size/app_size.dart';
import 'package:taktikat/feature/core/theme/text_theme/text_font_size.dart';
import 'package:taktikat/utils/utils/utils.dart';

import '../../core/theme/color/color_manager.dart';

class CircularRadioButton extends StatelessWidget {
  final bool value;
  final String title;
  final void Function() onClick;

  const CircularRadioButton({
    Key? key,
    this.value = false,
    this.title = '',
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppSize.r8),
      onTap: () {
        onClick();
      },
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: ColorManager.instance.textBorderColor, width: 1)),
              child: CircleAvatar(
                radius: 4,
                backgroundColor: value
                    ? ColorManager.instance.primary
                    : ColorManager.instance.transparent,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: Utils.instance.getTextTheme.headlineSmall?.copyWith(
                  color: ColorManager.instance.textHintColor,
                  fontSize: FontSize.fontSize11,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
