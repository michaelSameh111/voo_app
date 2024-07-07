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
        body:  TabBarView(
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
   FAQScreenInHelpCenter({super.key});
  final List<String> allQuestions = [
    'What is Voo?',
    'How does Voo work?',
     "How do I become a Voo driver?",
     "What are the vehicle requirements?",
     "How do I get paid?",
     "Can I set my own hours?",
     "What support is available for drivers?",
     "How does Voo ensure rider and driver safety?",
     "What should I do in case of an emergency?",
     "How can I contact Voo customer support?",
     "How can I provide feedback about my ride?",
     "What should I do if I have a dispute or issue with a ride?"
   ];

  final List<String> allAnswers = [
    'Voo is a rideshare company that connects riders with drivers through a user-friendly mobile app. Our goal is to provide safe, affordable, and convenient transportation solutions.',
    'Riders can request a ride through the Voo app, which matches them with a nearby driver. The app provides real-time tracking, estimated arrival times, and fare estimates.',
     "To become a Voo driver, download the Voo Driver app, create an account, and complete the application process, which includes background checks and vehicle inspections.",
     "Vehicle requirements vary by location, but generally, vehicles must be in good condition, have four doors, and pass a safety inspection. Check the Voo Driver app for specific requirements in your area.",
     "Drivers are paid weekly via direct deposit. You can track your earnings in the Voo Driver app and see detailed trip summaries.",
     "Yes, Voo drivers have the flexibility to choose their own hours and work when it suits them best.",
     "Voo offers 24/7 driver support through the app, as well as an extensive help center with resources and FAQs. Additionally, we host regular driver events and webinars to provide ongoing support and training.",
     "Voo has a range of safety measures, including background checks for drivers, in-app safety features like GPS tracking and ride sharing with contacts, and a dedicated safety team.",
     "In case of an emergency, use the in-app emergency button to contact local authorities immediately. You can also reach out to Voo’s emergency support team through the app.",
     "You can contact Voo customer support through the app by navigating to the “Help” section, or by visiting our website and accessing the support page.",
     "After each ride, you have the option to rate your driver and leave feedback in the app. Your feedback helps us improve our service and maintain high standards.",
     "If you encounter any issues with a ride, please contact our customer support team through the app. We are committed to resolving disputes and ensuring a positive experience for both riders and drivers."
   ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 4.h),
      child: ListView.separated(separatorBuilder: (context,index)=>SizedBox(height: 2.h,),itemBuilder: (context,index)=>CustomExpansionTile(context,question: allQuestions[index],answer: allAnswers[index]),shrinkWrap: true,itemCount: allQuestions.length,physics: BouncingScrollPhysics(),),
    );
  }
  Widget CustomExpansionTile (BuildContext context,
      {String? question, String? answer}){
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.dp),
          border: Border.all(color: const Color(0xffECECEC))
      ),
      child: ExpansionTile(
        iconColor: const Color(0xffFF6A03),
        title: Text(
          '${question}',
          style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 15.dp),),
        children: <Widget> [
          ListTile(
            title: Text('$answer',
              style: TextStyle(color: const Color(0xff808080),
                  fontSize: 15.dp),
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
