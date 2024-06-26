import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/Controller/Login/login_cubit.dart';
import 'package:voo_app/view/widgets/circled_next_button.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

import '../../Controller/Constants.dart';
import 'DataCheck.dart';

class DriverLicenseScreen extends StatefulWidget {
  @override
  State<DriverLicenseScreen> createState() => _DriverLicenseScreenState();
}

class _DriverLicenseScreenState extends State<DriverLicenseScreen> {
  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now().add(Duration(days: 15)),
        firstDate: DateTime.now().add(Duration(days: 15)),
        lastDate: DateTime(2100));
    if (picked != null) {
      setState(() {
        expiryDateController.text = picked.toString().split(" ")[0];
      });
    }
  }
  TextEditingController driverLicenseController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is AddDriverLicenseSuccessState){
          Navigator.popUntil(context,(route) => route.isFirst);
          Navigator.push(context, MaterialPageRoute(builder: (context) => DataCheckScreen()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8.h,
                      ),
                      Center(
                        child: Text(
                          'Driver\'s License ',
                          style: TextStyle(
                              fontSize: 25.dp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        'To prevent delays , make sure your driver\'s license : \n'
                            ' - Is current (not expired).\n'
                            ' - Is not blurry.\n'
                            ' - Includes all four corners of the card',
                        style: TextStyle(
                            fontSize: 14.dp, color: const Color(0xff808080)),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      DottedBorder(
                        dashPattern: [8, 4],
                        color: const Color(0xff808080),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            color: Color(0xfff5f4f4),
                          ),
                          child: LoginCubit.frontLicenseImage != null
                              ? Image.file(
                            LoginCubit.frontLicenseImage!,
                            height: 40.h,
                            width: 100.w,
                            fit: BoxFit.fill,
                          )
                              : Column(
                            children: [
                              Icon(
                                Icons.camera_alt_rounded,
                                size: 45.dp,
                              ),
                              const TextButton(
                                onPressed: null,
                                child: Text(
                                  'Click here to upload a clear pictue of\n              front of driver\'s license',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              MainElevatedButtonTwo(
                                  onPressed: () {
                                    LoginCubit.get(context)
                                        .pickImage(
                                        image: LoginCubit
                                            .frontLicenseImage)
                                        .then((value) {
                                      setState(() {
                                        LoginCubit.frontLicenseImage =
                                            value;
                                      });
                                    });
                                  },
                                  text: 'Upload',
                                  backgroundColor: const Color(0xffFF6A03)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      DottedBorder(
                        dashPattern: [8, 4],
                        color: const Color(0xff808080),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            color: Color(0xfff5f4f4),
                          ),
                          child: LoginCubit.backLicenseImage != null
                              ? InkWell(
                              onTap: () {
                                LoginCubit.get(context)
                                    .pickImage(
                                    image: LoginCubit.backLicenseImage)
                                    .then((value) {
                                  setState(() {
                                    LoginCubit.backLicenseImage = value;
                                  });
                                });
                              },
                              child: Image.file(
                                LoginCubit.backLicenseImage!,
                                height: 40.h,
                                width: 100.w,
                                fit: BoxFit.fill,
                              ))
                              : Column(
                            children: [
                              Icon(
                                Icons.camera_alt_rounded,
                                size: 45.dp,
                              ),
                              const TextButton(
                                onPressed: null,
                                child: Text(
                                  'Click here to upload a clear pictue of\n              back of driver\'s license',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              MainElevatedButtonTwo(
                                  onPressed: () {
                                    LoginCubit.get(context)
                                        .pickImage(
                                        image: LoginCubit
                                            .backLicenseImage)
                                        .then((value) {
                                      setState(() {
                                        LoginCubit.backLicenseImage = value;
                                      });
                                    });
                                  },
                                  text: 'Upload',
                                  backgroundColor: const Color(0xffFF6A03)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        'Driver License Number',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.dp),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xfff5f4f4),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: driverLicenseController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            } else
                              return null;
                          },
                          inputFormatters: [LettersAndDigitsInputFormatter()],
                          decoration: InputDecoration(
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  const BorderSide(color: Colors.transparent)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  const BorderSide(color: Colors.transparent)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  const BorderSide(color: Colors.transparent)),
                              contentPadding: const EdgeInsets.all(15),
                              hintText: 'Driver License Number',
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'Expiration Date',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.dp),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This Field is Empty';
                          }
                          return null;
                        },
                        readOnly: true,
                        decoration: InputDecoration(
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                const BorderSide(color: Colors.transparent)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                const BorderSide(color: Colors.transparent)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                const BorderSide(color: Colors.transparent)),
                            contentPadding: const EdgeInsets.all(15),
                            hintText: 'Expiry Date',
                            prefixIcon: const Icon(Icons.calendar_today)),
                        onTap: () {
                          selectDate();
                        },
                        controller: expiryDateController,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Center(child: CircledNextButtonTwo(
                        condition: state is AddDriverLicenseLoadingState,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            if(LoginCubit.frontLicenseImage == null || LoginCubit.backLicenseImage == null){
                              showSimpleDialog(
                                  context,
                                  'Please Add License Image',
                                  'License image is required to proceed.');
                            }else {  LoginCubit.get(context).addDriverLicense(
                              driverLicense: driverLicenseController.text,
                              expiryDate: expiryDateController.text,
                              frontImage: LoginCubit.frontLicenseImage,
                              backImage: LoginCubit.backLicenseImage,
                              context: context,
                            );}


                          }
                        },
                      )),
                      SizedBox(
                        height: 1.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }


}
