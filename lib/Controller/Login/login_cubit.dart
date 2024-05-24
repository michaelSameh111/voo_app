import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:voo_app/Controller/Data/data_cubit.dart';
import 'package:voo_app/view/pages/enable_location_access_screen.dart';
import 'package:voo_app/view/pages/home_page_maps_screen.dart';
import 'package:voo_app/view/pages/login_screen.dart';

import '../../Model/LoginDataModel.dart';
import '../Constants.dart';
import '../dio-helper.dart';
import '../shared-prefrences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  static File? registerImage;
  static File? frontLicenseImage;
  static File? backLicenseImage;
  static File? insuranceLicense;
  static File? vehicleBackImage;
  static File? vehicleFrontImage;
  static File? vehicleRightImage;
  static File? vehicleLeftImage;
  static File? vehicleRCImage;
  void userLogin(
      {required String email,
      required String password,
      required BuildContext context}) {
    emit(LoginLoadingState());
    DioHelper.postData(url: 'http://10.0.2.2:8000/api/auth/login', data: {
      'email': email,
      'password': password,
    }).then((value) async {
      loginData = LoginDataModel.fromJson(value.data);
      token = loginData.accessToken;
      loggedInEmail = email;
      loggedInPassword = password;
      emit(LoginSuccessState());
      if (state is LoginSuccessState) {
        DataCubit.get(context).getVehicleTypes();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePageMapsScreen()),
          (route) => false,
        );
        if (rememberMe == true) {
          CacheHelper.saveData(
              key: 'username', value: loginEmailController.text);
          CacheHelper.saveData(
              key: 'password', value: loginPasswordController.text);
          CacheHelper.saveData(key: 'loggedin', value: true);
        }
      }
    }).catchError((error) {
      print(error);
      emit(LoginErrorState(error.toString()));
      {
        if (CacheHelper.getData(key: 'loggedin') == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                height: 5.h,
                child: const Text('Your Username or Password is Incorrect'),
              ),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          );
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => EnableLocationAccessScreen()));
        }
      }
    });
  }

  Future pickImage({required File? image}) async {
    final myFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (myFile != null) {
      image = File(myFile.path);
    }
    return image;
  }

  static File? editAccountFile;
  Future getImage() async {
    final myFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (myFile != null) {
      editAccountFile = File(myFile.path);
      emit(EditAccountImagePickerState());
    }
  }

  void registerUser(
      {required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String gender,
      required String birthDate,
      required String password,
      required String passwordConfirmation,
      File? file,
      String fileName = '',
      required BuildContext context}) async {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: 'auth/register',
      data: FormData.fromMap({
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'password': password,
        'role': 'Driver',
        'gender': gender,
        'date_of_birth': birthDate,
        'phone': phone,
        if (LoginCubit.registerImage != null)
          'image': await MultipartFile.fromFile(
            LoginCubit.registerImage!.path,
            filename: LoginCubit.registerImage!.path.split('/').last,
            contentType: MediaType("image", "jpeg"),
          ),
      }),
    ).then((value) async {
      emit(RegisterSuccessState());
      if (state is RegisterSuccessState) {
        userLogin(email: email, password: password, context: context);
      }
    }).catchError((error, stacktrace) {
      print(error);
      print(stacktrace);
      print(file);
      emit(RegisterErrorState(error.toString()));
    });
  }

  void editUser(
      {required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required BuildContext context}) {
    emit(EditUserLoadingState());
    DioHelper.postData(
            url: 'https://chehabeg-store.com/api/auth/my-account/edit-user',
            data: {
              'first_name': firstName,
              'last_name': lastName,
              'email': email,
              'phone': phone
            },
            token: token)
        .then((value) async {
      emit(EditUserSuccessState());
      if (state is EditUserSuccessState) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
      }
    }).catchError((error) {
      print(error);
      emit(EditUserErrorState(error.toString()));
    });
  }

  void changePassword(
      {required String oldPassword,
      required String newPassword,
      required String confirmNewPassword,
      required BuildContext context}) {
    emit(ChangePasswordLoadingState());
    DioHelper.postData(
            url:
                'my-account/change-password',
            data: {
              'old_password': oldPassword,
              'new_password': newPassword,
              'confirm_new_password': confirmNewPassword,
            },
            token: token)
        .then((value) async {
      emit(ChangePasswordSuccessState());
      if (state is ChangePasswordSuccessState) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
        loggedInEmail = null;
        loggedInPassword = null;
      }
    }).catchError((error) {
      print(error);
      Fluttertoast.showToast(
        msg: 'Wrong Password',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 18.dp,
      );
      emit(ChangePasswordErrorState(error.toString()));
    });
  }

  Future<void> addDriverLicense(
      {required String driverLicense,
        required String expiryDate,
        required File? frontImage,
        required File? backImage,
        required BuildContext context})async {
    emit(AddDriverLicenseLoadingState());
    DioHelper.postData(
        url: 'driver-license/add',
        data: FormData.fromMap({
          'license_number' : driverLicense,
          'license_expiry' : expiryDate,
          if (LoginCubit.frontLicenseImage != null)
            'license_front_image': await MultipartFile.fromFile(
            LoginCubit.frontLicenseImage!.path,
            filename: LoginCubit.frontLicenseImage!.path.split('/').last,
            contentType: MediaType("image", "jpeg"),
          ),
          if (LoginCubit.backLicenseImage != null)
            'license_back_image': await MultipartFile.fromFile(
            LoginCubit.backLicenseImage!.path,
            filename: LoginCubit.backLicenseImage!.path.split('/').last,
            contentType: MediaType("image", "jpeg"),
          ),
        }),
        token: token)
        .then((value) async {
      emit(AddDriverLicenseSuccessState());
    }).catchError((error,stacktrace) {
      // print(error);
      // print(stacktrace);
      emit(AddDriverLicenseErrorState(error.toString()));
    });
  }

  Future<void> editDriverLicense(
      {required String driverLicense,
        required String expiryDate,
        required File? frontImage,
        required File? backImage,
        required BuildContext context})async {
    emit(EditDriverLicenseLoadingState());
    DioHelper.postData(
        url: 'driver-license/add',
        data: FormData.fromMap({
          'license_number' : driverLicense,
          'license_expiry' : expiryDate,
          if (LoginCubit.frontLicenseImage != null)
            'license_front_image': await MultipartFile.fromFile(
            LoginCubit.frontLicenseImage!.path,
            filename: LoginCubit.frontLicenseImage!.path.split('/').last,
            contentType: MediaType("image", "jpeg"),
          ),
          if (LoginCubit.backLicenseImage != null)
            'license_back_image': await MultipartFile.fromFile(
            LoginCubit.backLicenseImage!.path,
            filename: LoginCubit.backLicenseImage!.path.split('/').last,
            contentType: MediaType("image", "jpeg"),
          ),
        }),
        token: token)
        .then((value) async {
      emit(EditDriverLicenseSuccessState());
      sourcePosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    }).catchError((error,stacktrace) {
      // print(error);
      // print(stacktrace);
      emit(EditDriverLicenseErrorState(error.toString()));
    });
  }


  Future<void> addInsuranceLicense(
      {required String insuranceLicense,
        required String insuranceExpiry,
        required File? frontImage,
        required BuildContext context})async {
    emit(AddInsuranceLicenseLoadingState());
    DioHelper.postData(
        url: 'driver-insurance/add',
        data: FormData.fromMap({
          'insurance_number' : insuranceLicense,
          'insurance_expiry' : insuranceExpiry,
          if (LoginCubit.insuranceLicense != null)
            'insurance_front_image': await MultipartFile.fromFile(
            LoginCubit.insuranceLicense!.path,
            filename: LoginCubit.insuranceLicense!.path.split('/').last,
            contentType: MediaType("image", "jpeg"),
          ),
        }),
        token: token)
        .then((value) async {
      emit(AddInsuranceLicenseSuccessState());
    }).catchError((error,stacktrace) {
      print(error);
      print(stacktrace);
      emit(AddInsuranceLicenseErrorState(error.toString()));
    });
  }


  Future<void> editInsuranceLicense(
      {required String insuranceLicense,
        required String insuranceExpiry,
        required File? frontImage,
        required BuildContext context})async {
    emit(EditInsuranceLicenseLoadingState());
    DioHelper.postData(
        url: 'driver-insurance/edit',
        data: FormData.fromMap({
          'insurance_number' : insuranceLicense,
          'insurance_expiry' : insuranceExpiry,
          if (LoginCubit.insuranceLicense != null)
            'insurance_front_image': await MultipartFile.fromFile(
            LoginCubit.insuranceLicense!.path,
            filename: LoginCubit.insuranceLicense!.path.split('/').last,
            contentType: MediaType("image", "jpeg"),
          ),
        }),
        token: token)
        .then((value) async {
      emit(EditInsuranceLicenseSuccessState());
    }).catchError((error,stacktrace) {
      print(error);
      print(stacktrace);
      emit(EditInsuranceLicenseErrorState(error.toString()));
    });
  }

  Future<void> addDriverData(
      {required String socialSecurity,
        required String country,
        required String city,
        required String state,
        required String address,
        required String postalCode,
        required String language,
        required BuildContext context})async {
    emit(AddDriverDataLoadingState());
    DioHelper.postData(
        url: 'http://10.0.2.2:8000/api/driver-data/add',
        data: FormData.fromMap({
          'security_code' : socialSecurity,
          'social_security_number' : socialSecurity,
          'country' : country,
          'city' : city,
          'state' : state,
          'address' : address,
          'postal_code' : postalCode,
          'language' : language
        }),
        token: token)
        .then((value) async {
      emit(AddDriverDataSuccessState());
    }).catchError((error,stacktrace) {
      print(error);
      print(stacktrace);
      emit(AddDriverDataErrorState(error.toString()));
    });
  }


  Future<void> editDriverData(
      {required String socialSecurity,
        required String country,
        required String city,
        required String state,
        required String address,
        required String postalCode,
        required String language,
        required BuildContext context})async {
    emit(EditDriverDataLoadingState());
    DioHelper.postData(
        url: 'http://10.0.2.2:8000/api/driver-data/edit',
        data: FormData.fromMap({
          'security_code' : socialSecurity,
          'social_security_number' : socialSecurity,
          'country' : country,
          'city' : city,
          'state' : state,
          'address' : address,
          'postal_code' : postalCode,
          'language' : language
        }),
        token: token)
        .then((value) async {
      emit(EditDriverDataSuccessState());
    }).catchError((error,stacktrace) {
      print(error);
      print(stacktrace);
      emit(EditDriverDataErrorState(error.toString()));
    });
  }

  Future<void> addVehicle(
      {required int type,
        required String plateInfo,
        required String brand,
        required String model,
        required String year,
        required String seats,
        required String doors,
        required String wheelChair,
        required String kidsSeat,
        required String color,
        required String rcExpiry,
        required File? rcImage,
        required File? frontImage,
        required File? backImage,
        required File? rightImage,
        required File? leftImage,
        required BuildContext context})async {
    emit(AddDriverVehicleLoadingState());
    DioHelper.postData(
        url: 'driver-vehicles/add',
        data: FormData.fromMap({
          'vehicle_type' : type,
          'plate_info' : plateInfo,
          'make' : brand,
          'model' : model,
          'year' : seats,
          'doors' : doors,
          'wheelchair_access' : wheelChair,
          'kids_seat' : kidsSeat,
          'color' : color,
          'rc_expiry' : rcExpiry,
          if (LoginCubit.vehicleRCImage != null)
            'rc_image': await MultipartFile.fromFile(
              LoginCubit.vehicleRCImage!.path,
              filename: LoginCubit.vehicleRCImage!.path.split('/').last,
              contentType: MediaType("image", "jpeg"),
            ),
          if (LoginCubit.vehicleFrontImage != null)
            'front_image': await MultipartFile.fromFile(
              LoginCubit.vehicleFrontImage!.path,
              filename: LoginCubit.vehicleFrontImage!.path.split('/').last,
              contentType: MediaType("image", "jpeg"),
            ),
          if (LoginCubit.vehicleBackImage != null)
            'back_image': await MultipartFile.fromFile(
              LoginCubit.vehicleBackImage!.path,
              filename: LoginCubit.vehicleBackImage!.path.split('/').last,
              contentType: MediaType("image", "jpeg"),
            ),
          if (LoginCubit.vehicleRightImage != null)
            'right_image': await MultipartFile.fromFile(
              LoginCubit.vehicleRightImage!.path,
              filename: LoginCubit.vehicleRightImage!.path.split('/').last,
              contentType: MediaType("image", "jpeg"),
            ),
          if (LoginCubit.vehicleLeftImage != null)
            'left_image': await MultipartFile.fromFile(
              LoginCubit.vehicleLeftImage!.path,
              filename: LoginCubit.vehicleLeftImage!.path.split('/').last,
              contentType: MediaType("image", "jpeg"),
            ),
        }),
        token: token)
        .then((value) async {
      emit(AddDriverVehicleSuccessState());
    }).catchError((error,stacktrace) {
      print(error);
      print(stacktrace);
      emit(AddDriverVehicleErrorState(error.toString()));
    });
  }


  Future<void> changeDriverStatus(
      {required String status,
        required BuildContext context})async {
    emit(ChangeDriverStatusLoadingState());
    DioHelper.postData(
        url:
        'driver-status/update',
        data: {
          'accepting_rides': status,
        },
        token: token)
        .then((value) async {
      emit(ChangeDriverStatusSuccessState());
    }).catchError((error) {
      print(error);
      emit(ChangeDriverStatusErrorState(error.toString()));
    });
  }
}
