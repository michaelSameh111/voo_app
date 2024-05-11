import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:voo_app/view/pages/driver_license.dart';
import 'package:voo_app/view/pages/edit_my_profile_screen_directory/DriverLicenseScreenInEditMyProfile.dart';
import 'package:voo_app/view/pages/edit_my_profile_screen_directory/InsuranceScreenInEditMyProfile.dart';
import 'package:voo_app/view/pages/edit_my_profile_screen_directory/basic_info.dart';
import 'package:voo_app/view/pages/insurance_screen.dart';

import '../../widgets/icon_and_text_field_basic_info_screen.dart';
//import 'package:voo_app/lib/view/pages/edit_my_profile_screen_directory/';

class EditMyProfileScreen extends StatefulWidget {
  @override
  State<EditMyProfileScreen> createState() => _EditMyProfileScreenState();
}

final List<String> gender = [
  'Male',
  'Female',
];

String? selectedValue;

TextEditingController dateController = TextEditingController();
final selectedGender = TextEditingController();
String genderSelected = '';

class _EditMyProfileScreenState extends State<EditMyProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Nader Nabil'),
            bottom: TabBar(
              tabs: [
                Text(
                  'Basic Info',
                  style: TextStyle(
                      color: Color(0xff0038A7),
                      fontWeight: FontWeight.bold,
                      fontSize: 14.8.dp),
                ),
                Text(
                  'Driver License',
                  style: TextStyle(
                      color: Color(0xff0038A7),
                      fontWeight: FontWeight.bold,
                      fontSize: 14.8.dp),
                ),
                Text(
                  'Insurance',
                  style: TextStyle(
                      color: Color(0xff0038A7),
                      fontWeight: FontWeight.bold,
                      fontSize: 14.8.dp),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            BasicInfoScreen(),
            DriverLicenseScreenInEditMyProfile(),
            InsuranceScreenInEditMyProfile(),
          ]),
        ));
  }
}

class BasicInfoScreen extends StatefulWidget {
  @override
  State<BasicInfoScreen> createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends State<BasicInfoScreen> {
  TextEditingController dateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 3.h,
                ),
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 10.w,
                    backgroundColor: Color(0xffA2A2A2),
                    child: Icon(
                      Icons.person,
                      size: 15.w,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Edit your photo',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                  ),
                ),
                IconAndTextField(
                    icon: Icon(Icons.person),
                    hintText: 'Enter your name',
                    keyboardType: TextInputType.name),
                IconAndTextField(
                    icon: Icon(Icons.mail),
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Enter your email address'),
                IconAndTextField(
                    icon: Icon(Icons.phone_android),
                    keyboardType: TextInputType.phone,
                    hintText: 'Enter your phone number'),
                ListTile(
                  leading: Icon(Icons.calendar_today),
                  iconColor: Color(0xff808080),
                  title: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      color: Color(0xffF5F4F4),
                    ),
                    child: TextField(
                      readOnly: true,
                      //keyboardType: keyboardType,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Date of Birth',
                      ),
                      onTap: (){
                        ScrollDatePicker(
                          selectedDate: _selectedDate,
                          locale: Locale('en'),
                          onDateTimeChanged: (DateTime value) {
                            setState(() {
                              _selectedDate = value;
                            });
                          },
                        );
                      },
                    ),
                  ),
                ),
                Container(color: Colors.yellow,
                  child: Text(
                    "$_selectedDate",
                  ),
                  // TextField(
                  //   decoration: const InputDecoration(
                  //       border: InputBorder.none,
                  //       contentPadding: EdgeInsets.all(15),
                  //       hintText: 'Choose your date of birth',
                  //       prefixIcon: Icon(Icons.calendar_today)),
                  //   onTap: () {
                  //     selectDate();
                  //   },
                  //   controller: dateController,
                  // ),
                ),
                // Container(
                //   alignment: Alignment.centerRight,
                //   padding: const EdgeInsets.only(right: 48),
                //   child: TextButton(
                //     onPressed: () {
                //       setState(() {
                //         _selectedDate = DateTime.now();
                //       });
                //     },
                //     child: Text(
                //       "TODAY",
                //       style: TextStyle(color: Colors.red),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 250,
                  child: ScrollDatePicker(
                    selectedDate: _selectedDate,
                    locale: Locale('en'),
                    onDateTimeChanged: (DateTime value) {
                      setState(() {
                        _selectedDate = value;
                      });
                    },
                  ),
                ),

                ListTile(
                  leading: Icon(Icons.transgender_outlined),
                  iconColor: Color(0xff808080),
                  title: Container(
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
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> selectDate() async {
  //   DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime(1950),
  //       lastDate: DateTime(2100));
  //   if (picked != null) {
  //     setState(() {
  //       dateController.text = picked.toString().split(" ")[0];
  //     });
  //   }
  // }
}
