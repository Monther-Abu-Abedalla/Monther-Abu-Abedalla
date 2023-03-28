import 'package:flutter/material.dart';

import '../../../feature/core/theme/size/app_size.dart';
import '../../constants/const_gifs.dart';

class CircleShimmer extends StatelessWidget {
  final double? radius;
  const CircleShimmer({Key? key, this.radius}) : super(key: key);
  static final colorContainerGray = const Color(0xFF000000).withOpacity(0.1);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: colorContainerGray,
      radius: radius ?? AppSize.r32,
      child: ClipOval(
        child: Image.asset(
          ConstGifs.skeleton,
          fit: BoxFit.cover,
          height: AppSize.h70,
        ),
      ),
    );
  }
}
