abstract class HomeState {}

class InitialHomeState extends HomeState {}

// login
class LoadingLoginState extends HomeState {}
class SuccessLoginState extends HomeState {}
class ErrorLoginState extends HomeState {
  final String error;
  ErrorLoginState(this.error);
}

//register
class LoadingRegisterState extends HomeState {}
class SuccessRegisterState extends HomeState {}
class ErrorRegisterState extends HomeState {}

class GetUserLoadingHomeState extends HomeState {}
class GetUserSuccessHomeState extends HomeState {}
class GetUserErrorHomeState extends HomeState {}

class GetStretchesLoadingHomeState extends HomeState {}
class GetStretchesSuccessHomeState extends HomeState {}
class GetStretchesErrorHomeState extends HomeState {}

class GetLevelLoadingHomeState extends HomeState {}
class GetLevelSuccessHomeState extends HomeState {}
class GetLevelErrorHomeState extends HomeState {}


class ChangePasswordVisibilityState extends HomeState {}
