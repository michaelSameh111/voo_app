import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

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
            elevation: 0,
            backgroundColor: Colors.transparent,
            toolbarHeight: 10.h,
            leadingWidth: 0,
            bottom: TabBar(
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(color: Color(0xffFF6A03),width: 2),
              ),
              tabs: [
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 1.h),
                  child: Text(
                    'FAQ',
                    style: TextStyle(
                        color: const Color(0xffFF6A03),
                        fontWeight: FontWeight.bold,
                        fontSize: 14.8.dp),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 1.h),
                  child: Text(
                    'Contact Us',
                    style: TextStyle(
                        color: const Color(0xffFF6A03),
                        fontWeight: FontWeight.bold,
                        fontSize: 14.8.dp),
                  ),
                ),
              ],
            ),
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
                Text(
                  'Help Center',
                  style: TextStyle(
                      fontSize: 20.dp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
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
      child: SingleChildScrollView(
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
          // Container(
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(13.dp),
          //       border: Border.all(color: const Color(0xffECECEC))
          //   ),
          //   child: ExpansionTile(
          //     iconColor: const Color(0xffFF6A03),
          //     title: Row(
          //       children: [
          //         const Icon(Icons.headset_mic,
          //         color: Color(0xffFF6A03),),
          //         SizedBox(width: 2.w,),
          //         Text(
          //           'Customer Service',
          //           style: TextStyle(fontWeight: FontWeight.bold,
          //               fontSize: 15.dp),),
          //       ],
          //     ),
          //     children: <Widget> [
          //       ListTile(
          //         title: Text('0123546879',
          //           style: TextStyle(color: const Color(0xff808080),
          //               fontSize: 15.dp),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(height: 2.h,),
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
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 15.dp),),
                ],
              ),
              children: <Widget> [
                ListTile(
                  title: Text('support@voorideshare.com',
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
                  title: TextButton(
                    onPressed: () async {
                      final url = Uri.parse('https://www.voorideshare.com/');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url, mode: LaunchMode.externalApplication);
                      }
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Text('https://www.voorideshare.com/',
                            style: TextStyle(color:  Colors.blue,
                                fontSize: 15.dp),
                          ),
                        ),
                      ],
                    ),
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
