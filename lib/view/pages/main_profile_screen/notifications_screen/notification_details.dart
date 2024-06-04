import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class NotificationDetails extends StatelessWidget {
  const NotificationDetails({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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

          ],
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Ride Request from joshua',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                  ),
                  const Spacer(),
                  Text(
                    '1 h',
                    style: TextStyle(
                        color: const Color(0xff646363),
                        fontWeight: FontWeight.bold,
                        fontSize: 15.dp),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Text('Lorem ipsum dolor sit amet consectetur.'
                  ' Ullamcorper diam magna amet sodales.'
                  ' Pellentesque interdum gravida faucibus at'
                  ' quis vel scelerisque dolor. Pulvinar cursus'
                  ' sit pulvinar consequat leo phasellus. Libero '
                  'ullamcorper bibendum velit id pretium '
                  'enim imperdiet dolor.',
              style: TextStyle(
                fontSize: 15.dp
              ),),
              SizedBox(height: 4.h),
              Text('Lorem ipsum dolor sit amet consectetur.'
                  ' Ullamcorper diam magna amet sodales.'
                  ' Pellentesque interdum gravida faucibus at'
                  ' quis vel scelerisque dolor. Pulvinar cursus'
                  ' sit pulvinar consequat leo phasellus. Libero '
                  'ullamcorper bibendum velit id pretium '
                  'enim imperdiet dolor.',
                style: TextStyle(
                    fontSize: 15.dp
                ),),
          
            ],
          ),
        ),
      ),
    );
  }
}
