enum CompetitionVoteTypes {
  withScores,
  swipe,
}

extension BorderTypesExtension on CompetitionVoteTypes {
  int get value {
    switch (this) {
      case CompetitionVoteTypes.withScores:
        return 1;
      case CompetitionVoteTypes.swipe:
        return 2;
    }
  }
}
