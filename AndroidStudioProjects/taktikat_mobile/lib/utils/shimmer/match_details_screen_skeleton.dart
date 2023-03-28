import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../feature/core/theme/color/color_manager.dart';
import '../../feature/core/theme/size/app_size.dart';
import '../../feature/view/global_widgets/app_loading.dart';
import '../constants/const_gifs.dart';
import '../constants/const_images.dart';
import '../constants/const_svgs.dart';
import '../constants/custome_Svg.dart';

class MatchDetailsScreenSkeleton extends StatelessWidget {
  const MatchDetailsScreenSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(AppSize.r10),
      ),
      child: ListView(
        children: [
          ClipRect(
              child: DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ConstImages.matchBackground),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 40),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            const Color(0xFF000000).withOpacity(0.1),
                        radius: AppSize.r28,
                        child: ClipOval(
                          child: Image.asset(
                            ConstGifs.skeleton,
                            fit: BoxFit.cover,
                            height: AppSize.h56,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(AppSize.r10),
                        child: Image.asset(
                          ConstGifs.skeleton,
                          fit: BoxFit.cover,
                          height: AppSize.h10,
                          width: AppSize.w45,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(AppSize.r10),
                        child: Image.asset(
                          ConstGifs.skeleton,
                          fit: BoxFit.cover,
                          width: AppSize.w40,
                          height: AppSize.h12,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(AppSize.r10),
                        child: Image.asset(
                          ConstGifs.skeleton,
                          fit: BoxFit.cover,
                          width: AppSize.w60,
                          height: AppSize.h12,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            const Color(0xFF000000).withOpacity(0.1),
                        radius: AppSize.r28,
                        child: ClipOval(
                          child: Image.asset(
                            ConstGifs.skeleton,
                            fit: BoxFit.cover,
                            height: AppSize.h56,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(AppSize.r10),
                        child: Image.asset(
                          ConstGifs.skeleton,
                          fit: BoxFit.cover,
                          height: AppSize.h10,
                          width: AppSize.w45,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 40),
                ],
              ),
              const SizedBox(height: 50),
            ]),
          )),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorManager.instance.primaryContainer,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              boxShadow: const [
                BoxShadow(
                    color: Color(0x33000000),
                    offset: Offset(0, 2),
                    spreadRadius: 1,
                    blurRadius: 1),
              ],
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // automaticIndicatorColorAdjustment: false,
                // labelPadding: const EdgeInsets.symmetric(vertical: 10),
                // indicatorSize: TabBarIndicatorSize.label,
                // indicator: TabIndicator(),
                children: [
                  SvgPicture.asset(
                    ConstSvg.stats,
                    height: AppSize.h20,
                    colorFilter: ColorFilter.mode(
                      ColorManager.instance.unselectedText,
                      BlendMode.srcIn,
                    ),
                  ),
                  SvgPicture.asset(
                    ConstSvg.menu,
                    height: AppSize.h16,
                    colorFilter: ColorFilter.mode(
                      ColorManager.instance.unselectedText,
                      BlendMode.srcIn,
                    ),
                  ),
                  SvgPicture.string(
                    CustomSvg.instance.confrontations(
                        colorId: CustomSvg.instance.iconNotSelected),
                    height: AppSize.h20,
                  ),
                  SvgPicture.string(
                    CustomSvg.instance
                        .lineUp(colorId: CustomSvg.instance.iconNotSelected),
                    height: AppSize.h20,
                  ),
                  SvgPicture.asset(ConstSvg.playground,
                      height: AppSize.h20,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).primaryColor,
                        BlendMode.srcIn,
                      )),
                ],
              ),
            ),
          ),
          const AppLoading(),
        ],
      ),
    );
  }
}
