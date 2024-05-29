import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/Controller/Constants.dart';
import 'package:voo_app/view/pages/driver_license.dart';
import 'package:voo_app/view/pages/insurance_screen.dart';
import 'package:voo_app/view/pages/select_transport_screen.dart';
import 'package:voo_app/view/pages/social_security_screen.dart';
import 'package:voo_app/view/widgets/raise_documents_container_widget.dart';

class DataCheckScreen extends StatelessWidget {
  const DataCheckScreen({super.key});



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
            'Verify Your Data',
            style: TextStyle(fontSize: 20.dp, fontWeight: FontWeight.bold,color: Colors.black),
          ),
        ),

        body:
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.0.w,vertical: 2.h),
          child: Column(
            children: [
              RaiseDocumentsContainerWidget(
                  uploadedPicture: loginData.driverData != null ? true : false,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SocialSecurityScreen()));
                  },
                  text: 'Driver Data'),
              SizedBox(height: 2.h,),
              RaiseDocumentsContainerWidget(
                  uploadedPicture:loginData.driverInsurance != null ? true : false,
                  text: 'Insurance Data',
                onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>InsuranceScreen()));
                },
              ),
              SizedBox(height: 2.h,),
              RaiseDocumentsContainerWidget(
                  uploadedPicture:loginData.driverLicense != null ? true : false,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DriverLicenseScreen()));
                  },
                  text: 'License Data'),
              SizedBox(height: 2.h,),
              RaiseDocumentsContainerWidget(
                  uploadedPicture:loginData.driverVehicle != null ? true : false,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SelectTransportScreen()));
                  },
                  text: 'Vehicle Data'),
            ],
          ),
        )
    );
  }
}
