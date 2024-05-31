import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/Controller/Login/login_cubit.dart';
import 'package:voo_app/view/widgets/ImagePickScreen.dart';
import 'package:voo_app/view/widgets/raise_documents_container_widget.dart';

class CarImages extends StatelessWidget {
  const CarImages({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {},
  builder: (context, state) {
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
            'Car Images',
            style: TextStyle(fontSize: 20.dp, fontWeight: FontWeight.bold,color: Colors.black),
          ),
        ),

        body:
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.0.w),
          child: Column(
            children: [
              RaiseDocumentsContainerWidget(
                  uploadedPicture: LoginCubit.vehicleFrontImage == null ? false : true,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>VehicleFrontImage()));
                  },
                  text: 'Front side'),
              SizedBox(height: 2.h,),
              RaiseDocumentsContainerWidget(
                  uploadedPicture: LoginCubit.vehicleBackImage == null ? false : true,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>VehicleBackImage()));
                  },
                  text: 'Back Side'),
              SizedBox(height: 2.h,),
              RaiseDocumentsContainerWidget(
                  uploadedPicture: LoginCubit.vehicleLeftImage == null ? false : true,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>VehicleLeftImage()));
                  },
                  text: 'Left side'),
              SizedBox(height: 2.h,),
              RaiseDocumentsContainerWidget(
                  uploadedPicture: LoginCubit.vehicleRightImage == null ? false : true,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>VehicleRightImage()));
                  },
                  text: 'Right side'),
            ],
          ),
        )
    );
  },
);
  }
}
