class RootViewEvent {
  const RootViewEvent();
}

class RootViewAuthorizationEvent extends RootViewEvent {
  const RootViewAuthorizationEvent();
}

class RootViewNavigationEvent extends RootViewEvent {
  const RootViewNavigationEvent({
    required this.routeName,
  });

  final String routeName;

  RootViewNavigationEvent copyWith({
    String? routeName,
  }) {
    return RootViewNavigationEvent(
      routeName: routeName ?? this.routeName,
    );
  }
}
