import 'package:flutter/material.dart';
import 'package:voo_app/Model/LoginDataModel.dart';

String? token = '';
String? loggedInEmail = '';
String? loggedInPassword = '';
bool rememberMe = false;
TextEditingController loginEmailController = TextEditingController();
TextEditingController loginPasswordController = TextEditingController();
LoginDataModel loginData = LoginDataModel();


