import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class TodayEarnedScreen extends StatelessWidget {
  const TodayEarnedScreen({super.key});

  Widget earningItem () => InkWell(
    onTap: (){},
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xffD9D9D9),
          radius: 8.w,
        ),
        SizedBox(width: 4.w,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Carla Barlow',
              style: TextStyle(
                  fontSize: 15.dp,
                  fontWeight: FontWeight.bold
              ),),
            SizedBox(height: 0.5.h,),
            Row(
              children: [
                Text('4.5 Miles', //Miles
                  style: TextStyle(
                      fontSize: 14.dp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff808080)
                  ),),
                SizedBox(width: 3.w,),
                Container(
                  height: 3.h,
                  width: 0.3.w,
                  color: const Color(0xff808080),
                ),
                SizedBox(width: 3.w,),
                Text('10 mins', //time
                  style: TextStyle(
                      fontSize: 14.dp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff808080)
                  ),),
                SizedBox(width: 3.w,),
                Container(
                  height: 3.h,
                  width: 0.3.w,
                  color: const Color(0xff808080),
                ),
                SizedBox(width: 3.w,),
                Text('\$25.00', //earnings
                  style: TextStyle(
                      fontSize: 14.dp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff808080)
                  ),),
              ],
            ),

          ],
        )
      ],
    ),
  );

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
          'Today Earned',
          style: TextStyle(fontSize: 20.dp, fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0.w),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 30.w,
                  height: 11.h,
                  decoration: BoxDecoration(
                      color: const Color(0xffECECEC),
                      borderRadius: BorderRadius.circular(15.dp),
                      border: Border.all(color: const Color(0xff646363))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total Hour',
                        style: TextStyle(
                            color: const Color(0xff646363), fontSize: 14.dp),
                      ),
                      Text(
                        '02',
                        style: TextStyle(
                            fontSize: 14.dp, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  width: 30.w,
                  height: 11.h,
                  decoration: BoxDecoration(
                      color: const Color(0xffECECEC),
                      borderRadius: BorderRadius.circular(15.dp),
                      border: Border.all(color: const Color(0xff646363))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total Miles',
                        style: TextStyle(
                            color: const Color(0xff646363), fontSize: 14.dp),
                      ),
                      Text(
                        '80',
                        style: TextStyle(
                            fontSize: 14.dp, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  width: 30.w,
                  height: 11.h,
                  decoration: BoxDecoration(
                      color: const Color(0xffECECEC),
                      borderRadius: BorderRadius.circular(15.dp),
                      border: Border.all(color: const Color(0xff646363))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Earnings',
                        style: TextStyle(
                            color: const Color(0xff646363), fontSize: 14.dp),
                      ),
                      Text(
                        '\$100',
                        style: TextStyle(
                            fontSize: 14.dp, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.h,),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => earningItem(),
                  separatorBuilder: (context, index) => const Divider(color: Color(0xffECECEC),),
                  itemCount: 10),
            ),
            SizedBox(height: 4.h,),
          ],
        ),
      ),
    );
  }
}
