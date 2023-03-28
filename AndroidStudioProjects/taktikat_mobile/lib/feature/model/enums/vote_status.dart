enum VoteStates {
  home,
  away,
  draw,
}

extension VoteStatesExtension on VoteStates {
  String get value {
    switch (this) {
      case VoteStates.home:
        return 'home';
      case VoteStates.away:
        return 'away';
      case VoteStates.draw:
        return 'draw';
    }
  }
}
// home // away // draw
