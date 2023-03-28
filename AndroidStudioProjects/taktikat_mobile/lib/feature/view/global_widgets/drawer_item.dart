import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/theme/color/color_manager.dart';
import '../../core/theme/size/app_size.dart';
import '../../core/theme/text_theme/text_font_size.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final String icon;
  final Function() onTap;
  final Widget? trailing;

  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            ListTile(
              title: Row(
                children: [
                  SvgPicture.asset(
                    icon,
                    colorFilter: ColorFilter.mode(
                      ColorManager.instance.unselectedText,
                      BlendMode.srcIn,
                    ),
                    height: AppSize.h16,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: FontSize.fontSize12,
                          color: ColorManager.instance.secondary,
                        ),
                  )
                ],
              ),
              trailing: trailing,
            ),
            Divider(
                height: 2,
                thickness: 1,
                color: ColorManager.instance.dividerColor)
          ],
        ),
      ),
    );
  }
}
