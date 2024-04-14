import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/login_screen.dart';
import 'package:voo_app/view/pages/add_your_photo_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class RegisterNowScreen extends StatefulWidget {
  @override
  State<RegisterNowScreen> createState() => _RegisterNowScreenState();
}

class _RegisterNowScreenState extends State<RegisterNowScreen> {
  final List<String> gender = [
    'Male',
    'Female',
  ];
  String? selectedValue;

  TextEditingController dateController = TextEditingController();
  final selectedGender = TextEditingController();
  String genderSelected = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10.h),
                  Column(
                    children: [
                      Text(
                        'Register Now',
                        style: TextStyle(
                            fontSize: 25.dp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffF70415)),
                      ),
                      Text(
                        'Enter your details to proceed further',
                        style: TextStyle(
                            fontSize: 14.dp, color: Color(0xff808080)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Color(0xffA2A2A2),
                    child: Icon(
                      Icons.person,
                      size: 70.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddYourPhotoScreen(),
                            ));
                      },
                      child: Text(
                        'Add your photo',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.dp,
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'First Name *',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF5F4F4),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                          hintText: 'First Name'),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Middle Name *',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF5F4F4),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                          hintText: 'Middle Name'),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Last Name *',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF5F4F4),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                          hintText: 'Last Name'),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Phone number *',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF5F4F4),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                          hintText: 'Enter your phone number'),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Date of Birth *',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF5F4F4),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                          hintText: 'Choose your date of birth',
                          prefixIcon: Icon(Icons.calendar_today)),
                      onTap: () {
                        selectDate();
                      },
                      controller: dateController,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Gender *',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Color(0xffF5F4F4),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: const Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Select Gender',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                            items: gender
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
                            value: selectedValue,
                            onChanged: (String? value) {
                              setState(() {
                                selectedValue = value;
                              });
                            }),
                      )),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Email Address*',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF5F4F4),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                          hintText: 'Enter your email address'),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Password *',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF5F4F4),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                          hintText: 'Enter your password'),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Color(0xffA2A2A2),
                        size: 18.dp,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        'Min. 8 characters',
                        style: TextStyle(
                            fontSize: 15.dp, color: Color(0xffA2A2A2)),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 18.dp,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        'Capital letter',
                        style: TextStyle(
                            fontSize: 15.dp, color: Color(0xffA2A2A2)),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Color(0xffA2A2A2),
                        size: 18.dp,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        'Small letter',
                        style: TextStyle(
                            fontSize: 15.dp, color: Color(0xffA2A2A2)),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Color(0xffA2A2A2),
                        size: 18.dp,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        'Number',
                        style: TextStyle(
                            fontSize: 15.dp, color: Color(0xffA2A2A2)),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Color(0xffA2A2A2),
                        size: 18.dp,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        'Special characters',
                        style: TextStyle(
                            fontSize: 15.dp, color: Color(0xffA2A2A2)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Confirm Password *',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF5F4F4),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                          hintText: 'Enter your password'),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  MainElevatedButton(
                      nextScreen: LoginScreen(),
                      text: 'Register',
                      backgroundColor: Color(0xff0038A7)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text(
                        'Already a user ?',
                        style: TextStyle(
                            fontSize: 15.dp, color: Color(0xff646363)),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(color: Color(0xffF70415)),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2100));
    if (picked != null) {
      setState(() {
        dateController.text = picked.toString().split(" ")[0];
      });
    }
  }
}
