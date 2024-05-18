import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voo_app/view/pages/vehicle_registration_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class SelectTransportScreen extends StatefulWidget {
  const SelectTransportScreen({Key? key}) : super(key: key);

  @override
  State<SelectTransportScreen> createState() => _SelectTransportScreenState();
}

List<String> rideSettings = ['Ride', 'Packages / Bulk packages'];
List<String> selectCarType = ['VX', 'Vcomfy'];
List<String> wheelChairAccess = ['Yes', 'No'];
List<String> childCarSeat = ['Yes', 'No'];

class _SelectTransportScreenState extends State<SelectTransportScreen> {
  TextEditingController yearController = TextEditingController();
  final List<String> model = [
    'Choose Model',
    'BMW',
    'Mercedes',
  ];
  String dropDownValue = 'Choose Model';
  bool isChecked = false;
  DateTime? _selectedDate;
  String currentRideSettings = rideSettings[0];
  String currentSelectCarType = selectCarType[0];
  String currentWheelChairAccess = wheelChairAccess[0];
  String currentChildCarSeat = childCarSeat[0];

  void showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(20.dp),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      'Select Year',
                      style: TextStyle(
                          fontSize: 25.dp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffF70415)),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '2004',
                        style: TextStyle(fontSize: 15.dp),
                      ),
                      Spacer(),
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        activeColor: Color(0xff0038A7),
                        checkColor: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Text(
                        '2005',
                        style: TextStyle(fontSize: 15.dp),
                      ),
                      Spacer(),
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        activeColor: Color(0xff0038A7),
                        checkColor: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Text(
                        '2006',
                        style: TextStyle(fontSize: 15.dp),
                      ),
                      Spacer(),
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        activeColor: Color(0xff0038A7),
                        checkColor: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Text(
                        '2007',
                        style: TextStyle(fontSize: 15.dp),
                      ),
                      Spacer(),
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        activeColor: Color(0xff0038A7),
                        checkColor: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Text(
                        '2008',
                        style: TextStyle(fontSize: 15.dp),
                      ),
                      Spacer(),
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        activeColor: Color(0xff0038A7),
                        checkColor: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8.h,
                ),
                Center(
                  child: Text(
                    'Select Transport ',
                    style: TextStyle(
                        fontSize: 25.dp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffF70415)),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Car Brand *',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF5F4F4),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Ex. Toyota'),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Text(
                  'Model',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF5F4F4),
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
                  ),
                  validator: (value) {
                    if (value == 'Choose gender') {
                      return 'Please choose gender';
                    }
                    return null;
                  },
                  items: model
                      .map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: GoogleFonts.roboto(
                                fontSize: 14.dp,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  value: dropDownValue,
                  onChanged: (String? value) {
                    setState(() {
                      dropDownValue = value!;
                    });
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Plate number *',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF5F4F4),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Enter plate number'),
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Year',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF5F4F4),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    // onTap: showBottomSheet,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Select Year"),
                            content: Container(
                              // Need to use container to add size constraint.
                              width: 300,
                              height: 300,
                              child: YearPicker(
                                firstDate: DateTime(1980),
                                lastDate:
                                    DateTime(DateTime.now().year + 100, 1),
                                selectedDate: _selectedDate,
                                onChanged: (DateTime dateTime) {
                                  _selectedDate = dateTime;
                                  yearController.text =
                                      dateTime.year.toString();
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                    controller: yearController,
                    readOnly: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Year'),
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Ride Settings',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                ListTile(
                  minTileHeight: 5.h,
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Ride people'),
                  leading: Transform.scale(
                    scale: 1.2,
                    child: Radio(
                      activeColor: const Color(0xff0038A7),
                      value: rideSettings[0],
                      groupValue: currentRideSettings,
                      onChanged: (value) {
                        setState(() {
                          currentRideSettings = value.toString();
                        });
                      },
                    ),
                  ),
                ),
                ListTile(
                  minTileHeight: 5.h,
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Packages / Bulk packages'),
                  leading: Transform.scale(
                    scale: 1.2,
                    child: Radio(
                      activeColor: Color(0xff0038A7),
                      value: rideSettings[1],
                      groupValue: currentRideSettings,
                      onChanged: (value) {
                        setState(() {
                          currentRideSettings = value.toString();
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Select car type',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                ListTile( minTileHeight: 5.h,
                  contentPadding: EdgeInsets.zero,
                  title: const Text('VX'),
                  leading: Transform.scale(
                    scale: 1.2,
                    child: Radio(
                      activeColor: Color(0xff0038A7),
                      value: selectCarType[0],
                      groupValue: currentSelectCarType,
                      onChanged: (value) {
                        setState(() {
                          currentSelectCarType = value.toString();
                        });
                      },
                    ),
                  ),
                ),
                ListTile( minTileHeight: 5.h,
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Vcomfy'),
                  leading: Transform.scale(
                    scale: 1.2,
                    child: Radio(
                      activeColor: Color(0xff0038A7),
                      value: selectCarType[1],
                      groupValue: currentSelectCarType,
                      onChanged: (value) {
                        setState(() {
                          currentSelectCarType = value.toString();
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
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
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Yes'),
                        leading: Transform.scale(
                          scale: 1.2,
                          child: Radio(
                            activeColor: Color(0xff0038A7),
                            value: wheelChairAccess[0],
                            groupValue: currentWheelChairAccess,
                            onChanged: (value) {
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
                            activeColor: Color(0xff0038A7),
                            value: wheelChairAccess[1],
                            groupValue: currentWheelChairAccess,
                            onChanged: (value) {
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
                  height: 2.h,
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
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Yes'),
                        leading: Transform.scale(
                          scale: 1.2,
                          child: Radio(
                            activeColor: Color(0xff0038A7),
                            value: childCarSeat[0],
                            groupValue: currentChildCarSeat,
                            onChanged: (value) {
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
                            activeColor: Color(0xff0038A7),
                            value: childCarSeat[1],
                            groupValue: currentChildCarSeat,
                            onChanged: (value) {
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
                Text(
                  'No of seats *',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF5F4F4),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
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
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF5F4F4),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Number of doors'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Car fuel type',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF5F4F4),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Select fuel type'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Car documents',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF5F4F4),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Add document details'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Car images',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF5F4F4),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Add car details'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Center(
                  child: MainElevatedButton(
                      nextScreen: VehicleRegistrationScreen(),
                      text: 'Next',
                      backgroundColor: Color(0xff0038A7)),
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
