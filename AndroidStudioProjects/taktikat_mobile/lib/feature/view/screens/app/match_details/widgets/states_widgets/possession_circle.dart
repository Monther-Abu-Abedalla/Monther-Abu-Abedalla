import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/core/theme/color/color_manager.dart';
import 'package:taktikat/feature/core/theme/size/app_size.dart';
import 'package:taktikat/utils/utils/utils.dart';

import '../../../../../../../utils/localization/string_keys.dart';
import '../../../../../global_widgets/my_network_image.dart';

class PossessionCircle extends StatelessWidget {
  const PossessionCircle({
    super.key,
    required this.awayPercent,
    required this.homePercent,
    required this.homeLogo,
    required this.awayLogo,
  });
  final double awayPercent;
  final double homePercent;
  final String homeLogo;
  final String awayLogo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.h140,
      width: AppSize.h140,
      child: Stack(
        children: [
          Positioned.fill(
            child: RotatedBox(
              quarterTurns: Utils.instance.isArabic() ? 2 : 0,
              child: CircularProgressIndicator(
                value: awayPercent / 100,
                strokeWidth: 5,
                backgroundColor: ColorManager.instance.possessionBlue,
                valueColor: AlwaysStoppedAnimation<Color>(
                  ColorManager.instance.possessionRed,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringKeys.singleton.possession.tr,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorManager.instance.dashColor,
                      ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      color: ColorManager.instance.transparent,
                      borderRadius: BorderRadius.circular(AppSize.r8),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(AppSize.r8),
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              MyNetworkImage(
                                url: homeLogo,
                                height: AppSize.h30,
                                width: AppSize.w30,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${homePercent.floor()}%',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          ColorManager.instance.possessionBlue,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Material(
                      color: ColorManager.instance.transparent,
                      borderRadius: BorderRadius.circular(AppSize.r8),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(AppSize.r8),
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              MyNetworkImage(
                                url: awayLogo,
                                height: AppSize.h30,
                                width: AppSize.w30,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${awayPercent.floor()}%',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          ColorManager.instance.possessionRed,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
