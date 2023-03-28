import 'package:flutter/material.dart';

import '../../feature/core/theme/color/color_manager.dart';
import '../../feature/core/theme/size/app_size.dart';
import '../constants/const_gifs.dart';
import '../utils/shimmer_loading.dart';

class WhoWillWinSkeleton extends StatelessWidget {
  const WhoWillWinSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(AppSize.r10),
        ),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            skeletonCompetitionItem,
            const SizedBox(height: 20),
            skeletonCompetitionResult,
            const SizedBox(height: 20),
            skeletonCompetitionItem,
            const SizedBox(height: 20),
            skeletonCompetitionResult,
            const SizedBox(height: 20),
            skeletonCompetitionItem,
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget get skeletonCompetitionResult => Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.r10),
                  child: Image.asset(
                    ConstGifs.skeleton,
                    fit: BoxFit.cover,
                    width: AppSize.w70,
                    height: AppSize.h18,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              CircleAvatar(
                backgroundColor: const Color(0xFF000000).withOpacity(0.1),
                radius: AppSize.r18,
                child: ClipOval(
                  child: Image.asset(
                    ConstGifs.skeleton,
                    fit: BoxFit.cover,
                    height: AppSize.h40,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.r10),
                child: Image.asset(
                  ConstGifs.skeleton,
                  fit: BoxFit.cover,
                  width: AppSize.w40,
                  height: AppSize.h12,
                ),
              ),
              const SizedBox(width: 10),
              CircleAvatar(
                backgroundColor: const Color(0xFF000000).withOpacity(0.1),
                radius: AppSize.r18,
                child: ClipOval(
                  child: Image.asset(
                    ConstGifs.skeleton,
                    fit: BoxFit.cover,
                    height: AppSize.h40,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.r10),
                  child: Image.asset(
                    ConstGifs.skeleton,
                    fit: BoxFit.cover,
                    width: AppSize.w70,
                    height: AppSize.h18,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Divider(
            indent: 12,
            endIndent: 12,
            thickness: 3,
            color: ColorManager.instance.unselectedText.withOpacity(0.3),
          ),
        ],
      );
  Widget get skeletonCompetitionItem => Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.r10),
                  child: Image.asset(
                    ConstGifs.skeleton,
                    fit: BoxFit.cover,
                    width: AppSize.w70,
                    height: AppSize.h18,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              CircleAvatar(
                backgroundColor: const Color(0xFF000000).withOpacity(0.1),
                radius: AppSize.r18,
                child: ClipOval(
                  child: Image.asset(
                    ConstGifs.skeleton,
                    fit: BoxFit.cover,
                    height: AppSize.h40,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.r10),
                child: Image.asset(
                  ConstGifs.skeleton,
                  fit: BoxFit.cover,
                  width: AppSize.w40,
                  height: AppSize.h12,
                ),
              ),
              const SizedBox(width: 10),
              CircleAvatar(
                backgroundColor: const Color(0xFF000000).withOpacity(0.1),
                radius: AppSize.r18,
                child: ClipOval(
                  child: Image.asset(
                    ConstGifs.skeleton,
                    fit: BoxFit.cover,
                    height: AppSize.h40,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.r10),
                  child: Image.asset(
                    ConstGifs.skeleton,
                    fit: BoxFit.cover,
                    width: AppSize.w70,
                    height: AppSize.h18,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShimmerLoading(
                isLoading: true,
                linearGradient: _myLinearGradient,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.r10),
                  child: Image.asset(
                    ConstGifs.skeleton,
                    fit: BoxFit.cover,
                    height: AppSize.h30,
                    width: AppSize.w30,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              ShimmerLoading(
                isLoading: true,
                linearGradient: _myLinearGradient,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.r10),
                  child: Image.asset(
                    ConstGifs.skeleton,
                    fit: BoxFit.cover,
                    height: AppSize.h30,
                    width: AppSize.w50,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              ShimmerLoading(
                isLoading: true,
                linearGradient: _myLinearGradient,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.r10),
                  child: Image.asset(
                    ConstGifs.skeleton,
                    fit: BoxFit.cover,
                    height: AppSize.h30,
                    width: AppSize.w30,
                  ),
                ),
              ),
            ],
          )
        ],
      );

  static const _myLinearGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBEB),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBEA),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1, -0.3),
    end: Alignment(1, 0.3),
    tileMode: TileMode.clamp,
  );
}
