import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import '../../../../Controller/Constants.dart';
import '../../../../Controller/Login/login_cubit.dart';
import 'main_elevated_button.dart';

class VehicleFrontImage extends StatefulWidget {
  @override
  State<VehicleFrontImage> createState() => _VehicleFrontImageState();
}
class _VehicleFrontImageState extends State<VehicleFrontImage> {


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
                                'Vehicle Front Image',
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
                                  child: LoginCubit.vehicleFrontImage != null
                                      ? InkWell(
                                    onTap: () async {
                                      await LoginCubit.get(context)
                                          .pickImage(
                                          image: LoginCubit
                                              .vehicleFrontImage)
                                          .then((value) {
                                        setState(() {
                                          LoginCubit.vehicleFrontImage =
                                              value;
                                        });
                                      });
                                    },
                                    child: Image.file(
                                      LoginCubit.vehicleFrontImage!,
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
                                        onPressed: () {
                                          print(LoginCubit.vehicleFrontImage);
                                        },
                                        child: Text(
                                          'Click here to take a clear picture of the\n                     Front Image',
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
                                                      .vehicleFrontImage)
                                                  .then((value) {
                                                setState(() {
                                                  LoginCubit
                                                      .vehicleFrontImage =
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
                              if (LoginCubit.vehicleFrontImage == null) {
                                showSimpleDialog(
                                    context,
                                    'Please Add Front Image',
                                    'Front Image is required to proceed.');
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



class VehicleBackImage extends StatefulWidget {
  @override
  State<VehicleBackImage> createState() => _VehicleBackImageState();
}
class _VehicleBackImageState extends State<VehicleBackImage> {


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
                                'Vehicle Back Image',
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
                                  child: LoginCubit.vehicleBackImage != null
                                      ? InkWell(
                                    onTap: () async {
                                      await LoginCubit.get(context)
                                          .pickImage(
                                          image: LoginCubit
                                              .vehicleBackImage)
                                          .then((value) {
                                        setState(() {
                                          LoginCubit.vehicleBackImage =
                                              value;
                                        });
                                      });
                                    },
                                    child: Image.file(
                                      LoginCubit.vehicleBackImage!,
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
                                        onPressed: () {
                                          print(LoginCubit.vehicleBackImage);
                                        },
                                        child: Text(
                                          'Click here to take a clear picture of the\n                     Back Image',
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
                                                      .vehicleBackImage)
                                                  .then((value) {
                                                setState(() {
                                                  LoginCubit
                                                      .vehicleBackImage =
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
                              if (LoginCubit.vehicleBackImage == null) {
                                showSimpleDialog(
                                    context,
                                    'Please Add Back Image',
                                    'Back Image is required to proceed.');
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



class VehicleRightImage extends StatefulWidget {
  @override
  State<VehicleRightImage> createState() => _VehicleRightImageState();
}
class _VehicleRightImageState extends State<VehicleRightImage> {


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
                                'Vehicle Right Image',
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
                                  child: LoginCubit.vehicleRightImage != null
                                      ? InkWell(
                                    onTap: () async {
                                      await LoginCubit.get(context)
                                          .pickImage(
                                          image: LoginCubit
                                              .vehicleRightImage)
                                          .then((value) {
                                        setState(() {
                                          LoginCubit.vehicleRightImage =
                                              value;
                                        });
                                      });
                                    },
                                    child: Image.file(
                                      LoginCubit.vehicleRightImage!,
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
                                        onPressed: () {
                                          print(LoginCubit.vehicleRightImage);
                                        },
                                        child: Text(
                                          'Click here to take a clear picture of the\n                     Right Image',
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
                                                      .vehicleRightImage)
                                                  .then((value) {
                                                setState(() {
                                                  LoginCubit
                                                      .vehicleRightImage =
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
                              if (LoginCubit.vehicleRightImage == null) {
                                showSimpleDialog(
                                    context,
                                    'Please Add Right Image',
                                    'Right Image is required to proceed.');
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



class VehicleLeftImage extends StatefulWidget {
  @override
  State<VehicleLeftImage> createState() => _VehicleLeftImageState();
}
class _VehicleLeftImageState extends State<VehicleLeftImage> {


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
                                'Vehicle Left Image',
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
                                  child: LoginCubit.vehicleLeftImage != null
                                      ? InkWell(
                                    onTap: () async {
                                      await LoginCubit.get(context)
                                          .pickImage(
                                          image: LoginCubit
                                              .vehicleLeftImage)
                                          .then((value) {
                                        setState(() {
                                          LoginCubit.vehicleLeftImage =
                                              value;
                                        });
                                      });
                                    },
                                    child: Image.file(
                                      LoginCubit.vehicleLeftImage!,
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
                                        onPressed: () {
                                          print(LoginCubit.vehicleLeftImage);
                                        },
                                        child: Text(
                                          'Click here to take a clear picture of the\n                     Left Image',
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
                                                      .vehicleLeftImage)
                                                  .then((value) {
                                                setState(() {
                                                  LoginCubit
                                                      .vehicleLeftImage =
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
                              if (LoginCubit.vehicleLeftImage == null) {
                                showSimpleDialog(
                                    context,
                                    'Please Add Left Image',
                                    'Left Image is required to proceed.');
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

