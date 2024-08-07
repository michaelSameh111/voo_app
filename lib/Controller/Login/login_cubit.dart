import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:voo_app/Controller/Data/data_cubit.dart';
import 'package:voo_app/Model/InProgressTripModel.dart';
import 'package:voo_app/view/pages/LandingPage.dart';
import 'package:voo_app/view/pages/forget_password_screen.dart';
import 'package:voo_app/view/pages/login_register_screen.dart';
import 'package:voo_app/view/pages/login_screen.dart';
import 'package:voo_app/view/pages/social_security_screen.dart';

import '../../Model/LoginDataModel.dart';
import '../Constants.dart';
import '../dio-helper.dart';
import '../shared-prefrences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  static File? registerImage;
  static File? editAccountImage;
  static File? frontLicenseImage;
  static File? backLicenseImage;
  static File? insuranceLicense;
  static File? vehicleBackImage;
  static File? vehicleFrontImage;
  static File? vehicleRightImage;
  static File? vehicleLeftImage;
  static File? vehicleRCImage;
  static String carHint = 'Add Car Images';
  void updateCarHint (){
    carHint = LoginCubit.vehicleFrontImage == null &&
        LoginCubit.vehicleLeftImage == null &&
        LoginCubit.vehicleRightImage == null &&
        LoginCubit.vehicleBackImage == null
        ? 'Add Car Images'
        : 'Images Added';
  }
  void userLogin(
      {required String email,
      required String password,
      required BuildContext context}) {
    emit(LoginLoadingState());
    DioHelper.postData(url: 'https://voorideshare.com/api/auth/login', data: {
      'email': email,
      'password': password,
      'fcm_token': fcmToken
    }).then((value) async {
      print(value.data);

      loginData = LoginDataModel.fromJson(value.data);
      token = loginData.accessToken;
      loggedInEmail = email;
      loggedInPassword = password;
      if(loginData.driverData != null){ driverData = loginData.driverData!;}
      if(loginData.driverVehicle != null){ driverVehicle = loginData.driverVehicle!;}
      if(loginData.driverInsurance != null){ insuranceData = loginData.driverInsurance!;}
      if(loginData.driverLicense != null && loginData.driverLicense!.isNotEmpty){ licenseData = loginData.driverLicense![0];}
      print('User  $token');
      print(fcmToken);
      emit(LoginSuccessState());
      if (state is LoginSuccessState) {
        inProgressTrip = InProgressTripModel();
        DataCubit.get(context).getVehicleTypes();
        DataCubit.get(context).getTripsHistoryData();
        DataCubit.get(context).getInProgressTripDetails();
        if(loginData.driverData == null){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SocialSecurityScreen(login: true,)));
        } else {  Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Landingpage()),
              (route) => false,
        );}
        if (rememberMe == true) {
          CacheHelper.saveData(
              key: 'username', value: loginEmailController.text);
          CacheHelper.saveData(
              key: 'password', value: loginPasswordController.text);
          CacheHelper.saveData(key: 'loggedin', value: true);
        } else {
          print(rememberMe);
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
                  builder: (context) => LoginRegisterScreen()));
        }
      }
    });
  }

  Future pickImage({required File? image,bool? frontCamera}) async {
    emit(ImagePickingState());
    final myFile = await ImagePicker().pickImage(source: ImageSource.camera,preferredCameraDevice: frontCamera == true ? CameraDevice.front : CameraDevice.rear );
    if (myFile != null) {
      image = File(myFile.path);
      updateCarHint();
    }
    emit(ImagePickingSuccessState());
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

  void registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String gender,
    required String birthDate,
    required String password,
    required String passwordConfirmation,
    File? file,
    String fileName = '',
    required BuildContext context,
  }) async {
    emit(RegisterLoadingState());

    try {
      FormData formData = FormData.fromMap({
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
            filename: LoginCubit.registerImage!
                .path
                .split('/')
                .last,
            contentType: MediaType("image", "jpeg"),
          ),
      });

      Response response = await DioHelper.postData(
        url: 'auth/register',
        data: formData,
      );

      emit(RegisterSuccessState());
      if (state is RegisterSuccessState) {
        userLogin(email: email, password: password, context: context);
      }
    } catch (error) {
      if (error is DioException) {
        if (error.response != null) {
          if (error.response?.statusCode == 422) {
            var errors = error.response?.data['errors'];
            if (errors != null) {
              if (errors.containsKey('email') && errors.containsKey('phone') ) {
                showEmailOrPhoneTakenDialog(context, 'Email & Phone are');
                // Fluttertoast.showToast(
                //   msg: 'Email & Phone are already taken',
                //   toastLength: Toast.LENGTH_LONG,
                //   gravity: ToastGravity.BOTTOM,
                //   backgroundColor: Colors.red,
                //   textColor: Colors.white,
                //   fontSize: 16.dp,
                //
                // );
              }
              else if (errors.containsKey('email')) {
                showEmailOrPhoneTakenDialog(context, 'Email is');
                // Fluttertoast.showToast(
                //   msg: 'Email is already taken',
                //   toastLength: Toast.LENGTH_SHORT,
                //   gravity: ToastGravity.BOTTOM,
                //   backgroundColor: Colors.red,
                //   textColor: Colors.white,
                //   fontSize: 16.dp,
                // );
              }
              else if (errors.containsKey('phone')) {
                showEmailOrPhoneTakenDialog(context, 'Phone is');
                // Fluttertoast.showToast(
                //   msg: 'Phone is already taken',
                //   toastLength: Toast.LENGTH_SHORT,
                //   gravity: ToastGravity.BOTTOM,
                //   backgroundColor: Colors.red,
                //   textColor: Colors.white,
                //   fontSize: 16.dp,
                // );
              }
            }
          } else {
            print('Error response data: ${error.response?.data}');
          }
        }
        print('Error message: ${error.message}');
        print('Stacktrace: ${error.stackTrace}');
      } else {
        print('Error: $error');
      }
      emit(RegisterErrorState(error.toString()));
    }
  }

  void editUser(
      {required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String date,
      required BuildContext context}) {
    emit(EditUserLoadingState());
    DioHelper.postData(
            url: 'my-account/edit',
            data: {
              'first_name': firstName,
              'last_name': lastName,
              'email': email,
              'phone': phone,
              'date_of_birth': date,
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
      DataCubit.get(context).getDriverLicenseData();
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
        url: 'driver-license/edit',
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
    }).catchError((error,stacktrace) {
      print(error);
      print(stacktrace);
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
      DataCubit.get(context).getDriverInsuranceData();
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
        url: 'https://voorideshare.com/api/driver-data/add',
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
        .whenComplete(()  {
      DataCubit.get(context).getDriverData();
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
        url: 'https://voorideshare.com/api/driver-data/edit',
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

  Future<void> addVehicle({
    required String plateInfo,
    required String make,
    required int model,
    required String year,
    required String seats,
    required String doors,
    required String rc,
    required String wheelChair,
    required String kidsSeat,
    required String color,
    required String rcExpiry,
    required File? rcImage,
     File? frontImage,
     File? backImage,
     File? rightImage,
     File? leftImage,
    required BuildContext context,
  }) async {
    emit(AddDriverVehicleLoadingState());

    try {
      final response = await DioHelper.postData(
        url: 'https://voorideshare.com/api/driver-vehicles/add',
        data: FormData.fromMap({
          'plate_info': plateInfo,
          'make': make,
          'model': model,
          'year': year,
          'seats': seats,
          'doors': doors,
          'rc': rc,
          'primary_car': 'on',
          'wheelchair_access': wheelChair,
          'kids_seat': kidsSeat,
          'color': color,
          'rc_expiry': rcExpiry,
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
        token: token,
      );

      print('Response data: ${response.data}');
      DataCubit.get(context).getDriverVehicleData();
      emit(AddDriverVehicleSuccessState());
    } catch (error) {
      if (error is DioException) {
        if (error.response != null) {
          print('Error response data: ${error.response?.data}');
          print('Error response status: ${error.response?.statusCode}');
          print('Error response headers: ${error.response?.headers}');
        } else {
          print('Error message: ${error.message}');
        }
      } else {
        print('Unexpected error: $error');
      }
      emit(AddDriverVehicleErrorState(error.toString()));
    }
  }


  Future<void> editImage({
    required File? image,
    required BuildContext context,
  }) async {
    emit(EditAccountImageLoadingState());

    try {
      final response = await DioHelper.postData(
        url: 'my-account/edit-image',
        data: FormData.fromMap({
          if (LoginCubit.editAccountImage != null)
            'image': await MultipartFile.fromFile(
              LoginCubit.editAccountImage!.path,
              filename: LoginCubit.editAccountImage!.path.split('/').last,
              contentType: MediaType("image", "jpeg"),
            ),
        }),
        token: token,
      );
      loginData.image = response.data['image'];
      print('Response data: ${response.data['image']}');
      emit(EditAccountImageSuccessState());
    } catch (error) {
      if (error is DioException) {
        if (error.response != null) {
          print('Error response data: ${error.response?.data}');
          print('Error response status: ${error.response?.statusCode}');
          print('Error response headers: ${error.response?.headers}');
        } else {
          print('Error message: ${error.message}');
        }
      } else {
        print('Unexpected error: $error');
      }
      emit(EditAccountImageErrorState());
    }
  }


  Future<void> resetPassword(
      {
        required String email,
        required BuildContext context})async {
    emit(ForgetPasswordLoadingState());
    DioHelper.postData(
        url:
        'auth/forgot-password',
        data: {
          'email' : email
        },
        token: token)
        .then((value) async {
      emit(ForgetPasswordSuccessState());
    }).catchError((error) {
      print(error);
      emit(ForgetPasswordErrorState());
    });
  }
  Future<void> showEmailOrPhoneTakenDialog(BuildContext context,String message) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:  Text('${message} Already Taken'),
        content:  Text('The provided ${message} already associated with an account. Do you want to reset your password?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context), // Return false for cancel
          ),
          TextButton(
            child: const Text('Reset Password'),
            onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context)=>ForgetPasswordScreen())), // Return true for reset
          ),
        ],
      ),
    );
  }
}
