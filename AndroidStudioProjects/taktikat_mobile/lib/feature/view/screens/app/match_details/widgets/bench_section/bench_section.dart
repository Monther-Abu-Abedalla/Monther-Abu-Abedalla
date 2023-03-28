import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/view_model/match_detail_view_model.dart';
import 'package:taktikat/utils/localization/string_keys.dart';

import '../../../../../../core/theme/color/color_manager.dart';
import '../../../../../../core/theme/size/app_size.dart';
import '../../../../../../model/models/match_details/lineup/home.dart';
import 'bench_item.dart';

class BenchSection extends StatelessWidget {
  const BenchSection({
    super.key,
    required this.logic,
    this.home,
  });

  final MatchDetailViewModel logic;
  final Home? home;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(AppSize.r8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (home?.team?.coach != null) ...[
            Material(
              color: ColorManager.instance.hintColor,
              borderRadius: BorderRadius.circular(AppSize.r8),
              child: InkWell(
                borderRadius: BorderRadius.circular(AppSize.r8),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Text(
                    StringKeys.singleton.coach.tr,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            BenchItem(
              image: home?.team?.coach?.photo ?? '',
              name: home?.team?.coach?.name ?? '',
            ),
            const SizedBox(height: 20),
          ],
          if (home?.bench?.isNotEmpty == true) ...[
            Material(
              color: ColorManager.instance.hintColor,
              borderRadius: BorderRadius.circular(AppSize.r8),
              child: InkWell(
                borderRadius: BorderRadius.circular(AppSize.r8),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Text(
                    StringKeys.singleton.bench.tr,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListView.separated(
              shrinkWrap: true,
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: home?.bench?.length ?? 0,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                return BenchItem(
                  image: home?.bench?[index].image ?? '',
                  name: home?.bench?[index].name ?? '',
                );
              },
            ),
          ],
          if (home?.injuries?.isNotEmpty == true) ...[
            const SizedBox(height: 20),
            Material(
              color: ColorManager.instance.hintColor,
              borderRadius: BorderRadius.circular(AppSize.r8),
              child: InkWell(
                borderRadius: BorderRadius.circular(AppSize.r8),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Text(
                    StringKeys.singleton.injuries.tr,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListView.separated(
              shrinkWrap: true,
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: home?.injuries?.length ?? 0,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                return BenchItem(
                  image: home?.injuries?[index].player?.image ?? '',
                  name: home?.injuries?[index].player?.name ?? '',
                );
              },
            ),
          ]
        ],
      ),
    );
  }
}
