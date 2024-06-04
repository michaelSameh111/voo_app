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


class AddDriverLicenseLoadingState extends LoginState {}
class AddDriverLicenseSuccessState extends LoginState {}
class AddDriverLicenseErrorState extends LoginState {
  final String error;
  AddDriverLicenseErrorState(this.error);
}

class EditDriverLicenseLoadingState extends LoginState {}
class EditDriverLicenseSuccessState extends LoginState {}
class EditDriverLicenseErrorState extends LoginState {
  final String error;
  EditDriverLicenseErrorState(this.error);
}

class AddDriverVehicleLoadingState extends LoginState {}
class AddDriverVehicleSuccessState extends LoginState {}
class AddDriverVehicleErrorState extends LoginState {
  final String error;
  AddDriverVehicleErrorState(this.error);
}

class EditDriverVehicleLoadingState extends LoginState {}
class EditDriverVehicleSuccessState extends LoginState {}
class EditDriverVehicleErrorState extends LoginState {
  final String error;
  EditDriverVehicleErrorState(this.error);
}

class AddInsuranceLicenseLoadingState extends LoginState {}
class AddInsuranceLicenseSuccessState extends LoginState {}
class AddInsuranceLicenseErrorState extends LoginState {
  final String error;
  AddInsuranceLicenseErrorState(this.error);
}

class EditInsuranceLicenseLoadingState extends LoginState {}
class EditInsuranceLicenseSuccessState extends LoginState {}
class EditInsuranceLicenseErrorState extends LoginState {
  final String error;
  EditInsuranceLicenseErrorState(this.error);
}


class AddDriverDataLoadingState extends LoginState {}
class AddDriverDataSuccessState extends LoginState {}
class AddDriverDataErrorState extends LoginState {
  final String error;
  AddDriverDataErrorState(this.error);
}

class EditDriverDataLoadingState extends LoginState {}
class EditDriverDataSuccessState extends LoginState {}
class EditDriverDataErrorState extends LoginState {
  final String error;
  EditDriverDataErrorState(this.error);
}

class ChangePasswordLoadingState extends LoginState {}
class ChangePasswordSuccessState extends LoginState {}
class ChangePasswordErrorState extends LoginState {
  final String error;
  ChangePasswordErrorState(this.error);
}






class EditAccountImagePickerState extends LoginState {}

class ImagePickingState extends LoginState {}
class ImagePickingSuccessState extends LoginState {}

class EditAccountImageLoadingState extends LoginState {}
class EditAccountImageSuccessState extends LoginState {}
class EditAccountImageErrorState extends LoginState {}
