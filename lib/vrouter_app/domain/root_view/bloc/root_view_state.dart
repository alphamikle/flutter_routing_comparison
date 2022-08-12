class RootViewState {
  const RootViewState({
    required this.index,
    required this.isAuthorized,
  });

  final int index;
  final bool isAuthorized;

  RootViewState copyWith({
    int? index,
    bool? isAuthorized,
  }) {
    return RootViewState(
      index: index ?? this.index,
      isAuthorized: isAuthorized ?? this.isAuthorized,
    );
  }
}
