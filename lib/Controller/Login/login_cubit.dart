import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:voo_app/view/pages/enable_location_access_screen.dart';
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
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => EnableLocationAccessScreen()),
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

  Future pickImage() async {
    final myFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (myFile != null) {
      LoginCubit.registerImage = File(myFile.path);
    }
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
      required BuildContext context}) {
    emit(ChangePasswordLoadingState());
    DioHelper.postData(
            url:
                'https://chehabeg-store.com/api/auth/my-account/change-password',
            data: {
              'old_password': oldPassword,
              'new_password': newPassword,
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
}
