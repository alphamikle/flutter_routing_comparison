class RootViewEvent {
  const RootViewEvent();
}

class RootViewAuthorizationEvent extends RootViewEvent {
  const RootViewAuthorizationEvent();
}

class RootViewNavigationEvent extends RootViewEvent {
  const RootViewNavigationEvent({
    required this.tabId,
  });

  final String tabId;

  RootViewNavigationEvent copyWith({
    String? tabId,
  }) {
    return RootViewNavigationEvent(
      tabId: tabId ?? this.tabId,
    );
  }
}
