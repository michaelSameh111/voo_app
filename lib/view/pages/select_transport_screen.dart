import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/Controller/Constants.dart';
import 'package:voo_app/Controller/Login/login_cubit.dart';
import 'package:voo_app/Model/VehicleTypeModel.dart';
import 'package:voo_app/view/pages/main_profile_screen/vehicle_information_screen_edit_profile_screen/car_documents_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

import '../../Controller/Data/data_cubit.dart';
import 'DataCheck.dart';

class SelectTransportScreen extends StatefulWidget {
  const SelectTransportScreen({Key? key}) : super(key: key);

  @override
  State<SelectTransportScreen> createState() => _SelectTransportScreenState();
}

List<String> rideSettings = ['Ride', 'Packages / Bulk packages'];
List<String> selectCarType = ['VX', 'Vcomfy'];
List<String> wheelChairAccess = ['Yes', 'No'];
List<String> childCarSeat = ['Yes', 'No'];
String? selectedMake;
List<Model> selectedModels = [];
int? selectedModel;

class _SelectTransportScreenState extends State<SelectTransportScreen> {
  TextEditingController yearController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController rcController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String vehicleTypeDropDown = '';
  void onTypeChanged(String? value) {
    setState(() {
      vehicleTypeDropDown = value!;
    });
  }
  void showCheckImagesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Attention'),
          content: Text('Please check all recommended images.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
          ],
        );
      },
    );
  }
  bool isChecked = false;
  DateTime? _selectedDate;
  // String currentRideSettings = rideSettings[0];
  // String currentSelectCarType = selectCarType[0];
  TextEditingController brandController = TextEditingController();
  TextEditingController plateInfoController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController seatsController = TextEditingController();
  TextEditingController doorsController = TextEditingController();
  String currentWheelChairAccess = wheelChairAccess[0];
  String currentChildCarSeat = childCarSeat[0];
  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now().add(Duration(days: 15)),

        firstDate: DateTime.now().add(Duration(days: 15)),
        lastDate: DateTime(2100));
    if (picked != null) {
      setState(() {
        expiryDateController.text = picked.toString().split(" ")[0];
      });
    }
  }
  @override
  void initState() {
    DataCubit.get(context).getVehicleTypes();
    super.initState();
  }

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
                        activeColor: Color(0xffFF6A03),
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
                        activeColor: Color(0xffFF6A03),
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
                        activeColor: Color(0xffFF6A03),
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
                        activeColor: Color(0xffFF6A03),
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
                        activeColor: Color(0xffFF6A03),
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
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is AddDriverVehicleSuccessState){
          Navigator.popUntil(context,(route) => route.isFirst);
          Navigator.push(context, MaterialPageRoute(builder: (context) => DataCheckScreen()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 23),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Center(
                        child: Text(
                          'Select Transport ',
                          style: TextStyle(
                              fontSize: 25.dp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      // Text(
                      //     'Car Brand *',
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.bold, fontSize: 15.dp),
                      // ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //       color: Color(0xffF5F4F4),
                      //       borderRadius: BorderRadius.circular(10)),
                      //   child: TextFormField(
                      //     validator: (value) {
                      //       if (value!.isEmpty) {
                      //         return 'This Field be empty';
                      //       }
                      //       return null;
                      //     },
                      //     controller: brandController,
                      //     decoration: InputDecoration(
                      //         filled: true,
                      //         focusedBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(10),
                      //             borderSide:
                      //             const BorderSide(color: Colors.transparent)),
                      //         enabledBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(10),
                      //             borderSide:
                      //             const BorderSide(color: Colors.transparent)),
                      //         border: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(10),
                      //             borderSide:
                      //             const BorderSide(color: Colors.transparent)),
                      //         contentPadding: EdgeInsets.all(15),
                      //         hintText: 'Ex. Toyota'),
                      //     keyboardType: TextInputType.text,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 2.h,
                      // ),
                      // Text(
                      //   'Car Model *',
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.bold, fontSize: 15.dp),
                      // ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //       color: Color(0xffF5F4F4),
                      //       borderRadius: BorderRadius.circular(10)),
                      //   child: TextFormField(
                      //     controller: modelController,
                      //     validator: (value) {
                      //       if (value!.isEmpty) {
                      //         return 'This Field be empty';
                      //       }
                      //       return null;
                      //     },
                      //     decoration: InputDecoration(
                      //         filled: true,
                      //         focusedBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(10),
                      //             borderSide:
                      //             const BorderSide(color: Colors.transparent)),
                      //         enabledBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(10),
                      //             borderSide:
                      //             const BorderSide(color: Colors.transparent)),
                      //         border: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(10),
                      //             borderSide:
                      //             const BorderSide(color: Colors.transparent)),
                      //         contentPadding: EdgeInsets.all(15),
                      //         hintText: 'Ex. 316'),
                      //     keyboardType: TextInputType.text,
                      //   ),
                      // ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Car Make',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.dp),
                      ),
                      // VehicleTypesDropDown(
                      //     vehicleDropDown: vehicleTypeDropDown,
                      //     onTypeChanged: onTypeChanged),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DropdownButtonFormField<String>(
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return 'Please Choose Make';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffF5F4F4),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.transparent)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.transparent)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.transparent)),
                            ),
                            hint: Text('Select Make'),
                            value: selectedMake,
                            items: vehicleTypesModel.vehicles?.map((vehicle) {
                              return DropdownMenuItem<String>(
                                value: vehicle.make,
                                child: Text(vehicle.make!),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedMake = value;
                                print(selectedMake);
                                selectedModels = vehicleTypesModel.vehicles!
                                    .firstWhere((vehicle) => vehicle.make== value).model!;
                                selectedModel = null; // Reset model selection
                              });
                            },
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            'Car Model',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.dp),
                          ),
                          SizedBox(height: 1.h,),
                          DropdownButtonFormField<int>(
                            validator: (value){
                              if(value == null ){
                                return 'Please Choose Model';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffF5F4F4),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.transparent)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.transparent)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.transparent)),
                            ),
                            hint: Text('Select Model'),
                            value: selectedModel,
                            items: selectedModels.map((model) {
                              return DropdownMenuItem<int>(
                                value: model.id,
                                child: Text(model.model!),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedModel = value;
                                print(selectedModel);
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Plate number *',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.dp),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xffF5F4F4),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: plateInfoController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This Field be empty';
                            }
                            return null;
                          },
                          inputFormatters: [LettersAndDigitsInputFormatter()],
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
                              hintText: 'Enter Plate Number'),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Year',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.dp),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xffF5F4F4),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This Field be empty';
                            }
                            return null;
                          },
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Select Year"),
                                  content: Container(
                                    width: 300,
                                    height: 300,
                                    child: YearPicker(
                                      firstDate: DateTime(1980),
                                      lastDate: DateTime(
                                          DateTime.now().year),
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
                              hintText: 'Year'),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      //No Need In Design
                      // Column(crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [   Text(
                      //     'Ride Settings',
                      //     style:
                      //     TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                      //   ),
                      //     ListTile(
                      //       minTileHeight: 5.h,
                      //       contentPadding: EdgeInsets.zero,
                      //       title: const Text('Ride people'),
                      //       leading: Transform.scale(
                      //         scale: 1.2,
                      //         child: Radio(
                      //           activeColor: const Color(0xffFF6A03),
                      //           value: rideSettings[0],
                      //           groupValue: currentRideSettings,
                      //           onChanged: (value) {
                      //             setState(() {
                      //               currentRideSettings = value.toString();
                      //             });
                      //           },
                      //         ),
                      //       ),
                      //     ),
                      //     ListTile(
                      //       minTileHeight: 5.h,
                      //       contentPadding: EdgeInsets.zero,
                      //       title: const Text('Packages / Bulk packages'),
                      //       leading: Transform.scale(
                      //         scale: 1.2,
                      //         child: Radio(
                      //           activeColor: Color(0xffFF6A03),
                      //           value: rideSettings[1],
                      //           groupValue: currentRideSettings,
                      //           onChanged: (value) {
                      //             setState(() {
                      //               currentRideSettings = value.toString();
                      //             });
                      //           },
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: 2.h,
                      //     ),
                      //     Text(
                      //       'Select car type',
                      //       style:
                      //       TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                      //     ),
                      //     ListTile( minTileHeight: 5.h,
                      //       contentPadding: EdgeInsets.zero,
                      //       title: const Text('VX'),
                      //       leading: Transform.scale(
                      //         scale: 1.2,
                      //         child: Radio(
                      //           activeColor: Color(0xffFF6A03),
                      //           value: selectCarType[0],
                      //           groupValue: currentSelectCarType,
                      //           onChanged: (value) {
                      //             setState(() {
                      //               currentSelectCarType = value.toString();
                      //             });
                      //           },
                      //         ),
                      //       ),
                      //     ),
                      //     ListTile( minTileHeight: 5.h,
                      //       contentPadding: EdgeInsets.zero,
                      //       title: const Text('Vcomfy'),
                      //       leading: Transform.scale(
                      //         scale: 1.2,
                      //         child: Radio(
                      //           activeColor: Color(0xffFF6A03),
                      //           value: selectCarType[1],
                      //           groupValue: currentSelectCarType,
                      //           onChanged: (value) {
                      //             setState(() {
                      //               currentSelectCarType = value.toString();
                      //             });
                      //           },
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: 2.h,
                      //     ),],
                      // ),
                      Text(
                        'Wheelchair access',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.dp),
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
                                  activeColor: Color(0xffFF6A03),
                                  value: wheelChairAccess[0],
                                  groupValue: currentWheelChairAccess,
                                  onChanged: (value) {
                                    setState(() {
                                      currentWheelChairAccess =
                                          value.toString();
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
                                  activeColor: Color(0xffFF6A03),
                                  value: wheelChairAccess[1],
                                  groupValue: currentWheelChairAccess,
                                  onChanged: (value) {
                                    setState(() {
                                      currentWheelChairAccess =
                                          value.toString();
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.dp),
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
                                  activeColor: Color(0xffFF6A03),
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
                                  activeColor: Color(0xffFF6A03),
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.dp),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xffF5F4F4),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: seatsController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This Field be empty';
                            }
                            return null;
                          },
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
                              hintText: 'Number Of Seats'),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Number of doors',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.dp),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xffF5F4F4),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: doorsController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This Field be empty';
                            }
                            return null;
                          },
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
                              hintText: 'Number Of Doors'),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Registration Expiry Date',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.dp),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This Field is Empty';
                          }
                          return null;
                        },
                        readOnly: true,
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
                            contentPadding: const EdgeInsets.all(15),
                            hintText: 'Registration Expiry Date',
                            prefixIcon: const Icon(Icons.calendar_today)),
                        onTap: () {
                          selectDate();
                        },
                        controller: expiryDateController,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Registration Number',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.dp),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xffF5F4F4),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This Field be empty';
                            }
                            return null;
                          },
                          inputFormatters: [LettersAndDigitsInputFormatter()],
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
                              hintText: 'Registration Number'),
                          keyboardType: TextInputType.text,
                          controller: rcController,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Vehicle Color',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.dp),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xffF5F4F4),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This Field be empty';
                            }
                            return null;
                          },
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
                              hintText: 'Vehicle Color'),
                          keyboardType: TextInputType.text,
                          controller: colorController,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      // Text(
                      //   'Car fuel type',
                      //   style:
                      //       TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                      // ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //       color: Color(0xffF5F4F4),
                      //       borderRadius: BorderRadius.circular(10)),
                      //   child: TextFormField(
                      //     decoration: InputDecoration(
                      //         border: InputBorder.none,
                      //         contentPadding: EdgeInsets.all(15),
                      //         hintText: 'Select fuel type'),
                      //     keyboardType: TextInputType.number,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 2.h,
                      // ),
                      Text(
                        'Registration Image',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.dp),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xffF5F4F4),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          readOnly: true,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RcImageScreen()));
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(15),
                              hintText: LoginCubit.vehicleRCImage != null
                                  ? 'Image Added Successfully'
                                  : 'Add Car Documents'),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      // Text(
                      //   'Car images',
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.bold, fontSize: 15.dp),
                      // ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //       color: Color(0xffF5F4F4),
                      //       borderRadius: BorderRadius.circular(10)),
                      //   child: TextFormField(
                      //     readOnly: true,
                      //     onTap: () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => CarImages()));
                      //     },
                      //     decoration: InputDecoration(
                      //         border: InputBorder.none,
                      //         contentPadding: const EdgeInsets.all(15),
                      //         hintText: LoginCubit.carHint),
                      //     keyboardType: TextInputType.number,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 2.h,
                      // ),
                      Center(
                        child: MainElevatedButtonTwo(
                          condition: state is AddDriverVehicleLoadingState,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (LoginCubit.vehicleRCImage != null) {
                                  LoginCubit.get(context).addVehicle( plateInfo: plateInfoController.text, make: selectedMake!, model: selectedModel!, year: yearController.text, seats: seatsController.text, doors: doorsController.text, wheelChair: currentWheelChairAccess, kidsSeat: currentChildCarSeat, color: colorController.text,rc: rcController.text, rcExpiry:expiryDateController.text , rcImage: LoginCubit.vehicleRCImage, context: context);
                                } else {
                                  showCheckImagesDialog(context);
                                }
                              }
                            },
                            text: 'Add Vehicle',
                            backgroundColor: Color(0xffFF6A03)),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

