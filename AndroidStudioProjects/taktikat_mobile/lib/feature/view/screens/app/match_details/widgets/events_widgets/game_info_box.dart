import 'package:flutter/material.dart';

import '../../../../../../core/theme/color/color_manager.dart';
import '../../../../../../core/theme/text_theme/text_font_size.dart';
import '../../../../../../model/shared_models.dart';

class GameInfoBox extends StatelessWidget {
  final String title;
  final Stats? states;
  final bool isHome;
  const GameInfoBox(
      {Key? key,
      required this.title,
      required this.states,
      required this.isHome})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: ColorManager.instance.dashColor,
              ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: ColorManager.instance.success),
          child: Text(
            isHome
                ? states?.homeValue.toString() ?? ''
                : states?.awayValue.toString() ?? '',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: FontSize.fontSize11,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.instance.white,
                ),
          ),
        )
      ],
    );
  }
}
