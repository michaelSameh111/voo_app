import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/Model/VehicleTypeModel.dart';

import '../../Controller/Constants.dart';




class VehicleSelectionPage extends StatefulWidget {
  @override
  _VehicleSelectionPageState createState() => _VehicleSelectionPageState();
}

class _VehicleSelectionPageState extends State<VehicleSelectionPage> {

  String? selectedMake;
  List<Model> selectedModels = [];
  String? selectedModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      DropdownButtonFormField<String>(
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
        DropdownButtonFormField<String>(
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
            return DropdownMenuItem<String>(
              value: model.model,
              child: Text(model.model!),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedModel = value;
            });
          },
        ),
      ],
    );
  }
}
