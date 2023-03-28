import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/core/theme/size/app_size.dart';
import 'package:taktikat/feature/view_model/match_detail_view_model.dart';
import 'package:taktikat/utils/constants/const_svgs.dart';

class DraggableWidget extends StatelessWidget {
  const DraggableWidget({
    super.key,
  });

  static final MatchDetailViewModel matchDetailViewModel =
      Get.find<MatchDetailViewModel>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatchDetailViewModel>(
      builder: (_) {
        matchDetailViewModel.maxSwipeDistance =
            MediaQuery.of(Get.context!).size.width / 3;
       final double animatedPositionX = matchDetailViewModel.positionX.clamp(
          -matchDetailViewModel.maxSwipeDistance,
          matchDetailViewModel.maxSwipeDistance,
        );


        return InkWell(
          onTap: () {
            matchDetailViewModel.onPanEnd(DragEndDetails());
          },
          borderRadius: BorderRadius.circular(AppSize.r20),
          child: GestureDetector(
            onPanStart: matchDetailViewModel.onPanStart,
            onPanUpdate: matchDetailViewModel.onPanUpdate,
            onPanEnd: matchDetailViewModel.onPanEnd,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                transform: Matrix4.translationValues(
                  animatedPositionX,
                  0,
                  0,
                ),
                child: SvgPicture.asset(
                  ConstSvg.ball,
                  width: AppSize.w60,
                  height: AppSize.w60,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
