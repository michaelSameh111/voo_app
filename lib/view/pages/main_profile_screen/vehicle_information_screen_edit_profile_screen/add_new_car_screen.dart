import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/main_profile_screen/vehicle_information_screen_edit_profile_screen/vehicle_information_screen_edit_profile_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class AddNewCarScreen extends StatefulWidget {
  const AddNewCarScreen({super.key});


  @override
  State<AddNewCarScreen> createState() => _AddNewCarScreenState();
}

List<String> rideSettings = ['Ride', 'Packages / Bulk packages'];
List<String> selectCarType = ['VX', 'Vcomfy'];
List<String> wheelChairAccess = ['Yes', 'No'];
List<String> childCarSeat = ['Yes', 'No'];

class _AddNewCarScreenState extends State<AddNewCarScreen> {

  bool? isChecked1 = false;
  bool? isChecked2 = false;
  bool? isChecked3 = false;
  bool? isChecked4 = false;
  bool? isChecked5 = false;
  bool? isChecked6 = false;
  bool? isChecked7 = false;
  bool? isChecked8 = false;
  bool isChecked = false;

  String currentRideSettings = rideSettings[0];
  String currentSelectCarType = selectCarType[0];
  String currentWheelChairAccess = wheelChairAccess[0];
  String currentChildCarSeat = childCarSeat[0];

  void showYearBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(padding: EdgeInsets.all(20.dp),
            child: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      'Select Year',
                      style: TextStyle(
                          fontSize: 25.dp,
                          fontWeight: FontWeight.bold,
                          color:  Colors.black),
                    ),
                  ),
                  Row(
                    children: [
                      Text('2004',style: TextStyle(fontSize: 15.dp),),
                      const Spacer(),
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        activeColor: const Color(0xffFF6A03),
                        checkColor: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      Text('2005',style: TextStyle(fontSize: 15.dp),),
                      const Spacer(),
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        activeColor: const Color(0xffFF6A03),
                        checkColor: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      Text('2006',style: TextStyle(fontSize: 15.dp),),
                      const Spacer(),
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        activeColor: const Color(0xffFF6A03),
                        checkColor: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      Text('2007',style: TextStyle(fontSize: 15.dp),),
                      const Spacer(),
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        activeColor: const Color(0xffFF6A03),
                        checkColor: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      Text('2008',style: TextStyle(fontSize: 15.dp),),
                      const Spacer(),
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        activeColor: const Color(0xffFF6A03),
                        checkColor: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                ],
              ),
            ),
          );
        });
  }
/////////////////////////stop///////////////////////////
  void showModelBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(padding: EdgeInsets.all(20.dp),
            child: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      'Select Model',
                      style: TextStyle(
                          fontSize: 25.dp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xffF70415)),
                    ),
                  ),
                  Row(
                    children: [
                      Text('verna',style: TextStyle(fontSize: 15.dp),),
                      const Spacer(),
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        activeColor: const Color(0xffFF6A03),
                        checkColor: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      Text('matrix',style: TextStyle(fontSize: 15.dp),),
                      const Spacer(),
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        activeColor: const Color(0xffFF6A03),
                        checkColor: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      Text('Logan',style: TextStyle(fontSize: 15.dp),),
                      const Spacer(),
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        activeColor: const Color(0xffFF6A03),
                        checkColor: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      Text('lancer',style: TextStyle(fontSize: 15.dp),),
                      const Spacer(),
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        activeColor: const Color(0xffFF6A03),
                        checkColor: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      Text('corolla',style: TextStyle(fontSize: 15.dp),),
                      const Spacer(),
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        activeColor: const Color(0xffFF6A03),
                        checkColor: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                ],
              ),
            ),
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Add a New Car',
          style: TextStyle(fontSize: 20.dp, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Car Brand *',
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
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Ex. Toyota'),
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Model',
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
                  child: TextField(
                    onTap: showModelBottomSheet,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Select Model'),
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Plate number *',
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
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Enter plate number'),
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Year',
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
                  child: TextField(
                    onTap: showYearBottomSheet,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Year'),
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Ride Settings',
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                ListTile(
                  title: const Text('Ride people'),
                  leading: Transform.scale(
                    scale: 1.2,
                    child: Radio(
                      activeColor: const Color(0xffFF6A03),
                      value: rideSettings[0],
                      groupValue: currentRideSettings,
                      onChanged: (value){
                        setState(() {
                          currentRideSettings = value.toString();
                        });
                      },
                    ),
                  ),
                ),
                ListTile(
                  title: const Text('Packages / Bulk packages'),
                  leading: Transform.scale(
                    scale: 1.2,
                    child: Radio(
                      activeColor: const Color(0xffFF6A03),
                      value: rideSettings[1],
                      groupValue: currentRideSettings,
                      onChanged: (value){
                        setState(() {
                          currentRideSettings = value.toString();
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Select car type',
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                ListTile(
                  title: const Text('VX'),
                  leading: Transform.scale(
                    scale: 1.2,
                    child: Radio(
                      activeColor: const Color(0xffFF6A03),
                      value: selectCarType[0],
                      groupValue: currentSelectCarType,
                      onChanged: (value){
                        setState(() {
                          currentSelectCarType = value.toString();
                        });
                      },
                    ),
                  ),
                ),
                ListTile(
                  title: const Text('Vcomfy'),
                  leading: Transform.scale(
                    scale: 1.2,
                    child: Radio(
                      activeColor: const Color(0xffFF6A03),
                      value: selectCarType[1],
                      groupValue: currentSelectCarType,
                      onChanged: (value){
                        setState(() {
                          currentSelectCarType = value.toString();
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Wheelchair access',
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: const Text('Yes'),
                        leading: Transform.scale(
                          scale: 1.2,
                          child: Radio(
                            activeColor: const Color(0xffFF6A03),
                            value: wheelChairAccess[0],
                            groupValue: currentWheelChairAccess,
                            onChanged: (value){
                              setState(() {
                                currentWheelChairAccess = value.toString();
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text('No'),
                        leading: Transform.scale(
                          scale: 1.2,
                          child: Radio(
                            activeColor: const Color(0xffFF6A03),
                            value: wheelChairAccess[1],
                            groupValue: currentWheelChairAccess,
                            onChanged: (value){
                              setState(() {
                                currentWheelChairAccess = value.toString();
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Child car seat',
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: const Text('Yes'),
                        leading: Transform.scale(
                          scale: 1.2,
                          child: Radio(
                            activeColor: const Color(0xffFF6A03),
                            value: childCarSeat[0],
                            groupValue: currentChildCarSeat,
                            onChanged: (value){
                              setState(() {
                                currentChildCarSeat = value.toString();
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text('No'),
                        leading: Transform.scale(
                          scale: 1.2,
                          child: Radio(
                            activeColor: const Color(0xffFF6A03),
                            value: childCarSeat[1],
                            groupValue: currentChildCarSeat,
                            onChanged: (value){
                              setState(() {
                                currentChildCarSeat = value.toString();
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'No of seats *',
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
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Select type'),
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Number of doors',
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
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Number of doors'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Car fuel type',
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
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Select fuel type'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Car documents',
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
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Add document details'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Car images',
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
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Add car details'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Center(
                  child: MainElevatedButton(
                      nextScreen:
                      const VehicleInformationScreenEditProfileScreen(),
                      text: 'Next',
                      backgroundColor: const Color(0xffFF6A03)),
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
