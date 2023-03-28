import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../utils/constants/const_svgs.dart';
import '../../../../../../core/theme/color/color_manager.dart';
import '../../../../../../core/theme/size/app_size.dart';
import '../../../../../../core/theme/text_theme/text_font_size.dart';
import '../../../../../global_widgets/my_network_image.dart';

class MatchSubstitutionBox extends StatelessWidget {
  final bool isHome;
  final String? playerIn;
  final String? playerOut;
  final String? playerInUrl;
  final String? playerOutUrl;
  final String? minute;

  const MatchSubstitutionBox(
      {Key? key,
      required this.isHome,
      this.playerIn,
      this.playerOut,
      this.playerInUrl,
      this.playerOutUrl,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            playerIn ?? 'player',
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: FontSize.fontSize8,
                                  color: ColorManager.instance.green,
                                ),
                          ),
                          Text(
                            playerOut ?? 'player',
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: FontSize.fontSize8,
                                  color: ColorManager.instance.red,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Stack(
                      children: [
                        const SizedBox(width: 45),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorManager.instance.red,
                              ),
                              shape: BoxShape.circle,
                              color: ColorManager.instance.transparent),
                          child: Center(
                            child: MyNetworkImage(
                              url: playerOutUrl,
                              height: AppSize.h26,
                              width: AppSize.w26,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        PositionedDirectional(
                          start: 15,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorManager.instance.green),
                                shape: BoxShape.circle,
                                color: ColorManager.instance.transparent),
                            child: Center(
                              child: MyNetworkImage(
                                url: playerInUrl,
                                height: AppSize.h26,
                                width: AppSize.w26,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 12),
                    SvgPicture.asset(ConstSvg.substitution),
                    const SizedBox(width: 12),
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
                    const SizedBox(width: 12),
                    SvgPicture.asset(ConstSvg.substitution),
                    const SizedBox(width: 12),
                    Stack(
                      children: [
                        const SizedBox(width: 45),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorManager.instance.red,
                              ),
                              shape: BoxShape.circle,
                              color: ColorManager.instance.transparent),
                          child: Center(
                            child: MyNetworkImage(
                              url: playerOutUrl,
                              height: AppSize.h26,
                              width: AppSize.w26,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        PositionedDirectional(
                          start: 15,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorManager.instance.green),
                                shape: BoxShape.circle,
                                color: ColorManager.instance.transparent),
                            child: Center(
                              child: MyNetworkImage(
                                url: playerInUrl,
                                height: AppSize.h26,
                                width: AppSize.w26,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            playerIn ?? 'player',
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: FontSize.fontSize8,
                                  color: ColorManager.instance.green,
                                ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            playerOut ?? 'player',
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: FontSize.fontSize8,
                                  color: ColorManager.instance.red,
                                ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ],
    );
  }
}
