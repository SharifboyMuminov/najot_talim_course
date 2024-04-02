class TamerState {
  String hour;
  String minute;
  bool error;
  bool stop;

  TamerState(
      {required this.hour,
      required this.minute,
      required this.error,
      required this.stop});

  TamerState copyWithe({
    String? hour,
    String? minute,
    bool? error,
    bool? stop,
  }) {
    return TamerState(
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      error: error ?? this.error,
      stop: stop ?? this.stop,
    );
  }
}
