import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/core/theme/size/app_size.dart';
import 'package:taktikat/feature/core/theme/text_theme/text_font_size.dart';
import 'package:taktikat/feature/view_model/match_view_model.dart';

import '../../../../../../../utils/constants/const_svgs.dart';
import '../../../../../../core/theme/color/color_manager.dart';
import '../../../../../../model/enums/preferences_types.dart';
import '../../../../../global_widgets/my_network_image.dart';
import '../../../../../global_widgets/swipe_button.dart';
import '../../../../../global_widgets/swipe_menu.dart';

class FavoriteLeagueTitle extends StatelessWidget {
  final String? logo;
  final String? title;
  final int? competitionId;
  final bool isSwappable;
  final PreferencesTypes preferencesTypes;

  const FavoriteLeagueTitle({
    super.key,
    this.competitionId,
    this.logo,
    this.title,
    this.isSwappable = false,
    required this.preferencesTypes,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatchViewModel>(builder: (logic) {
      return SwipeMenu(
        offset: isSwappable ? 0.15 : 0.0,
        menuItems: [
          SwipeButton(
            title: '',
            iconPath: ConstSvg.delete,
            backgroundColor: ColorManager.instance.primary,
            onTap: () {
              logic.removePreferencesFromFavorite(
                  preferenceType: preferencesTypes, id: competitionId ?? -1);
              // logic.togglePreferences(preferenceType: preferenceType, id: id);
            },
          )
        ],
        child: Container(
          margin: const EdgeInsets.all(8),
          child: Material(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(AppSize.r8),
            child: InkWell(
              borderRadius: BorderRadius.circular(AppSize.r8),
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Row(
                  children: [
                    MyNetworkImage(
                      url: logo,
                      width: AppSize.w34,
                      height: AppSize.h34,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text('$title',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(
                                fontSize: FontSize.fontSize13,
                                color: Theme.of(context).colorScheme.secondary,
                              )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
