import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/view/global_widgets/app_loading.dart';
import 'package:taktikat/feature/view/screens/app/user_pereferances/widgets/preference_item.dart';
import 'package:taktikat/feature/view_model/home_view_model.dart';

import '../../../../../../utils/constants/const_svgs.dart';
import '../../../../../../utils/localization/string_keys.dart';
import '../../../../../../utils/utils/utils.dart';
import '../../../../../core/theme/color/color_manager.dart';
import '../../../../../core/theme/size/app_size.dart';
import '../../../../../core/theme/text_theme/text_font_size.dart';
import '../../../../../model/enums/border_types.dart';
import '../../../../../model/enums/preferences_types.dart';
import '../../../../global_widgets/custom_text_field.dart';
import '../../../../global_widgets/text_button_with_point.dart';

class FavoriteTeam extends StatefulWidget {
  const FavoriteTeam({
    Key? key,
    this.hasBackButton = false,
  }) : super(key: key);

  final bool hasBackButton;
  @override
  State<FavoriteTeam> createState() => _FavoriteTeamState();
}

class _FavoriteTeamState extends State<FavoriteTeam> {
  static Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _debounce = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<HomeViewModel>(builder: (logic) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    Utils.instance.isArabic() ? ConstSvg.logo : ConstSvg.logoEn,
                    height: AppSize.h24,
                    width: AppSize.w24,
                  ),
                  if (widget.hasBackButton) ...[
                    const Spacer(),
                    const BackButton(),
                  ],
                ],
              ),
              const SizedBox(height: 20),
              Text(
                StringKeys.singleton.favoriteTeams.tr,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: FontSize.fontSize18,
                      color: ColorManager.instance.primary,
                    ),
              ),
              const SizedBox(height: 10),
              CustomTextFormFiled(
                hint: StringKeys.singleton.search.tr,
                borderType: BorderTypes.outline,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                icon: Row(
                  children: [
                    const SizedBox(width: 10),
                    SvgPicture.asset(
                      ConstSvg.search,
                    ),
                  ],
                ),
                onChanged: (value) {
                  if (_debounce?.isActive ?? false) {
                    _debounce?.cancel();
                  }
                  _debounce = Timer(const Duration(milliseconds: 500), () {
                    logic.isSearchResult = true;
                    logic.getUserPreferences(search: value ?? '');
                  });
                  return;
                },
              ),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  TextButtonWithPoint(
                    isActive:
                        logic.selectedFavoriteTeamsTab == 0 ? true : false,
                    onPressed: () => logic.changeSelectedFavoriteTeamsTab(0),
                    text: StringKeys.singleton.team.tr,
                  ),
                  const SizedBox(width: 10),
                  TextButtonWithPoint(
                    isActive:
                        logic.selectedFavoriteTeamsTab == 1 ? true : false,
                    onPressed: () => logic.changeSelectedFavoriteTeamsTab(1),
                    text: StringKeys.singleton.nationalTeam.tr,
                  )
                ],
              ),
              const SizedBox(height: 5),
              if (logic.isLoading) ...[
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: AppLoading(isCenter: true),
                )
              ] else ...[
                GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: AppSize.h134,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: logic.favoriteTeams()?.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return PreferencesItem(
                        onTap: () {
                          logic.togglePreferences(
                            preferenceType: logic.selectedFavoriteTeamsTab == 1
                                ? PreferencesTypes.nationalTeam
                                : PreferencesTypes.team,
                            id: logic.favoriteTeams()?[index].id ?? -1,
                          );
                        },
                        image: logic.favoriteTeams()?[index].image ?? '',
                        title: logic.favoriteTeams()?[index].title ?? '',
                        isFilled: logic.checkIfSelectedTeam(
                          id: logic.favoriteTeams()?[index].id ?? -1,
                          l1: logic.preferenceTeams,
                        ),
                      );
                    })
              ],
            ],
          );
        }),
      ),
    );
  }
}
