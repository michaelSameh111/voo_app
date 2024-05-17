

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  void userLogin(
      {required String email,
      required String password,
      required BuildContext context}) {
    emit(LoginLoadingState());
    DioHelper.postData(url: 'http://10.0.2.2:8000/api/auth/login', data: {
      'email': email,
      'password': password,
    }).then((value)async {
      loginData = LoginDataModel.fromJson(value.data);
      token = loginData.accessToken;
      loggedInEmail = email;
      loggedInPassword = password;
      emit(LoginSuccessState());
      if (state is LoginSuccessState) {
        Navigator.pushAndRemoveUntil(
          context,MaterialPageRoute(builder: (context)=>EnableLocationAccessScreen()),
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
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>EnableLocationAccessScreen()));
        }
      }
    });
  }

  Future<void> getCitiesData() {
    emit(LoginLoadingState());
    return DioHelper.getData(url: 'auth/my-account/cities', token: token).then((value) {
      emit(LoginSuccessState());
    }).catchError((error,stackTrace) {
      print(error.toString());
      print(stackTrace);
      emit(LoginErrorState(error));
    });
  }

  void registerUser({
      required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String password,
      required String passwordConfirmation,
      required BuildContext context}) {
    emit(RegisterLoadingState());
    DioHelper.postData(url: 'https://chehabeg-store.com/api/auth/register',
        data: {
      'first_name' : firstName,
      'last_name' : lastName,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'phone' : phone
    }
    ).then((value)async {
      emit(RegisterSuccessState());
      if (state is RegisterSuccessState) {
        userLogin(email: email, password: password, context: context);
      }
    }).catchError((error) {
      print(error);
      emit(RegisterErrorState(error.toString()));
    });
  }

  void editUser({
      required String firstName,
      required String lastName,
      required String email,
      required String phone,

      required BuildContext context}) {
    emit(EditUserLoadingState());
    DioHelper.postData(url: 'https://chehabeg-store.com/api/auth/my-account/edit-user',
        data: {
      'first_name' : firstName,
      'last_name' : lastName,
      'email': email,
      'phone' : phone
    },token: token).then((value)async {
      emit(EditUserSuccessState());
      if (state is EditUserSuccessState) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
      }
    }).catchError((error) {
      print(error);
      emit(EditUserErrorState(error.toString()));
    });
  }

  void changePassword({
      required String oldPassword,
      required String newPassword,
      required BuildContext context}) {
    emit(ChangePasswordLoadingState());
    DioHelper.postData(url: 'https://chehabeg-store.com/api/auth/my-account/change-password',
        data: {
      'old_password' : oldPassword,
      'new_password' : newPassword,
    },token: token).then((value)async {
      emit(ChangePasswordSuccessState());
      if (state is ChangePasswordSuccessState) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
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
