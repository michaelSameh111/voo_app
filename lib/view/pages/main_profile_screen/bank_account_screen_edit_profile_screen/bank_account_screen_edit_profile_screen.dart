import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/main_profile_screen/main_profile_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class BankAccountScreenEditProfileScreen extends StatefulWidget {
  const BankAccountScreenEditProfileScreen({super.key});

  @override
  State<BankAccountScreenEditProfileScreen> createState() => _BankAccountScreenEditProfileScreenState();
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

TextEditingController accountNumberController = TextEditingController();
TextEditingController bankNameController = TextEditingController();
TextEditingController branchController = TextEditingController();

class _BankAccountScreenEditProfileScreenState extends State<BankAccountScreenEditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 10.h,
        leadingWidth: 0,
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
              'Bank Account',
              style: TextStyle(
                  fontSize: 20.dp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Bank account name',
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
                height:2.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Account number',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              TextFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return 'This field cannot be empty';
                  } else return null;
                },
                controller: accountNumberController,
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      const BorderSide(color: Colors.transparent)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      const BorderSide(color: Colors.transparent)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      const BorderSide(color: Colors.transparent)),
                  contentPadding: EdgeInsets.all(15),
                  hintText: 'Enter your account number',
                ),
              ),
              SizedBox(
                height:2.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Bank name',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              TextFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return 'This field cannot be empty';
                  } else return null;
                },
                controller: bankNameController,
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      const BorderSide(color: Colors.transparent)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      const BorderSide(color: Colors.transparent)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      const BorderSide(color: Colors.transparent)),
                  contentPadding: EdgeInsets.all(15),
                  hintText: 'Bank Name',
                ),
              ),
              SizedBox(
                height:2.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Branch',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              TextFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return 'This field cannot be empty';
                  } else return null;
                },
                controller: branchController,
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      const BorderSide(color: Colors.transparent)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      const BorderSide(color: Colors.transparent)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      const BorderSide(color: Colors.transparent)),
                  contentPadding: EdgeInsets.all(15),
                  hintText: 'Select Branch',
                ),
              ),
              SizedBox(height: 10.h,),
              MainElevatedButton(
                  nextScreen:
                  const MainProfileScreen(),
                  text: 'Update',
                  circularBorder: true,
                  backgroundColor: const Color(0xffFF6A03)),
              SizedBox(height: 4.h,),
            ],
          ),
        ),
      ),
    );
  }
}
