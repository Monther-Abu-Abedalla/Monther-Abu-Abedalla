import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taktikat/utils/constants/const_svgs.dart';

import '../../../../../../core/theme/color/color_manager.dart';
import '../../../../../../core/theme/size/app_size.dart';
import '../../../../../../core/theme/text_theme/text_font_size.dart';
import '../../../../../global_widgets/my_network_image.dart';

class MatchPenaltiesBox extends StatelessWidget {
  final bool isHome;
  final String? name;
  final String? playerUrl;
  final bool penaltyStatus;

  const MatchPenaltiesBox({
    Key? key,
    required this.isHome,
    this.name,
    this.penaltyStatus = false,
    this.playerUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: isHome
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      name ?? 'player',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: FontSize.fontSize11,
                            color: ColorManager.instance.secondary,
                          ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary),
                          shape: BoxShape.circle,
                          color: ColorManager.instance.transparent),
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
                  ],
                )
              : const SizedBox.shrink(),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: ColorManager.instance.hintColor),
          child: Center(
            child: SvgPicture.asset(
                penaltyStatus ? ConstSvg.penaltiesIn : ConstSvg.penaltiesOut),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: isHome
              ? const SizedBox.shrink()
              : Row(
                  children: <Widget>[
                    const SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary),
                          shape: BoxShape.circle,
                          color: ColorManager.instance.transparent),
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
                    Text(
                      name ?? 'player',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: FontSize.fontSize11,
                            color: ColorManager.instance.secondary,
                          ),
                    )
                  ],
                ),
        ),
      ],
    );
  }
}
