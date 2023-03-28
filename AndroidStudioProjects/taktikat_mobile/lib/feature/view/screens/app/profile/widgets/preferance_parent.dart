import 'package:flutter/material.dart';
import 'package:taktikat/feature/core/theme/text_theme/text_font_size.dart';
import 'package:taktikat/feature/model/models/profile/profile_preference.dart';

import '../../../../../core/theme/color/color_manager.dart';
import '../../../../../core/theme/size/app_size.dart';
import '../../../../global_widgets/my_network_image.dart';

class PreferenceParent extends StatelessWidget {
  const PreferenceParent({
    super.key,
    required this.label,
    required this.preferences,
    required this.onClicked,
    required this.onAddClicked,
  });

  final String label;
  final List<ProfilePreference> preferences;
  final Function(ProfilePreference) onClicked;
  final Function() onAddClicked;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: FontSize.fontSize16,
                color: Theme.of(context).primaryColor,
              ),
        ),
        const SizedBox(height: 16),
        if (preferences.isEmpty) ...[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                color: ColorManager.instance.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(AppSize.r8),
                  onTap: onAddClicked,
                  child: Container(
                    width: AppSize.w50,
                    height: AppSize.h50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorManager.instance.dividerColor,
                    ),
                    child: Icon(
                      Icons.add,
                      size: FontSize.fontSize30,
                      color: ColorManager.instance.textHintColor,
                    ),
                  ),
                ),
              ),
            ],
          )
        ] else ...[
          GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: AppSize.w100,
                  mainAxisExtent: AppSize.h90,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7),
              itemCount: preferences.length,
              itemBuilder: (BuildContext ctx, index) {
                if (preferences[index].id == -2) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: AppSize.w50,
                        height: AppSize.h50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorManager.instance.dividerColor,
                        ),
                        child: Center(
                          child: Text(
                            '${preferences.length - 6}+',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    color: ColorManager.instance.textHintColor,
                                    fontSize: FontSize.fontSize12),
                            maxLines: 1,
                            softWrap: true,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  );
                }

                if (preferences[index].id == -1) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        color: ColorManager.instance.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(AppSize.r8),
                          onTap: onAddClicked,
                          child: Container(
                            width: AppSize.w50,
                            height: AppSize.h50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorManager.instance.dividerColor,
                            ),
                            child: Icon(
                              Icons.add,
                              size: FontSize.fontSize30,
                              color: ColorManager.instance.textHintColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }

                return Material(
                  color: ColorManager.instance.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(AppSize.r8),
                    onTap: () {
                      onClicked(preferences[index]);
                    },
                    child: Column(
                      children: [
                        const SizedBox(height: 4),
                        Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 2,
                                      color:
                                          ColorManager.instance.transparent)),
                              child: MyNetworkImage(
                                url: preferences[index].model?.image ?? '',
                                width: AppSize.w38,
                                height: AppSize.h38,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).primaryColor,
                                ),
                                child: Icon(
                                  Icons.close,
                                  color: ColorManager.instance.white,
                                  size: 10,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          preferences[index].model?.name ?? '',
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                          softWrap: true,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              })
        ],
      ],
    );
  }
}
