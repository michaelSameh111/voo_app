import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/Controller/Constants.dart';
import 'package:voo_app/Controller/Login/login_cubit.dart';

import '../../../../widgets/main_elevated_button.dart';

class EditYourPhotoBasicInfoScreen extends StatefulWidget {
  const EditYourPhotoBasicInfoScreen({Key? key}) : super(key: key);

  @override
  State<EditYourPhotoBasicInfoScreen> createState() => _EditYourPhotoBasicInfoScreenState();
}

class _EditYourPhotoBasicInfoScreenState extends State<EditYourPhotoBasicInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is EditAccountImageSuccessState){
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            toolbarHeight: 10.h,
            leadingWidth: 0,
            title: Row(
              children: [
                SizedBox(
                  width: 1.w,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      height: 20.h,
                      width: 10.w,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                          )
                        ],
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      )),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  'Edit Photo',
                  style: TextStyle(
                      fontSize: 20.dp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
          ),

          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  children: [
                    SizedBox(height: 2.h,),
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () async {
                        LoginCubit.get(context).pickImage(image: LoginCubit.editAccountImage).then((value){
                          setState(() {
                            LoginCubit.editAccountImage = value;
                          });
                        });
                      },
                      child: CircleAvatar(
                        radius: 75.0,
                        backgroundColor: Color(0xffA2A2A2),
                        child: LoginCubit.editAccountImage != null ? CircleAvatar(
                            radius: 75,
                            backgroundColor: Color(0xffA2A2A2),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.file(
                                  LoginCubit.editAccountImage!,
                                  fit: BoxFit.cover,
                                  height: 300,
                                  width: 300,
                                ))) :  ClipRRect(borderRadius: BorderRadius.circular(100),child: Image.network(loginData.image!, fit: BoxFit.fill,width: 300,height: 300,)),
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    SizedBox(
                      width: 80.w,
                      height: 5.5.h,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0xff808080))),
                          onPressed: () async {
                            LoginCubit.get(context).pickImage(image: LoginCubit.editAccountImage).then((value){
                              setState(() {
                                LoginCubit.editAccountImage = value;
                              });
                            });
                          },
                          child: Text(
                            'Edit your photo',
                            style: TextStyle(
                                color: const Color(0xff808080),
                                fontSize: 15.dp,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    Spacer(),
                    MainElevatedButtonTwo(
                    condition: state is EditAccountImageLoadingState
                    ,onPressed: (){
                      if(LoginCubit.editAccountImage != null){
                        LoginCubit.get(context).editImage(image: LoginCubit.editAccountImage, context: context);
                      }else{Navigator.pop(context);}
                    }, text: 'Confirm', backgroundColor: Color(0xffFF6A03),circularBorder: true,),
                    SizedBox(height: 5.h,)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
