import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/view/screens/app/profile/widgets/profile_form.dart';
import 'package:taktikat/feature/view/screens/app/profile/widgets/profile_header.dart';
import 'package:taktikat/feature/view/screens/app/profile/widgets/user_preferance_section.dart';
import 'package:taktikat/utils/localization/string_keys.dart';
import 'package:taktikat/utils/shared/shared_prefs.dart';

import '../../../../core/theme/color/color_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const ProfileHeader(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            color: ColorManager.instance.primaryContainer,
            child: ListView(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              children: [
                const SizedBox(height: 30),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringKeys.singleton.welcome.tr,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          SharedPrefs.instance.getUserData()?.username ?? '',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringKeys.singleton.totalPoints.tr,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '0',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const ProfileForm(),
                const SizedBox(height: 30),
                const UserPreferenceSection(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
