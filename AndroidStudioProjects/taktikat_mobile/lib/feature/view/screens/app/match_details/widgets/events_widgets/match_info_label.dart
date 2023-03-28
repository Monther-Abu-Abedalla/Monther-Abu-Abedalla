import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taktikat/utils/constants/const_svgs.dart';

import '../../../../../../core/theme/color/color_manager.dart';
import '../../../../../../core/theme/size/app_size.dart';

class MatchInfoLabel extends StatelessWidget {
  const MatchInfoLabel({
    super.key,
    required this.label,
    this.svgPath,
    this.haveSvg = true,
    this.mainAxisAlignment,
    this.isTextExpaded = false,
  });

  final String label;
  final String? svgPath;
  final bool haveSvg;
  final MainAxisAlignment? mainAxisAlignment;
  final bool isTextExpaded;

  @override
  Widget build(BuildContext context) {
    return isTextExpaded
        ? Expanded(
            child: Row(
              children: [
                SizedBox(
                  height: AppSize.h16,
                  width: AppSize.w16,
                ),
                Expanded(
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorManager.instance.dashColor,
                        ),
                    maxLines: 1,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          )
        : Row(
            children: [
              if (haveSvg) ...[
                const SizedBox(
                  width: 10,
                ),
              ],
              if (!haveSvg) ...[
                SizedBox(
                  height: AppSize.h16,
                  width: AppSize.w16,
                ),
              ] else ...[
                SvgPicture.asset(
                  svgPath ?? ConstSvg.staduim,
                ),
                const SizedBox(width: 15),
              ],
              Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorManager.instance.dashColor,
                    ),
                maxLines: 1,
                textAlign: TextAlign.start,
              ),
            ],
          );
  }
}
