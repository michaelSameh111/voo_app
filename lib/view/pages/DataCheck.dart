import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:voo_app/Controller/Constants.dart';
import 'package:voo_app/Controller/Data/data_cubit.dart';
import 'package:voo_app/view/pages/driver_license.dart';
import 'package:voo_app/view/pages/insurance_screen.dart';
import 'package:voo_app/view/pages/select_transport_screen.dart';
import 'package:voo_app/view/pages/social_security_screen.dart';
import 'package:voo_app/view/widgets/raise_documents_container_widget.dart';

class DataCheckScreen extends StatelessWidget {
  const DataCheckScreen({super.key});
  void showVerificationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Document Verification'),
          content: Text(
              'Thank you for your interest in joining our team. We\'re currently verifying your documents and we will reach out soon.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
             Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
  void showVerificationPendingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Document Verification'),
          content: Text(
              'You have to wait until background check approve before getting a request from riders'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataCubit, DataState>(
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
                  uploadedPicture: driverData!= null ? true : false,
                  onTap: (){
                    if(driverData != null){}else {  Navigator.push(context, MaterialPageRoute(builder: (context)=>SocialSecurityScreen()));}
                  },
                  text: 'Driver Data'),
              SizedBox(height: 2.h,),
              RaiseDocumentsContainerWidget(
                  uploadedPicture:insuranceData != null ? true : false,
                  text: 'Insurance Data',
                onTap: (){
                    if(insuranceData != null){}else {  Navigator.push(context, MaterialPageRoute(builder: (context)=>InsuranceScreen()));}

                },
              ),
              SizedBox(height: 2.h,),
              RaiseDocumentsContainerWidget(
                  uploadedPicture:licenseData != null ? true : false,
                  onTap: (){
                    if(licenseData != null){}else{ Navigator.push(context, MaterialPageRoute(builder: (context)=>DriverLicenseScreen()));}

                  },
                  text: 'License Data'),
              SizedBox(height: 2.h,),
              RaiseDocumentsContainerWidget(
                  uploadedPicture:driverVehicle != null ? true : false,
                  onTap: (){
                    if(driverVehicle !=null){} else {Navigator.push(context, MaterialPageRoute(builder: (context)=> SelectTransportScreen()));}
                  },
                  text: 'Vehicle Data'),
              SizedBox(height: 2.h,),
              RaiseDocumentsContainerWidget(
                  uploadedPicture:availableToCheck == 'true' ? true : false,
                  onTap: (){
                    if(loginData.invitaionUrl == null){
                      if(loginData.backgroundCheckStatus == 'Pending'){
                        showVerificationPendingDialog(context);
                      } else {
                        showVerificationDialog(context);
                      }
                    } else { _launchUrl('${loginData.invitaionUrl}');

                    }
                  },
                  text: 'Background Check'),
            ],
          ),
        )
    );
  },
);
  }
  Future<void> _launchUrl(url) async {
    if (!await launchUrl(Uri.parse(url),mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch ');
    }
  }
}
