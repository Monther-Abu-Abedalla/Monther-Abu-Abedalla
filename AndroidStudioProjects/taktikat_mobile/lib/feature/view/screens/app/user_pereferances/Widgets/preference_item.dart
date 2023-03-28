import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taktikat/feature/core/theme/size/app_size.dart';
import 'package:taktikat/utils/constants/const_svgs.dart';

import '../../../../global_widgets/my_network_image.dart';

class PreferencesItem extends StatelessWidget {
  const PreferencesItem({
    Key? key,
    required this.title,
    required this.image,
    required this.onTap,
    this.isFilled = false,
  }) : super(key: key);

  final String title;
  final String image;
  final Function() onTap;
  final bool isFilled;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSize.r10),
        onTap: () {
          onTap();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SvgPicture.asset(
              isFilled ? ConstSvg.selectedStar : ConstSvg.star,
              width: AppSize.w16,
              height: AppSize.h16,
            ),
            const SizedBox(height: 8),
            MyNetworkImage(
              url: image,
              width: AppSize.w44,
              height: AppSize.w44,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
              maxLines: 1,
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
