import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/main_profile_screen/edit_my_profile_screen_directory/edit_my_profile_screen.dart';

class EditYourPhotoBasicInfoScreen extends StatelessWidget {
  const EditYourPhotoBasicInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          EditMyProfileScreen()));
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
                child: Icon(Icons.arrow_back)),
          ),
        ),
        title: Text('Edit your photo',
          style: TextStyle(
              fontSize: 20.dp,
              fontWeight: FontWeight.bold
          ),)
        ,
      ),

      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              children: [
                SizedBox(height: 2.h,),
                InkWell(
                  onTap: () {}, //open gallery
                  child: CircleAvatar(
                    radius: 75.0,
                    backgroundColor: Color(0xffA2A2A2),
                    child: Icon(
                      Icons.person,
                      size: 90.0,
                      color: Colors.white,
                    ),
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
                          side: BorderSide(color: Color(0xff808080))),
                      onPressed: () {},
                      child: Container(
                        child: Text(
                          'Edit your photo',
                          style: TextStyle(
                              color: Color(0xff808080),
                              fontSize: 15.dp,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
