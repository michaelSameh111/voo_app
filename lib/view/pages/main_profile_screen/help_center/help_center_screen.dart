import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  bool customIcon = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
            'Help Center',
            style: TextStyle(fontSize: 20.dp, fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            tabs: [
              Text(
                'FAQ',
                style: TextStyle(
                    color: const Color(0xffFF6A03),
                    fontWeight: FontWeight.bold,
                    fontSize: 14.8.dp),
              ),
              Text(
                'Contact Us',
                style: TextStyle(
                    color: const Color(0xffFF6A03),
                    fontWeight: FontWeight.bold,
                    fontSize: 14.8.dp),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FAQScreenInHelpCenter(),
            ContactUsScreenInHelpCenter()
          ],
        )
      ),
    );
  }
}

class FAQScreenInHelpCenter extends StatelessWidget {
  const FAQScreenInHelpCenter({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 4.h),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.dp),
                border: Border.all(color: const Color(0xffECECEC))
            ),
            child: ExpansionTile(
              iconColor: const Color(0xffFF6A03),
              title: Text(
                'How to cancel trip?',
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 15.dp),),
              children: <Widget> [
                ListTile(
                  title: Text('Lorem ipsum dolor sit amet consectetur.'
                      ' Magna bibendum rutrum feugiat non risus '
                      ' hac ipsum.',
                    style: TextStyle(color: const Color(0xff808080),
                        fontSize: 15.dp),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h,),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.dp),
                border: Border.all(color: const Color(0xffECECEC))
            ),
            child: ExpansionTile(
              iconColor: const Color(0xffFF6A03),
              title: Text(
                'How to cancel trip?',
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 15.dp),),
              children: <Widget> [
                ListTile(
                  title: Text('Lorem ipsum dolor sit amet consectetur.'
                      ' Magna bibendum rutrum feugiat non risus '
                      ' hac ipsum.',
                    style: TextStyle(color: const Color(0xff808080),
                        fontSize: 15.dp),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h,),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.dp),
                border: Border.all(color: const Color(0xffECECEC))
            ),
            child: ExpansionTile(
              iconColor: const Color(0xffFF6A03),
              title: Text(
                'How to cancel trip?',
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 15.dp),),
              children: <Widget> [
                ListTile(
                  title: Text('Lorem ipsum dolor sit amet consectetur.'
                      ' Magna bibendum rutrum feugiat non risus '
                      ' hac ipsum.',
                    style: TextStyle(color: const Color(0xff808080),
                        fontSize: 15.dp),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h,),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.dp),
                border: Border.all(color: const Color(0xffECECEC))
            ),
            child: ExpansionTile(
              iconColor: const Color(0xffFF6A03),
              title: Text(
                'How to cancel trip?',
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 15.dp),),
              children: <Widget> [
                ListTile(
                  title: Text('Lorem ipsum dolor sit amet consectetur.'
                      ' Magna bibendum rutrum feugiat non risus '
                      ' hac ipsum.',
                    style: TextStyle(color: const Color(0xff808080),
                        fontSize: 15.dp),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h,),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.dp),
                border: Border.all(color: const Color(0xffECECEC))
            ),
            child: ExpansionTile(
              iconColor: const Color(0xffFF6A03),
              title: Text(
                'How to cancel trip?',
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 15.dp),),
              children: <Widget> [
                ListTile(
                  title: Text('Lorem ipsum dolor sit amet consectetur.'
                      ' Magna bibendum rutrum feugiat non risus '
                      ' hac ipsum.',
                    style: TextStyle(color: const Color(0xff808080),
                        fontSize: 15.dp),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class ContactUsScreenInHelpCenter extends StatelessWidget {
  const ContactUsScreenInHelpCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 4.h),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.dp),
                border: Border.all(color: const Color(0xffECECEC))
            ),
            child: ExpansionTile(
              iconColor: const Color(0xffFF6A03),
              title: Row(
                children: [
                  const Icon(Icons.headset_mic,
                  color: Color(0xffFF6A03),),
                  SizedBox(width: 2.w,),
                  Text(
                    'Customer Service',
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 15.dp),),
                ],
              ),
              children: <Widget> [
                ListTile(
                  title: Text('0123546879',
                    style: TextStyle(color: const Color(0xff808080),
                        fontSize: 15.dp),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h,),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.dp),
                border: Border.all(color: const Color(0xffECECEC))
            ),
            child: ExpansionTile(
              iconColor: const Color(0xffFF6A03),
              title: Row(
                children: [
                  const Icon(Icons.textsms_outlined,
                    color: Color(0xffFF6A03),),
                  SizedBox(width: 2.w,),
                  Text(
                    'WhatsApp',
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 15.dp),),
                ],
              ),
              children: <Widget> [
                ListTile(
                  title: Text('(490) 595-0165',
                    style: TextStyle(color: const Color(0xff808080),
                        fontSize: 15.dp),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h,),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.dp),
                border: Border.all(color: const Color(0xffECECEC))
            ),
            child: ExpansionTile(
              iconColor: const Color(0xffFF6A03),
              title: Row(
                children: [
                  const Icon(Icons.sports_basketball_outlined,
                    color: Color(0xffFF6A03),),
                  SizedBox(width: 2.w,),
                  Text(
                    'Website',
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 15.dp),),
                ],
              ),
              children: <Widget> [
                ListTile(
                  title: Text('www.voo.com',
                    style: TextStyle(color: const Color(0xff808080),
                        fontSize: 15.dp),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h,),
        ],
      ),
    );
  }
}
