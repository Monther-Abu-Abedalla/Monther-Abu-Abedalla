import 'dart:ui';

import 'package:flutter/material.dart';
import '../../../../../../../utils/constants/const_images.dart';
import '../../../../../../core/theme/color/color_manager.dart';
import '../../../../../../core/theme/size/app_size.dart';
import '../../../../../../core/theme/text_theme/text_font_size.dart';
import '../../../../../../model/enums/match_status.dart';
import '../../../../../../model/models/match_details/match_details_model.dart';
import '../../../../../global_widgets/my_network_image.dart';

class CustomFlexibleSpace extends StatelessWidget {
  const CustomFlexibleSpace({
    Key? key,
    required this.titleOpacity,
    required this.matchDetails,
  }) : super(key: key);
  final MatchDetails? matchDetails;
  final double titleOpacity;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ConstImages.matchBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: titleOpacity * 10,
            sigmaY: titleOpacity * 10,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FractionalTranslation(
              translation: Offset(
                0,
                (1 - titleOpacity),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: MyNetworkImage(
                      url: matchDetails?.homeTeam?.logo,
                      width: AppSize.w50,
                      height: AppSize.h50,
                    ),
                  ),
                  const SizedBox(width: 10),
                  if (matchDetails?.statusValue ==
                      MatchStatus.matchFinished.value) ...[
                    Text(matchDetails?.homeScore ?? '0',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: FontSize.fontSize30,
                              color: ColorManager.instance.white,
                            ))
                  ],
                  const SizedBox(width: 10),
                  if (matchDetails?.statusValue ==
                      MatchStatus.notStarted.value) ...[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MyNetworkImage(
                          url: matchDetails?.league?.logo,
                          width: AppSize.w50,
                          height: AppSize.h50,
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                              color: ColorManager.instance.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                              matchDetails?.status ??
                                  MatchStatus.notStarted.value,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: FontSize.fontSize8,
                                    color: ColorManager.instance.black,
                                  )),
                        ),
                      ],
                    )
                  ] else if (matchDetails?.statusValue ==
                      MatchStatus.matchFinished.value) ...[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MyNetworkImage(
                          url: matchDetails?.league?.logo,
                          width: AppSize.w50,
                          height: AppSize.h50,
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                              color: ColorManager.instance.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                              matchDetails?.status ??
                                  MatchStatus.notStarted.value,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: FontSize.fontSize8,
                                    color: ColorManager.instance.black,
                                  )),
                        ),
                      ],
                    )
                  ] else ...[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MyNetworkImage(
                          url: matchDetails?.league?.logo,
                          width: AppSize.w50,
                          height: AppSize.h50,
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                              color: ColorManager.instance.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                              matchDetails?.status ??
                                  MatchStatus.notStarted.value,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: FontSize.fontSize8,
                                    color: ColorManager.instance.black,
                                  )),
                        ),
                      ],
                    )
                  ],
                  if (matchDetails?.statusValue ==
                      MatchStatus.matchFinished.value) ...[
                    Text(matchDetails?.awayScore ?? '0',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: FontSize.fontSize30,
                              color: ColorManager.instance.white,
                            ))
                  ],
                  const SizedBox(width: 10),
                  Expanded(
                    child: MyNetworkImage(
                      url: matchDetails?.awayTeam?.logo,
                      width: AppSize.w50,
                      height: AppSize.h50,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