//ignore_for_file: must_be_immutable
class VehicleTypesDropDown extends StatelessWidget {
  String? vehicleDropDown;
  final ValueChanged<String?> onTypeChanged;
  VehicleTypesDropDown(
      {super.key, required this.vehicleDropDown, required this.onTypeChanged});

  @override
  Widget build(BuildContext context) {
    List<Vehicles> vehicleTypes = vehicleTypesModel
        .vehicles!; // Assuming 'allCities' is the list of cities

    List<DropdownMenuItem<String>> dropdownItems = [
      DropdownMenuItem(
        value: '',
        child: Text(
          'Select Car',
        ),
      )
    ];

    for (Vehicles vehicleTypes in vehicleTypes) {
      DropdownMenuItem<String> dropdownItem = DropdownMenuItem<String>(
        value: vehicleTypes.make,
        child: SizedBox(
          child: Text(
            '${vehicleTypes.make}',
          ),
        ),
      );
      dropdownItems.add(dropdownItem);
    }
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffF5F4F4),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent)),
      ),
      validator: (value) {
        if (value == 0) {
          return 'Please choose Car';
        }
        return null;
      },
      value: vehicleDropDown,
      items: dropdownItems,
      onChanged: (val) {
        onTypeChanged(val);
        vehicleDropDown = val;
      },
    );
  }
}
