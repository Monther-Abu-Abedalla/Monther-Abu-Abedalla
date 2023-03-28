import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taktikat/feature/core/theme/size/app_size.dart';

class SvgInkWell extends StatelessWidget {
  const SvgInkWell({
    super.key,
    required this.svgPath,
    required this.onTap,
    this.height,
    this.width,
  });

  final String svgPath;
  final Function() onTap;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppSize.r12),
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SvgPicture.asset(
          svgPath,
          height: height ?? AppSize.h32,
          width: width ?? AppSize.w32,
        ),
      ),
    );
  }
}
