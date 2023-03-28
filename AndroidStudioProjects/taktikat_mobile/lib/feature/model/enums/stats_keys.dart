enum StatsKeys {
  totalShots,
  shotsOnTarget,
  bigChances,
  missedGoals,
  accuratePasses,
  fouls,
  corners,
  offsides,
}

extension BorderTypesExtension on StatsKeys {
  String get value {
    switch (this) {
      case StatsKeys.totalShots:
        return 'total_shots';
      case StatsKeys.shotsOnTarget:
        return 'shots_on_goal';
      case StatsKeys.bigChances:
        return 'shots_insidebox';
      case StatsKeys.missedGoals:
        return 'blocked_shots';
      case StatsKeys.accuratePasses:
        return 'passes';
      case StatsKeys.fouls:
        return 'fouls';
      case StatsKeys.corners:
        return 'corner_kicks';
      case StatsKeys.offsides:
        return 'offsides';
    }
  }
}
