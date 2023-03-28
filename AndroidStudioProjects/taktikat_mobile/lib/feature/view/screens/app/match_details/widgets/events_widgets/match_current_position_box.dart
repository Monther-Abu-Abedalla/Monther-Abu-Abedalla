import 'package:flutter/material.dart';

import '../../../../../../core/theme/color/color_manager.dart';
import '../../../../../../core/theme/size/app_size.dart';
import '../../../../../../core/theme/text_theme/text_font_size.dart';
import '../../../../../global_widgets/my_network_image.dart';

class MatchCurrentPositionBox extends StatelessWidget {
  final bool isHome;
  final String? name;
  final String? playerUrl;
  final String? eventIcon;
  final String? minute;
  final String? description;

  const MatchCurrentPositionBox(
      {Key? key,
      required this.isHome,
      this.name,
      this.eventIcon,
      this.playerUrl,
      this.description,
      this.minute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: isHome
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        name ?? 'player',
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: FontSize.fontSize9,
                              color: ColorManager.instance.secondary,
                            ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.all(2),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorManager.instance.green),
                        shape: BoxShape.circle,
                        color: ColorManager.instance.transparent,
                      ),
                      child: Center(
                        child: MyNetworkImage(
                          url: playerUrl,
                          height: AppSize.h26,
                          width: AppSize.w26,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    MyNetworkImage(
                      url: eventIcon,
                      height: AppSize.h16,
                      width: AppSize.w16,
                    ),
                    const SizedBox(width: 10),
                  ],
                )
              : const SizedBox.shrink(),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: ColorManager.instance.secondary),
          child: Center(
            child: Text(
              minute ?? '0',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: FontSize.fontSize9,
                    color: ColorManager.instance.white,
                  ),
            ),
          ),
        ),
        Expanded(
          child: isHome
              ? const SizedBox.shrink()
              : Row(
                  children: <Widget>[
                    const SizedBox(width: 10),
                    MyNetworkImage(
                      url: eventIcon,
                      height: AppSize.h16,
                      width: AppSize.w16,
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.all(2),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorManager.instance.green),
                        shape: BoxShape.circle,
                        color: ColorManager.instance.transparent,
                      ),
                      child: Center(
                        child: MyNetworkImage(
                          url: playerUrl,
                          height: AppSize.h26,
                          width: AppSize.w26,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        name ?? 'player',
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: FontSize.fontSize9,
                              color: ColorManager.instance.secondary,
                            ),
                      ),
                    )
                  ],
                ),
        ),
      ],
    );
  }
}
