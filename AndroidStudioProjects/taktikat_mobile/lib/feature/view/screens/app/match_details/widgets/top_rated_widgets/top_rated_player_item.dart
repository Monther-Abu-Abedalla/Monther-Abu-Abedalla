import 'package:flutter/material.dart';
import 'package:taktikat/feature/core/theme/color/color_manager.dart';
import 'package:taktikat/feature/core/theme/size/app_size.dart';
import 'package:taktikat/feature/core/theme/text_theme/text_font_size.dart';

import '../../../../../../model/models/match_details/player.dart';
import '../../../../../global_widgets/my_network_image.dart';

class TopRatedPlayerSection extends StatelessWidget {
  const TopRatedPlayerSection({super.key, required this.player});

  final Player? player;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorManager.instance.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSize.r10),
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 35),
            CircleAvatar(
              radius: AppSize.r16,
              backgroundColor: Theme.of(context).colorScheme.background,
              child: MyNetworkImage(
                url: player?.image ?? '',
                height: AppSize.h30,
                width: AppSize.w30,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              player?.name ?? '',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: FontSize.fontSize11,
                    color: ColorManager.instance.dashColor,
                  ),
            ),
            const SizedBox(height: 5),
            Text(
              player?.position ?? '',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: FontSize.fontSize12,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
