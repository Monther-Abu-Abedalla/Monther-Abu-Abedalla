import 'package:flutter/material.dart';
import 'package:taktikat/feature/core/theme/size/app_size.dart';

import '../../../../global_widgets/my_network_image.dart';

class TeamSection extends StatelessWidget {
  const TeamSection({
    super.key,
    required this.teamName,
    required this.teamLogo,
    required this.isHome,
  });

  final String teamName;
  final String teamLogo;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    if (isHome) {
      return Expanded(
        child: Row(
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                teamName,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                maxLines: 2,
              ),
            ),
            const SizedBox(width: 10),
            MyNetworkImage(
              url: teamLogo,
              height: AppSize.h28,
              width: AppSize.w28,
            ),
          ],
        ),
      );
    } else {
      return Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MyNetworkImage(
              url: teamLogo,
              height: AppSize.h28,
              width: AppSize.w28,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                teamName,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                maxLines: 2,
              ),
            ),
          ],
        ),
      );
    }
  }
}
