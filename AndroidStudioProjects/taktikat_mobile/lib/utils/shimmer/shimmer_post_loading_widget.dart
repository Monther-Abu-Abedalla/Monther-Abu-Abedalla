import 'package:flutter/material.dart';

import '../../feature/core/theme/size/app_size.dart';
import '../constants/const_gifs.dart';

class ShimmerLoadingPost extends StatelessWidget {
  final double? height;
  final double? width;
  const ShimmerLoadingPost({Key? key, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? AppSize.h120,
      width: width ?? AppSize.w300,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(AppSize.r10)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSize.r10),
        child: Image.asset(
          ConstGifs.skeleton,
          width: double.infinity,
          height: AppSize.h120,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
