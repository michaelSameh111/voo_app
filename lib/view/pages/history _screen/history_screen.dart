import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
            'History',
            style: TextStyle(fontSize: 20.dp, fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Active',),
              Tab(text: 'Completed',),
              Tab(text: 'Cancelled',)
            ],
          ),
        ),

        body: const TabBarView(
          children: [
            ActiveHistoryScreen(),
            CompletedHistoryScreen(),
            CancelledHistoryScreen()
          ],
        )
      ),
    );
  }
}

class ActiveHistoryScreen extends StatelessWidget {
  const ActiveHistoryScreen({super.key});

  final String name = 'Andrew Micheal';
  final int tripID = 1234567899;
  final String carType = 'Sedan';


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 3.h),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xffA2A2A2),
                radius: 7.w,
                child: Icon(Icons.person,
                  size: 32.dp,
                  color: const Color(0xffFEFEFE),),
              ),
              SizedBox(width: 2.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                  style: TextStyle(
                    fontSize: 15.dp,
                    fontWeight: FontWeight.bold,

                  ),),
                  Row(
                    children: [
                      Text('Trip ID :',
                      style: TextStyle(
                        fontSize: 15.dp,
                        color: const Color(0xff646363)
                      ),),
                      SizedBox(width: 1.w,),
                      Text('$tripID',
                        style: TextStyle(
                            fontSize: 15.dp,
                            color: const Color(0xff646363)
                        ),)
                    ],
                  ),
                  // const Divider(
                  //   color: Color(0xffF5F4F4),
                  // )
                  const Row(
                    children: [

                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 2.h,),
          const Divider(color: Color(0xffF5F4F4),),
          SizedBox(height: 2.h,),
          Row(
            children: [
              Icon(Icons.location_on_outlined,
                color: const Color(0xffFF6A03),
                size: 25.dp,
              ),
              SizedBox(width: 1.w,),
              Text('4.5 Mile',
              style: TextStyle(fontSize: 15.dp),),
              const Spacer(),
              Icon(Icons.access_time,
                color: const Color(0xffFF6A03),
                size: 25.dp,
              ),
              SizedBox(width: 1.w,),
              Text('4 mins',
                style: TextStyle(fontSize: 15.dp),),
              const Spacer(),
              Icon(Icons.attach_money,
                color: const Color(0xffFF6A03),
                size: 25.dp,
              ),
              SizedBox(width: 1.w,),
              Text('\$1.25',
                style: TextStyle(fontSize: 15.dp),)
            ],
          ),
          SizedBox(height: 2.h,),
          Row(
            children: [
              Text('Date & Time',
                style: TextStyle(
                  color: const Color(0xff808080),
                  fontSize: 15.dp,
                  fontWeight: FontWeight.w500
                ),),
              const Spacer(),
              Text('Oct 18,2024',
              style: TextStyle(
                fontSize: 15.dp
              ),), //date
              SizedBox(width: 2.w,),
              Container(
                height: 3.h,
              width: 0.2.w,
              color: Colors.black,),
              SizedBox(width: 2.w,),
              Text('08:00 AM',
                style: TextStyle(
                    fontSize: 15.dp
                ),), //date
            ],
          ),
          SizedBox(height: 2.h,),
          const Divider(color: Color(0xffF5F4F4),),
          SizedBox(height: 2.h,),

          Row(
            children: [
              Image.asset(
                'assets/images/from_to_image.png',
              ),
              SizedBox(
                width: 2.w,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '481 Eighth Avenue, Hell\'s Kitchen,\nNew York, '
                          'NY 10001 , United Statessssssssssssssssssssss',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13.dp),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'The New Yorker, A Wyndham Hotel',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13.dp),
                    )
                  ],
                ),
              )
            ],
          ), // same Row as in collect cash screen

          SizedBox(height: 2.h,),
          const Divider(color: Color(0xffF5F4F4),),
          SizedBox(height: 2.h,),

          Row(
            children: [
              Text('Booking car type',
              style: TextStyle(
                color: const Color(0xff808080),
                fontSize: 15.dp,
                fontWeight: FontWeight.w500
              ),),
              const Spacer(),
              Text('$carType',
              style: TextStyle(
                fontSize: 15.dp
              ),),  //car type
            ],
          ),
          const Spacer(),

          Row(
            children: [
              SizedBox(
                width: 45.w,
                height: 5.5.h,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xffFF6A03))),
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => RegisterNowScreen()));
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Color(0xffFF6A03)),
                    )),
              ),
              const Spacer(),
              SizedBox(
                width: 45.w,
                height: 5.5.h,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffFF6A03)),
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => nextScreen));
                    },
                    child: const Text(
                      'Track Rider',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),

        ],
      ),
    );
  }
}


