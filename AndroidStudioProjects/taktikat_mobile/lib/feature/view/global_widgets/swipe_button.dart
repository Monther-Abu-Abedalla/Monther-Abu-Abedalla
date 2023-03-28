import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/theme/color/color_manager.dart';
import '../../core/theme/size/app_size.dart';

class SwipeButton extends StatelessWidget {
  const SwipeButton(
      {super.key,
      required this.title,
      required this.iconPath,
      required this.onTap,
      this.backgroundColor});

  final String title;
  final String iconPath;
  final Function()? onTap;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(iconPath,
              height: AppSize.w20,
              width: AppSize.w20,
              colorFilter: ColorFilter.mode(
                backgroundColor ?? ColorManager.instance.unselectedText,
                BlendMode.srcIn,
              )),
        ],
      ),
    );
  }
}
