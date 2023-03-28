import 'package:flutter/material.dart';
import 'package:taktikat/feature/core/theme/size/app_size.dart';
import 'package:taktikat/utils/constants/const_gifs.dart';

class ShimmerUserItemWidget extends StatelessWidget {
  const ShimmerUserItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xFF000000).withOpacity(0.1),
              radius: AppSize.r32,
              child: ClipOval(
                child: Image.asset(
                  ConstGifs.skeleton,
                  fit: BoxFit.cover,
                  height: AppSize.h70,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.r10),
                  child: Image.asset(
                    ConstGifs.skeleton,
                    fit: BoxFit.cover,
                    width: AppSize.w190,
                    height: AppSize.h20,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16)
      ],
    );
  }
}
