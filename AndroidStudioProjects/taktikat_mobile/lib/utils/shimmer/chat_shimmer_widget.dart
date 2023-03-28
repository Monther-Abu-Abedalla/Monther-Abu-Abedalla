import 'package:flutter/material.dart';
import 'package:taktikat/feature/core/theme/size/app_size.dart';
import 'package:taktikat/utils/shimmer/shimmer_widgets/shimer_user_item_widget.dart';

import '../constants/const_gifs.dart';

class ChatShimmer extends StatelessWidget {
  static final colorContainerGray = const Color(0xFF000000).withOpacity(0.1);

  const ChatShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 15),
              const ShimmerUserItemWidget(),
              const SizedBox(height: 15),
              const ShimmerUserItemWidget(),
              const SizedBox(height: 15),
              reverseUserItemWidget,
              const SizedBox(height: 15),
              const ShimmerUserItemWidget(),
              const SizedBox(height: 15),
              reverseUserItemWidget,
              const SizedBox(height: 15),
              reverseUserItemWidget,
              const SizedBox(height: 15),
            ],
          ),
        ),
      ],
    );
  }

  Widget get reverseUserItemWidget => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
                      height: AppSize.h16,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              CircleAvatar(
                backgroundColor: colorContainerGray,
                radius: AppSize.r10,
                child: ClipOval(
                  child: Image.asset(
                    ConstGifs.skeleton,
                    fit: BoxFit.cover,
                    height: AppSize.h70,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20)
        ],
      );
}