class CompletedHistoryScreen extends StatelessWidget {
  const CompletedHistoryScreen({super.key});

  final String name = 'Andrew Micheal';
  final int tripID = 1234567899;
  final String carType = 'Sedan';


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 3.h),
      child: Container(
        padding: EdgeInsets.all(10.dp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.dp),
          border: Border.all(
              color: Color(0xffC4C4C4))
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xffA2A2A2),
                  radius: 7.w,
                  child: Icon(Icons.person,
                    size: 32.dp,
                    color: const Color(0xffFEFEFE),),
                ),
                SizedBox(width: 2.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                      style: TextStyle(
                        fontSize: 15.dp,
                        fontWeight: FontWeight.bold,

                      ),),
                    Row(
                      children: [
                        Text('Trip ID :',
                          style: TextStyle(
                              fontSize: 15.dp,
                              color: const Color(0xff646363)
                          ),),
                        SizedBox(width: 1.w,),
                        Text('$tripID',
                          style: TextStyle(
                              fontSize: 15.dp,
                              color: const Color(0xff646363)
                          ),)
                      ],
                    ),
                    // const Divider(
                    //   color: Color(0xffF5F4F4),
                    // )
                    const Row(
                      children: [

                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 2.h,),
            const Divider(color: Color(0xffF5F4F4),),
            SizedBox(height: 2.h,),
            Row(
              children: [
                Icon(Icons.location_on_outlined,
                  color: const Color(0xffFF6A03),
                  size: 25.dp,
                ),
                SizedBox(width: 1.w,),
                Text('4.5 Mile',
                  style: TextStyle(fontSize: 15.dp),),
                const Spacer(),
                Icon(Icons.access_time,
                  color: const Color(0xffFF6A03),
                  size: 25.dp,
                ),
                SizedBox(width: 1.w,),
                Text('4 mins',
                  style: TextStyle(fontSize: 15.dp),),
                const Spacer(),
                Icon(Icons.attach_money,
                  color: const Color(0xffFF6A03),
                  size: 25.dp,
                ),
                SizedBox(width: 1.w,),
                Text('\$1.25',
                  style: TextStyle(fontSize: 15.dp),)
              ],
            ),
            SizedBox(height: 2.h,),
            Row(
              children: [
                Text('Date & Time',
                  style: TextStyle(
                      color: const Color(0xff808080),
                      fontSize: 15.dp,
                      fontWeight: FontWeight.w500
                  ),),
                const Spacer(),
                Text('Oct 18,2024',
                  style: TextStyle(
                      fontSize: 15.dp
                  ),), //date
                SizedBox(width: 2.w,),
                Container(
                  height: 3.h,
                  width: 0.2.w,
                  color: Colors.black,),
                SizedBox(width: 2.w,),
                Text('08:00 AM',
                  style: TextStyle(
                      fontSize: 15.dp
                  ),), //date
              ],
            ),
            SizedBox(height: 2.h,),
            const Divider(color: Color(0xffF5F4F4),),
            SizedBox(height: 2.h,),

            Row(
              children: [
                Image.asset(
                  'assets/images/from_to_image.png',
                ),
                SizedBox(
                  width: 2.w,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '481 Eighth Avenue, Hell\'s Kitchen,\nNew York, '
                            'NY 10001 , United Statessssssssssssssssssssss',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13.dp),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        'The New Yorker, A Wyndham Hotel',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13.dp),
                      )
                    ],
                  ),
                )
              ],
            ), // same Row as in collect cash screen

            SizedBox(height: 2.h,),
            const Divider(color: Color(0xffF5F4F4),),
            SizedBox(height: 2.h,),

            Row(
              children: [
                Text('Booking car type',
                  style: TextStyle(
                      color: const Color(0xff808080),
                      fontSize: 15.dp,
                      fontWeight: FontWeight.w500
                  ),),
                const Spacer(),
                Text('$carType',
                  style: TextStyle(
                      fontSize: 15.dp
                  ),),  //car type
              ],
            ),

          ],
        ),
      ),
    );
  }
}

