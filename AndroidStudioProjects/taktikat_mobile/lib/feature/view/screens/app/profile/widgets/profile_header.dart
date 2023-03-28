import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/view/screens/app/profile/widgets/top_fan.dart';
import 'package:taktikat/feature/view_model/profile_view_model.dart';
import 'package:taktikat/utils/shared/shared_prefs.dart';

import '../../../../../../utils/constants/const_images.dart';
import '../../../../../core/theme/color/color_manager.dart';
import '../../../../../core/theme/size/app_size.dart';
import '../../../../global_widgets/my_network_image.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      builder: (profile) {
        return Stack(
          children: [
            Container(
              height: AppSize.h260,
              color: ColorManager.instance.primaryContainer,
              margin: const EdgeInsets.symmetric(horizontal: 10),
            ),
            MyNetworkImage(
              height: AppSize.h200,
              width: double.infinity,
              url: SharedPrefs.instance.getUserTheme()?.bgImage,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(AppSize.r16),
              ),
            ),
            PositionedDirectional(
              bottom: 30,
              start: 30,
              child: InkWell(
                onTap: () => profile.getImage(),
                child: Container(
                  padding: const EdgeInsets.all(2),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: ColorManager.instance.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: 2, color: ColorManager.instance.unselectedText),
                  ),
                  child: profile.userImage != null && profile.userImage is File
                      ? Image.file(
                          profile.userImage!,
                          width: AppSize.w60,
                          height: AppSize.h60,
                          fit: BoxFit.cover,
                        )
                      : MyNetworkImage(
                          url: SharedPrefs.instance.getUserData()?.image ??
                              ConstImages.onlineTeamImage,
                          width: AppSize.w60,
                          height: AppSize.h60,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            PositionedDirectional(
              top: 20,
              start: 10,
              child: BackButton(
                color: Theme.of(context).colorScheme.background,
              ),
            ),
            const PositionedDirectional(
              bottom: 6,
              end: 0,
              child: TopFan(),
            ),
            PositionedDirectional(
              bottom: 0,
              end: 10,
              child: MyNetworkImage(
                url: ConstImages.onlineTeamImage,
                width: AppSize.w55,
                height: AppSize.h55,
              ),
            ),
          ],
        );
      },
    );
  }
}
