import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taktikat/feature/core/theme/size/app_size.dart';
import 'package:taktikat/utils/utils/utils.dart';

import '../../../../../../../utils/constants/const_svgs.dart';
import '../../../../../global_widgets/my_network_image.dart';

class PlayerInFormation extends StatelessWidget {
  const PlayerInFormation({
    super.key,
    required this.name,
    required this.image,
    required this.myIndexInRow,
    required this.totalRowsIndex,
    required this.onTap,
    this.rating,
    this.numberOfGoals = 0,
    this.numberOfYellowCards = 0,
    this.numberOfRedCards = 0,
  });

  final String name;
  final String image;
  final int myIndexInRow;
  final int totalRowsIndex;
  final Function() onTap;
  final String? rating;
  final int? numberOfYellowCards;
  final int? numberOfRedCards;
  final int? numberOfGoals;

  @override
  Widget build(BuildContext context) {
    EdgeInsets margin = EdgeInsets.zero;

    if (myIndexInRow == -1) {
      margin = const EdgeInsets.only(bottom: 40);
    } else if (myIndexInRow == 0) {
      margin = const EdgeInsets.only(bottom: 10);
    } else if (myIndexInRow == totalRowsIndex - 1) {
      margin = const EdgeInsets.only(bottom: 10);
    }

    return Container(
      margin: margin,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 4),
            Stack(
              children: [
                Container(
                  width: AppSize.w60,
                  height: AppSize.h60,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onPrimary,
                      width: 2,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: MyNetworkImage(
                    url: image,
                    width: AppSize.w40,
                    height: AppSize.h40,
                    shape: BoxShape.circle,
                  ),
                ),
                if (numberOfGoals != 0) ...[
                  PositionedDirectional(
                    bottom: 10,
                    end: 0,
                    child: SvgPicture.asset(
                      ConstSvg.whiteBall,
                      height: AppSize.h12,
                      width: AppSize.w12,
                    ),
                  ),
                ],
                if (numberOfRedCards != 0) ...[
                  PositionedDirectional(
                    bottom: 5,
                    start: 10,
                    child: SvgPicture.asset(
                      ConstSvg.redCard,
                      height: AppSize.h12,
                      width: AppSize.w12,
                    ),
                  ),
                ] else if (numberOfYellowCards != 0) ...[
                  PositionedDirectional(
                    bottom: 5,
                    start: 10,
                    child: SvgPicture.asset(
                      ConstSvg.yellowCard,
                      height: AppSize.h12,
                      width: AppSize.w12,
                    ),
                  ),
                ],
                if (rating != null && (rating ?? '').isNotEmpty) ...[
                  PositionedDirectional(
                    top: 0,
                    end: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Utils.instance
                              .getPlayerColorByRating(rating: rating),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(AppSize.r4)),
                      child: Text(
                        '$rating',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Theme.of(context).colorScheme.background,
                            ),
                      ),
                    ),
                  )
                ],
              ],
            ),
            const SizedBox(height: 4),
            Text(
              name,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.background,
                  ),
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
