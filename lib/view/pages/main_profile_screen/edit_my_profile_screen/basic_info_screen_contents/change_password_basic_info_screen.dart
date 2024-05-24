import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/main_profile_screen/edit_my_profile_screen/edit_my_profile_screen.dart';
// import 'package:voo_app/view/pages/edit_my_profile_screen/edit_my_profile_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class ChangePasswordBasicInfoScreen extends StatelessWidget {
  const ChangePasswordBasicInfoScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 10.h,
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.0.w),
            child: InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const EditMyProfileScreen()));
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
          title: Text('Change Password',
            style: TextStyle(
                fontSize: 20.dp,
                fontWeight: FontWeight.bold
            ),)
          ,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Current Password *',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 15.dp),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xffF5F4F4),
                    borderRadius: BorderRadius.circular(10)),
                child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                      hintText: 'Password'),
                ),
              ),
              TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             ForgetPasswordScreen()));
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password ?',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'New Password *',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 15.dp),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xffF5F4F4),
                    borderRadius: BorderRadius.circular(10)),
                child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                      hintText: 'Password'),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Re-type New Password *',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 15.dp),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xffF5F4F4),
                    borderRadius: BorderRadius.circular(10)),
                child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                      hintText: 'Password'),
                ),
              ),
              SizedBox(height: 25.h,),
              MainElevatedButton(
                  nextScreen: const ChangePasswordBasicInfoScreen(),
                  text: 'Update',
                  backgroundColor: const Color(0xff0038A7)),
            ],
          ),
        ),
      ),
    );
  }
}
