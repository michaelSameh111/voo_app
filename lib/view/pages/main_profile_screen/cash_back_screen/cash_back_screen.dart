import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class CashBackScreen extends StatelessWidget {
  int points = 200;

  CashBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFF6A03),
        leading: IconButton(
          icon: Ink(
            decoration:
            const ShapeDecoration(shape: CircleBorder(), color: Colors.white),
            child: Padding(
              padding: EdgeInsets.all(8.dp),
              child: const Icon(
                Icons.arrow_back,
                color: Color(0xffFF6A03),
              ),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 22.dp, horizontal: 4.w),
            decoration: BoxDecoration(
                color: const Color(0xffFF6A03),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20.dp),
                    bottomLeft: Radius.circular(20.dp))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Cashback',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.dp,
                  fontWeight: FontWeight.w900
                ),),
                Text('You can redeem your balance for a cash money',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.dp
                ),),
              ],
            ),
          ),
          SizedBox(height: 15.h,),
          Text('Available Points',
          style: TextStyle(
            fontSize: 15.dp,
            fontWeight: FontWeight.bold
          ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$points',
              style: TextStyle(
                color: const Color(0xffFF6A03),
                fontSize: 28.dp,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(width: 2.w,),
              Text('PTS',
                style: TextStyle(
                    fontSize: 21.dp,
                    fontWeight: FontWeight.bold
                ),),
            ],
          ),
          SizedBox(height: 15.h,),
          Text('Redeem these points as cash.\nHere 10 points will be redeemed as 1 Cent.',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15.dp,
                fontWeight: FontWeight.bold
            ),),
          SizedBox(height: 2.h,),
          MainElevatedButton(
              nextScreen: CashBackScreen(),
              text: 'Redeem Now',
              backgroundColor: const Color(0xffFF6A03))
        ],
      ),
    );
  }
}
