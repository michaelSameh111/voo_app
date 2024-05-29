
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class ZeroScreen extends StatelessWidget {
  const ZeroScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                child: const Icon(Icons.arrow_back)),
          ),
        ),
        title: Text(
          '00000',
          style: TextStyle(fontSize: 20.dp, fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 3.h,),
            Text('To prevent delays, make sure your driver’s license:',
            style: TextStyle(
                color: const Color(0xff808080),
            fontSize: 15.dp),),
            SizedBox(height: 1.h,),
            Text('- Is current (not expired)',
              style: TextStyle(
                  color: const Color(0xff808080),
                  fontSize: 15.dp),),
            Text('- Is not blurry',
              style: TextStyle(
                  color: const Color(0xff808080),
                  fontSize: 15.dp),),
            Text('- Includes all four corners of the card',
              style: TextStyle(
                  color: const Color(0xff808080),
                  fontSize: 15.dp),),
            SizedBox(height: 3.h,),
            DottedBorder(
              dashPattern: const [8, 4],
              color: const Color(0xff808080),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xffF5F4F4),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.camera_alt_rounded,
                      size: 45.dp,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Click here to upload a clear pictue of\n              front of driver\'s license',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    MainElevatedButton(
                        nextScreen:
                        const ZeroScreen(), //mo2akatan 3amelha ZeroScreen next page
                        text: 'Upload',
                        backgroundColor: const Color(0xffFF6A03)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            Stack(
              children: [
                Image.asset('assets/images/claim_image.png',
                width: 25.w,height: 15.h,), // Replace with your image
                Positioned(
                  top: 2.0,
                  right: -1.0,
                  child: GestureDetector(
                    onTap: () {
                      // Handle cancel button tap
                    },
                    child: Container(
                      color: Colors.white,
                      child: const Icon(
                        Icons.cancel,
                        color: Colors.black,
                        size: 18.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: MainElevatedButton(
                  nextScreen:
                  const ZeroScreen(), //mo2akatan 3amelha ZeroScreen next page
                  text: 'Done',
                  backgroundColor: const Color(0xffFF6A03)),
            ),
            SizedBox(height: 3.h,)
          ],
        ),
      ),
    );
  }
}
