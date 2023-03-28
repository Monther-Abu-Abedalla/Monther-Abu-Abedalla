import 'package:flutter/material.dart';
import 'package:taktikat/feature/core/theme/color/color_manager.dart';
import 'package:taktikat/feature/core/theme/size/app_size.dart';

import '../../../../../global_widgets/my_network_image.dart';

class BenchItem extends StatelessWidget {
  const BenchItem({
    super.key,
    this.image,
    this.name,
  });

  final String? image;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorManager.instance.transparent,
      borderRadius: BorderRadius.circular(AppSize.r10),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSize.r10),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Row(
            children: [
              CircleAvatar(
                radius: AppSize.r20,
                backgroundColor: ColorManager.instance.hintColor,
                child: MyNetworkImage(
                  url: image,
                  width: AppSize.w40,
                  height: AppSize.h40,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  name ?? '',
                  style: TextStyle(
                    color: ColorManager.instance.dashColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
