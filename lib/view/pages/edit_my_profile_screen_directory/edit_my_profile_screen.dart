import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:voo_app/view/pages/driver_license.dart';
import 'package:voo_app/view/pages/edit_my_profile_screen_directory/DriverLicenseScreenInEditMyProfile.dart';
import 'package:voo_app/view/pages/edit_my_profile_screen_directory/InsuranceScreenInEditMyProfile.dart';
import 'package:voo_app/view/pages/edit_my_profile_screen_directory/basic_info.dart';
import 'package:voo_app/view/pages/edit_my_profile_screen_directory/change_password_in_edit_my_profile_screen.dart';
import 'package:voo_app/view/pages/insurance_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';
import '../../widgets/icon_and_text_field_basic_info_screen.dart';
//import 'package:voo_app/lib/view/pages/edit_my_profile_screen_directory/';
import 'package:intl/intl.dart';

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

  DateTime dateTime = DateTime (3000, 2, 1);

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
  TextEditingController dateOfBirthController = TextEditingController();
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
                      controller: dateOfBirthController,
                      //keyboardType: keyboardType,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Date of Birth',
                      ),
                      onTap: (){
                        acceptDeclineShowModalSheet(context);
                        // print(dateOfBirthController.text);
                      },
                    ),
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
                SizedBox(height: 1.h,),
                Divider(
                  thickness: 1.h,
                  color: Color(0xffECECEC),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ChangePasswordInEditMyProfileScreen()));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                    child: Row(
                      children: [
                        Icon(
                          Icons.lock,
                          color: Color(0xff808080),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Expanded(
                          child: Text(
                            'Change Password',
                            style: TextStyle(fontSize: 15.dp),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xffA2A2A2),
                          size: 17.dp,
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: Color(0xffF5F4F4),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                    child: Row(
                      children: [
                        Icon(
                          Icons.language,
                          color: Color(0xff808080),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Expanded(
                          child: Text(
                            'Change Language',
                            style: TextStyle(fontSize: 15.dp),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xffA2A2A2),
                          size: 17.dp,
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: Color(0xffF5F4F4),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Color(0xff808080),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Expanded(
                          child: Text(
                            'Edit Location',
                            style: TextStyle(fontSize: 15.dp),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xffA2A2A2),
                          size: 17.dp,
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: Color(0xffF5F4F4),
                ),
                MainElevatedButton(
                    nextScreen: BasicInfoScreen(),
                    text: 'Update',
                    backgroundColor: Color(0xff0038A7)),
                SizedBox(height: 2.h,)
              ],
            ),
          ),
        ),
      ),
    );
  }
  void acceptDeclineShowModalSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(23), topRight: Radius.circular((23))),
      ),
      context: context,
      builder: (context) => Column(
        children: [
          SizedBox(
            height: 250,
            child: ScrollDatePicker(
              maximumDate: DateTime.now(),
              minimumDate: DateTime(1970),
              selectedDate: _selectedDate,
              locale: Locale('en'),
              onDateTimeChanged: (DateTime value) {
                setState(() {
                  String formatDateTime(String dateTimeString) {
                    DateTime dateTime = DateTime.parse(dateTimeString);
                    DateFormat formatter = DateFormat('dd/MM/yyyy');
                    String formattedDateTime = formatter.format(dateTime);
                    dateOfBirthController.text = formattedDateTime;
                    return dateOfBirthController.toString();
                  }
                //  _selectedDate = value;
                  dateOfBirthController.text = value.toString();

                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
