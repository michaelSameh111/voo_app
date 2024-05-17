part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoadingState extends LoginState {}
class LoginSuccessState extends LoginState {}
class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState(this.error);
}


class RegisterLoadingState extends LoginState {}
class RegisterSuccessState extends LoginState {}
class RegisterErrorState extends LoginState {
  final String error;
  RegisterErrorState(this.error);
}

class EditUserLoadingState extends LoginState {}
class EditUserSuccessState extends LoginState {}
class EditUserErrorState extends LoginState {
  final String error;
  EditUserErrorState(this.error);
}

class ChangePasswordLoadingState extends LoginState {}
class ChangePasswordSuccessState extends LoginState {}
class ChangePasswordErrorState extends LoginState {
  final String error;
  ChangePasswordErrorState(this.error);
}

