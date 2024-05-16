import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/main_profile_screen/edit_my_profile_screen_directory/edit_my_profile_screen.dart';

class EditLocationBasicInfoScreen extends StatefulWidget {

  @override
  State<EditLocationBasicInfoScreen> createState() => _EditLocationBasicInfoScreenState();
}
final List<String> states = [
  'Egypt',
  'United States',
  'Singapore',
  'UAE'
];

String? selectedState;

final List<String> cities = [
  'California',
  'Alexandria',
  'Dubai',
  'Sydney'
];

String? selectedCity;

// final selectedGender = TextEditingController();
// String genderSelected = '';


class _EditLocationBasicInfoScreenState extends State<EditLocationBasicInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10.h,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.0.w),
          child: InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EditMyProfileScreen()));
            },
            child: Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                  )],
                  shape: BoxShape.circle,
                  color: Colors.white,),
                child: const Icon(Icons.arrow_back)),
          ),
        ),
        title: Text('Edit Location',
          style: TextStyle(
              fontSize: 20.dp,
              fontWeight: FontWeight.bold
          ),)
        ,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'State',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15.dp),
                  ),
              ],),
              SizedBox(height:2.h,),
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
                                'Select state',
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                        items: states
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
                        value: selectedState,
                        onChanged: (String? value) {
                          setState(() {
                            selectedState = value;
                          });
                        }),
                  )
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Text(
                    'City',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15.dp),
                  ),
                ],),
              SizedBox(height:2.h,),
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
                                'Select city',
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                        items: cities
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
                        value: selectedCity,
                        onChanged: (String? value) {
                          setState(() {
                            selectedCity = value;
                          });
                        }),
                  )
              ),
              SizedBox(height: 2.h,),
              Row(
                children: [
                  Text(
                    'Address',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15.dp),
                  ),
                ],),
              SizedBox(height:2.h,),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xffF5F4F4),
                    borderRadius: BorderRadius.circular(10)),
                child: const TextField(
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                      hintText: 'Enter your address'),
                ),
              ),
              SizedBox(height: 2.h,),
              Row(
                children: [
                  Text(
                    'Postal Code',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15.dp),
                  ),
                ],),
              SizedBox(height:2.h,),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xffF5F4F4),
                    borderRadius: BorderRadius.circular(10)),
                child: const TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                      hintText: 'Enter your postal code'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
