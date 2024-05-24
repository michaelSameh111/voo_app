import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/we_will_review_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class BankAccountDetailsScreen extends StatefulWidget {
  const BankAccountDetailsScreen({super.key});


  @override
  State<BankAccountDetailsScreen> createState() => _BankAccountDetailsScreenState();
}
final List<String> banks = [
  'HSBC',
  'CIB',
  'NBK',
  'ABC'
];

String? selectedBank;

final List<String> branches = [
  'Louran',
  'Gleem',
  'Fleming',
  'Sporting'
];

String? selectedBranch;

class _BankAccountDetailsScreenState extends State<BankAccountDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      'Bank Account Details',
                      style: TextStyle(
                          fontSize: 25.dp,
                          fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    'Bank account name',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffF5F4F4),
                        borderRadius: BorderRadius.circular(10)),
                    child: const TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                          hintText: 'Bank account name'),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Account number',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffF5F4F4),
                        borderRadius: BorderRadius.circular(10)),
                    child: const TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                          hintText: 'Enter your account number'),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Bank name',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        color: Color(0xffF5F4F4),
                      ),
                      child:
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: const Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Select Bank',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                            items: banks
                                .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                                .toList(),
                            value: selectedBank,
                            onChanged: (String? value) {
                              setState(() {
                                selectedBank = value;
                              });
                            }),
                      )
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Branch',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        color: Color(0xffF5F4F4),
                      ),
                      child:
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: const Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Select Branch',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                            items: branches
                                .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                                .toList(),
                            value: selectedBranch,
                            onChanged: (String? value) {
                              setState(() {
                                selectedBranch = value;
                              });
                            }),
                      )
                  ),
                  SizedBox(height: 10.h,),
                  MainElevatedButton(
                      nextScreen:
                      const WeWillReviewScreen(),
                      text: 'Next',
                      backgroundColor: const Color(0xff0038A7)),
                  SizedBox(height: 4.h,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