class CancelledHistoryScreen extends StatelessWidget {
  const CancelledHistoryScreen({super.key});

  final String name = 'Andrew Micheal';
  final int tripID = 1234567899;
  final String carType = 'Sedan';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 3.h),
      child: Container(
        padding: EdgeInsets.all(10.dp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.dp),
            border: Border.all(
                color: Color(0xffC4C4C4))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.5.h),
              decoration:
              BoxDecoration(color: const Color(0xfffceaea),
                  borderRadius: BorderRadius.circular(15.dp)),
              child: const Text('Canceled by You',),
            ),
            SizedBox(height: 2.h,),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xffA2A2A2),
                  radius: 7.w,
                  child: Icon(Icons.person,
                    size: 32.dp,
                    color: const Color(0xffFEFEFE),),
                ),
                SizedBox(width: 2.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                      style: TextStyle(
                        fontSize: 15.dp,
                        fontWeight: FontWeight.bold,

                      ),),
                    Row(
                      children: [
                        Text('Trip ID :',
                          style: TextStyle(
                              fontSize: 15.dp,
                              color: const Color(0xff646363)
                          ),),
                        SizedBox(width: 1.w,),
                        Text('$tripID',
                          style: TextStyle(
                              fontSize: 15.dp,
                              color: const Color(0xff646363)
                          ),)
                      ],
                    ),
                    // const Divider(
                    //   color: Color(0xffF5F4F4),
                    // )
                    const Row(
                      children: [

                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 2.h,),
            const Divider(color: Color(0xffF5F4F4),),
            SizedBox(height: 2.h,),
            Row(
              children: [
                Icon(Icons.location_on_outlined,
                  color: const Color(0xffFF6A03),
                  size: 25.dp,
                ),
                SizedBox(width: 1.w,),
                Text('4.5 Mile',
                  style: TextStyle(fontSize: 15.dp),),
                const Spacer(),
                Icon(Icons.access_time,
                  color: const Color(0xffFF6A03),
                  size: 25.dp,
                ),
                SizedBox(width: 1.w,),
                Text('4 mins',
                  style: TextStyle(fontSize: 15.dp),),
                const Spacer(),
                Icon(Icons.attach_money,
                  color: const Color(0xffFF6A03),
                  size: 25.dp,
                ),
                SizedBox(width: 1.w,),
                Text('\$1.25',
                  style: TextStyle(fontSize: 15.dp),)
              ],
            ),
            SizedBox(height: 2.h,),
            Row(
              children: [
                Text('Date & Time',
                  style: TextStyle(
                      color: const Color(0xff808080),
                      fontSize: 15.dp,
                      fontWeight: FontWeight.w500
                  ),),
                const Spacer(),
                Text('Oct 18,2024',
                  style: TextStyle(
                      fontSize: 15.dp
                  ),), //date
                SizedBox(width: 2.w,),
                Container(
                  height: 3.h,
                  width: 0.2.w,
                  color: Colors.black,),
                SizedBox(width: 2.w,),
                Text('08:00 AM',
                  style: TextStyle(
                      fontSize: 15.dp
                  ),), //date
              ],
            ),
            SizedBox(height: 2.h,),
            const Divider(color: Color(0xffF5F4F4),),
            SizedBox(height: 2.h,),

            Row(
              children: [
                Image.asset(
                  'assets/images/from_to_image.png',
                ),
                SizedBox(
                  width: 2.w,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '481 Eighth Avenue, Hell\'s Kitchen,\nNew York, '
                            'NY 10001 , United Statessssssssssssssssssssss',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13.dp),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        'The New Yorker, A Wyndham Hotel',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13.dp),
                      )
                    ],
                  ),
                )
              ],
            ), // same Row as in collect cash screen

            SizedBox(height: 2.h,),
            const Divider(color: Color(0xffF5F4F4),),
            SizedBox(height: 2.h,),

            Row(
              children: [
                Text('Booking car type',
                  style: TextStyle(
                      color: const Color(0xff808080),
                      fontSize: 15.dp,
                      fontWeight: FontWeight.w500
                  ),),
                const Spacer(),
                Text('$carType',
                  style: TextStyle(
                      fontSize: 15.dp
                  ),),  //car type
              ],
            ),

          ],
        ),
      ),
    );
  }
}

