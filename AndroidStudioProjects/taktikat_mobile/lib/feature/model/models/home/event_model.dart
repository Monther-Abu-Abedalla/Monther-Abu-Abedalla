class ToggleFavoriteMatchesEvent {
  ToggleFavoriteMatchesEvent({
    required this.event,
  });

  bool? event;

  factory ToggleFavoriteMatchesEvent.fromJson(Map<String, dynamic> json) =>
      ToggleFavoriteMatchesEvent(
        event: json['event'],
      );

  Map<String, dynamic> toJson() => {
        'event': event,
      };
}
