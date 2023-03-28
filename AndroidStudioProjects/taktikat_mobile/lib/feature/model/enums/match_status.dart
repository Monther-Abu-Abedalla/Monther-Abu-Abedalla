enum MatchStatus {
  notStarted,
  ended,
  inProgress,
  extraTime,
  matchFinished,
  secondHalf,
  matchPostponed,
  firstHalf,
  halftime,
  penaltyInProgress,
  breakTime,
  timeToBeDefined,
  matchFinishedAfterExtraTime,
  firstHalfKickOff,
  matchSuspended,
  matchInterrupted,
}

extension MatchStatusExtension on MatchStatus {
  String get value {
    switch (this) {
      case MatchStatus.notStarted:
        return 'Not Started';
      case MatchStatus.ended:
        return 'ended';
      case MatchStatus.inProgress:
        return 'In Progress';
      case MatchStatus.extraTime:
        return 'Extra Time';
      case MatchStatus.matchFinished:
        return 'Match Finished';
      case MatchStatus.secondHalf:
        return 'Second Half';
      case MatchStatus.matchPostponed:
        return 'Match Postponed';
      case MatchStatus.firstHalf:
        return 'First Half';
      case MatchStatus.halftime:
        return 'Halftime';
      case MatchStatus.penaltyInProgress:
        return 'Penalty In Progress';
      case MatchStatus.breakTime:
        return 'Break Time';
      case MatchStatus.timeToBeDefined:
        return 'Time to be defined';
      case MatchStatus.matchFinishedAfterExtraTime:
        return 'Match Finished After Extra Time';
      case MatchStatus.firstHalfKickOff:
        return 'First Half, Kick Off';
      case MatchStatus.matchSuspended:
        return 'Match Suspended';
      case MatchStatus.matchInterrupted:
        return 'Match Interrupted';
    }
  }
}

// STATUS_LIVE = 'In Progress';
// STATUS_EXTRA_TIME = 'Extra Time';
// STATUS_FINISHED = 'Match Finished';
// STATUS_SECOND_HALF = 'Second Half';
// STATUS_POSTPONED = 'Match Postponed';
// STATUS_FIRST_HALF = 'First Half';
// STATUS_HALF_TIME = 'Halftime';
// STATUS_PENALTY_IN_PROGRESS = 'Penalty In Progress';
// STATUS_BREAK_TIME = 'Break Time';
// STATUS_NOT_STARTED = 'Not Started';
// STATUS_TIME_TO_BE_DEFINED = 'Time To Be Defined';
// STATUS_SECOND_HALF_2ND_HALF_STARTED = 'Second Half, 2nd Half Started';
// STATUS_MATCH_FINISHED_AFTER_EXTRA_TIME = 'Match Finished After Extra Time';
// STATUS_FIRST_HALF_KICK_OFF = 'First Half, Kick Off';
// STATUS_SUSPENDED = 'Match Suspended';
// STATUS_INTERRUPTED = 'Match Interrupted';
