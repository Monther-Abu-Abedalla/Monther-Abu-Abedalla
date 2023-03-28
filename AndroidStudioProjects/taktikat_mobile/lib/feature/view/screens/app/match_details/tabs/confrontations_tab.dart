import 'package:flutter/material.dart';

import '../../../../../view_model/match_detail_view_model.dart';
import '../../../../global_widgets/app_loading.dart';
import '../widgets/confrontations_widgets/confrontations.dart';

class ConfrontationsTab extends StatelessWidget {
  const ConfrontationsTab({
    Key? key,
    required this.logic,
  }) : super(key: key);

  final MatchDetailViewModel logic;

  @override
  Widget build(BuildContext context) {
    if (logic.isLoading) {
      return const AppLoading(isCenter: true);
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Confrontations(logic: logic),
          ],
        ),
      ),
    );
  }
}
