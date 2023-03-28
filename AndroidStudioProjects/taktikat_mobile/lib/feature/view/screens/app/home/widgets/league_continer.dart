import 'package:flutter/material.dart';

class LeagueContainer extends StatelessWidget {
  const LeagueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
