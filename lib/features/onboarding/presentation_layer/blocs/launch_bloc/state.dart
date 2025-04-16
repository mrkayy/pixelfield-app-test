abstract class LaunchEvent {}

class AppLaunched extends LaunchEvent {}

class SignoutFromApp extends LaunchEvent {}

class NavigateToCollectionPage extends LaunchEvent {}

abstract class LaunchState {}

class UserSignedOut extends LaunchState {}

class UserSignedIn extends LaunchState {}

class NewUserOnboarding extends LaunchState {}
