import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/main_profile_screen/claim_screen/claim_2_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class SubmitAComplaintScreen extends StatefulWidget {
  const SubmitAComplaintScreen({super.key});


  @override
  State<SubmitAComplaintScreen> createState() => _SubmitAComplaintScreenState();
}


class _SubmitAComplaintScreenState extends State<SubmitAComplaintScreen> {
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
          'Submit a complaint',
          style: TextStyle(fontSize: 20.dp, fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0.w),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Title *',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xffF5F4F4),
                  borderRadius: BorderRadius.circular(8.dp)),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(13.dp),
                    hintText: 'Title'),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Description *',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xffF5F4F4),
                  borderRadius: BorderRadius.circular(8.dp)),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(13.dp),
                    hintText: 'Description'),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Car Images *',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xffF5F4F4),
                  borderRadius: BorderRadius.circular(8.dp)),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.arrow_forward_ios,
                    color: Colors.black,
                  size: 15.dp,),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(13.dp),
                    hintText: 'Add car image'),

              ),
            ),
            const Spacer(),
            MainElevatedButton(
                nextScreen:
                Claim2Screen(),
                text: 'Submit',
                backgroundColor: const Color(0xffFF6A03)),
            SizedBox(height: 3.h,),
          ],
        ),
      ),

    );
  }
}
