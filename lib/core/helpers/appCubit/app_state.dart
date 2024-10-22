class AppState {
  final DateTime startDate;

  AppState({
    required this.startDate,
  });

  AppState copyWith({
    DateTime? startDate,
  }) {
    return AppState(
      startDate: startDate ?? this.startDate,
    );
  }
}
