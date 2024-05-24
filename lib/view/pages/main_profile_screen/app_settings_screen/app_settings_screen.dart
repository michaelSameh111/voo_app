import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class AppSettingsScreen extends StatelessWidget {
  const AppSettingsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10.h,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.0.w),
          child: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                  )],
                  shape: BoxShape.circle,
                  color: Colors.white,),
                child: const Icon(Icons.arrow_back)),
          ),
        ),
        title: Text('App Settings',
          style: TextStyle(
              fontSize: 20.dp,
              fontWeight: FontWeight.bold
          ),)
        ,
      ),

      body: Column(
        children: [
          InkWell(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) =>
              //             AppSettingsScreen()));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              child: Row(
                children: [
                  Text(
                    'Terms and Conditions',
                    style: TextStyle(fontSize: 15.dp),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: const Color(0xffA2A2A2),
                    size: 17.dp,
                  )
                ],
              ),
            ),
          ),
          const Divider(
            color: Color(0xffF5F4F4),
          ),
          InkWell(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) =>
              //             AppSettingsScreen()));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              child: Row(
                children: [
                  Text(
                    'Privacy Policy ',
                    style: TextStyle(fontSize: 15.dp),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: const Color(0xffA2A2A2),
                    size: 17.dp,
                  )
                ],
              ),
            ),
          ),
          const Divider(
            color: Color(0xffF5F4F4),
          ),
          InkWell(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) =>
              //             AppSettingsScreen()));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              child: Row(
                children: [
                  Text(
                    'Delete Account ',
                    style: TextStyle(fontSize: 15.dp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
