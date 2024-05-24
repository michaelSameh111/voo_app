import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class Claim2Screen extends StatelessWidget {
  Claim2Screen({super.key});

  //// this screen appears if there is at least one complaint ////

  Widget buildSubmittedClaim () => InkWell(
    onTap: (){},
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                '08:20 AM', //timing
                style: TextStyle(
                    fontSize: 15.dp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff646363)),
              ),
            ),
            SizedBox(
              width: 1.w,
            ),
            Expanded(
              child: Text(
                '-', //timing
                style: TextStyle(
                    fontSize: 15.dp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff646363)),
              ),
            ),
            SizedBox(
              width: 1.w,
            ),
            Expanded(
              child: Text(
                '10.2.2024', //date
                style: TextStyle(
                    fontSize: 15.dp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff646363)),
              ),
            ),
          ],
        ),
        SizedBox(height: 0.4.h,),
        Text(
          'Ride from $from to $to',
          style: TextStyle(
            fontSize: 15.dp,
          ),
        ),
        SizedBox(height: 0.4.h,),
        Row(
          children: [
            Text('Trip ID :',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.dp
              ),),
            SizedBox(width: 1.w,),
            Text('1234567899',
              style: TextStyle(
                  fontSize: 15.dp
              ),),
            const Spacer(),
            Text('\$20',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.dp
              ),),

          ],
        )//row of time and date
      ],
    ),
  );

  String from = 'X';
  String to = 'Y';

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
          'Claim',
          style: TextStyle(fontSize: 20.dp, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0.w),
        child: Column(
          children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => buildSubmittedClaim(),
                separatorBuilder:(context, index) => const Divider(),
                itemCount: 20),
          ),
            MainElevatedButton(
                nextScreen:
                Claim2Screen(),
                text: 'Submit a complaint',
                backgroundColor: const Color(0xffFF6A03)),
            SizedBox(height: 3.h,),
          ],
        ),
      ),
    );
  }
}
