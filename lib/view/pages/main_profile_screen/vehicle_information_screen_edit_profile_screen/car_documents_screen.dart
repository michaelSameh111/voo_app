import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/widgets/raise_documents_container_widget.dart';

import '../../../../Controller/Constants.dart';
import '../../../../Controller/Login/login_cubit.dart';
import '../../../widgets/main_elevated_button.dart';

class CarDocumentScreen extends StatelessWidget {
  const CarDocumentScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 10.h,
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.0.w),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
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
                  child: const Icon(Icons.arrow_back,color: Colors.black,)),
            ),
          ),
          title: Text(
            'Car Documents',
            style: TextStyle(fontSize: 20.dp, fontWeight: FontWeight.bold,color: Colors.black),
          ),
        ),

      body:
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.0.w),
          child: Column(
            children: [
              SizedBox(height: 2.h,),
              RaiseDocumentsContainerWidget(
                  uploadedPicture: false,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> RcImageScreen()));
                  },
                  text: 'RC Image'),
              SizedBox(height: 2.h,),
            ],
          ),
        )
    );
  }
}



class RcImageScreen extends StatefulWidget {
  @override
  State<RcImageScreen> createState() => _RcImageScreenState();
}

class _RcImageScreenState extends State<RcImageScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  children: [
                    SizedBox(
                      height: 8.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Text(
                                'Rc Image',
                                style: TextStyle(
                                    fontSize: 25.dp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              DottedBorder(
                                dashPattern: [8, 4],
                                color: Color(0xff808080),
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Color(0xffF5F4F4),
                                  ),
                                  child: LoginCubit.vehicleRCImage != null
                                      ? InkWell(
                                    onTap: () async {
                                      await LoginCubit.get(context)
                                          .pickImage(
                                          image: LoginCubit
                                              .vehicleRCImage)
                                          .then((value) {
                                        setState(() {
                                          LoginCubit.vehicleRCImage =
                                              value;
                                        });
                                      });
                                    },
                                    child: Image.file(
                                      LoginCubit.vehicleRCImage!,
                                      height: 40.h,
                                      width: 100.w,
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                      : Column(
                                    children: [
                                      Icon(
                                        Icons.camera_alt_rounded,
                                        size: 45.dp,
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Click here to take a clear picture of the\n                     registration card',
                                          style: TextStyle(
                                              color: Colors.black),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      SizedBox(
                                        child: ElevatedButton(
                                            style: ElevatedButton
                                                .styleFrom(
                                                backgroundColor:
                                                const Color(
                                                    0xffFF6A03)),
                                            onPressed: () async {
                                              await LoginCubit.get(
                                                  context)
                                                  .pickImage(
                                                  image: LoginCubit
                                                      .vehicleRCImage)
                                                  .then((value) {
                                                setState(() {
                                                  LoginCubit
                                                      .vehicleRCImage =
                                                      value;
                                                });
                                              });
                                            },
                                            child: Text(
                                              '+',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontSize: 25.dp),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        MainElevatedButtonTwo(
                            onPressed: () {
                                if (LoginCubit.vehicleRCImage == null) {
                                  showSimpleDialog(
                                      context,
                                      'Please Add RC Image',
                                      'An RC is required to proceed.');
                                } else {
                                  Navigator.pop(context);
                                }

                            },
                            text: 'Next',
                            backgroundColor: Color(0xffFF6A03)),
                        SizedBox(height: 2.h,)
                      ],
                    )
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

