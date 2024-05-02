import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0038A7),
        leading: IconButton(
          icon: Ink(
            decoration:
                ShapeDecoration(shape: CircleBorder(), color: Colors.white),
            child: Padding(
              padding: EdgeInsets.all(8.dp),
              child: Icon(
                Icons.arrow_back,
                color: Color(0xff0038A7),
              ),
            ),
          ),
          onPressed: () {},
        ),
        title: Text(
          'Collect Cash',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 22.dp, horizontal: 4.w),
            decoration: BoxDecoration(
                color: Color(0xff0038A7),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20.dp),
                    bottomLeft: Radius.circular(20.dp))),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 7.0.w,
                  backgroundColor: Color(0xffECECEC),
                  child: Icon(
                    Icons.person,
                    size: 11.w,
                    color: Color(0xffA2A2A2),
                  ),
                ),
                SizedBox(
                  width: 3.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nader Nabil',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.dp),
                    ),
                    Text(
                      'Online',
                      style: TextStyle(color: Colors.white, fontSize: 13.dp),
                    )
                  ],
                ),
               const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(5.dp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.dp),
                        color: Colors.white),
                    child: Icon(Icons.phone,
                        color: Color(0xff0038A7), size: 22.dp),
                  ),
                ),
              ],
            ),
          ),
             const Spacer(),
          SingleChildScrollView(
            child: Column(
              children: [
              Text(
                '09:41 AM',
                style: TextStyle(color: Color(0xff979C9E)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 1.5.h),
                            decoration: BoxDecoration(
                                color: Color(0xff0038A7),
                                borderRadius: BorderRadius.circular(20.dp)),
                            child: Text(
                              'Hi, Mandy',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          CircleAvatar(
                            radius: 3.5.w,
                            backgroundColor: Colors.grey,
                            child: Icon(
                              Icons.person,
                              size: 18.dp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8
                                .w), // 3ayez a5aly el 2 containers 3ala nafs el line fo2 ba3d
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 1.5.h),
                          decoration: BoxDecoration(
                              color: Color(0xff0038A7),
                              borderRadius: BorderRadius.circular(20.dp)),
                          child: Text(
                            'I’ve tried the app',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  CircleAvatar(
                    radius: 3.5.w,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      size: 18.dp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
                    decoration: BoxDecoration(
                        color: Color(0xffF2F4F5),
                        borderRadius: BorderRadius.circular(20.dp)),
                    child: Text(
                      'Really ?',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
                    decoration: BoxDecoration(
                        color: Color(0xff0038A7),
                        borderRadius: BorderRadius.circular(20.dp)),
                    child: Text(
                      'Yeah, It’s really good!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  CircleAvatar(
                    radius: 3.5.w,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      size: 18.dp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  )
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  CircleAvatar(
                    radius: 3.5.w,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      size: 18.dp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    'Typing...',
                    style: TextStyle(color: Color(0xff979C9E), fontSize: 15.dp),
                  ),
                ],
              ),
              SizedBox(height: 1.5.h,),

            ],),
          ),
          Divider(
            thickness: 0.2.h,
            color: Color(0xffF2F4F5),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 2.h),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 5.w),
                  hintText: 'Type your message',
                  hintStyle: TextStyle(
                      color: Color(0xff72777A)
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.dp),
                      borderSide:
                      BorderSide(color: Color(0xff979C9E), width: 2.w))),
            ),
          )
          ////////
        ],
      ),
    );
  }
}
