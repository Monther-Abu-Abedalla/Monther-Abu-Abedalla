import 'package:flutter/material.dart';
import 'package:taktikat/feature/core/theme/color/color_manager.dart';
import 'package:taktikat/feature/core/theme/size/app_size.dart';

import '../../../../../../core/theme/text_theme/text_font_size.dart';
import '../../../../../global_widgets/my_network_image.dart';

class TeamHeader extends StatelessWidget {
  const TeamHeader({
    super.key,
    required this.teamName,
    required this.teamLogo,
    this.isCollapsed = false,
  });

  final String teamName;
  final String teamLogo;
  final bool isCollapsed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorManager.instance.transparent,
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(AppSize.r10)),
        onTap: () {},
        child: SizedBox(
          height: 135,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyNetworkImage(
                  url: teamLogo,
                  width: AppSize.w50,
                  height: AppSize.h50,
                ),
                if (!isCollapsed) ...[
                  const SizedBox(height: 8),
                  Expanded(
                    child: Text(
                      teamName,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: FontSize.fontSize15,
                          color: Theme.of(context).colorScheme.background,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
