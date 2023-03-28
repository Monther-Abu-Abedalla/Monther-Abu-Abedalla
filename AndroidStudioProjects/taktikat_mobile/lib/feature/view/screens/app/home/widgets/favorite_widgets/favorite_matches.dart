import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../utils/shimmer/home_screen_skeleton.dart';
import '../../../../../../view_model/match_view_model.dart';
import 'favorite_body.dart';

class FavoriteMatches extends StatelessWidget {
  const FavoriteMatches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatchViewModel>(
      builder: (logic) {
        if (logic.isLoading) {
          return const Center(child: HomeScreenSkeleton());
        }
        return const FavoriteBody();
      },
    );
  }
}
