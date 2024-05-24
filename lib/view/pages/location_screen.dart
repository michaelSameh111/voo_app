import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/Controller/Constants.dart';
import 'package:voo_app/Controller/Login/login_cubit.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';
//ignore_for_file: must_be_immutable

class LocationScreen extends StatelessWidget {
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  String languageDropDown = 'English';
  List<String> language = ['English'];
  GlobalKey<FormState> formKey = GlobalKey();

  LocationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          floatingActionButton:SizedBox(width: 50.w,
            height: 5.h,
            child: MainElevatedButtonTwo(
                condition: state is AddDriverDataLoadingState,
                onPressed: (){
                  print(socialSecurity);
                  if(formKey.currentState!.validate()){
                    LoginCubit.get(context).addDriverData(language: languageDropDown,socialSecurity: socialSecurity!, country: 'United States', city: cityController.text, state: stateController.text, address: addressController.text, postalCode: postalCodeController.text, context: context);
                  }
                },
                text: 'Next',
                backgroundColor: Color(0xff0038A7)),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
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
                              'Location',
                              style: TextStyle(
                                  fontSize: 25.dp,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffF70415)),
                            ),
                            Text(
                              'Select your state and city',
                              style: TextStyle(
                                  fontSize: 14.dp, color: Color(0xff808080)),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Container(
                              padding: EdgeInsets.all(15),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xffF5F4F4),
                              ),
                              child: Center(
                                child: Text(
                                  'United States',
                                  style: TextStyle(
                                      color: Color(0xff0038A7),
                                      fontSize: 17.dp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'State',
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffF5F4F4),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextFormField(
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'This field cannot be empty';
                                      } else return null;
                                    },
                                    controller: stateController,
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
                                      hintText: 'Select state',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  'City',
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffF5F4F4),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextFormField(
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'This field cannot be empty';
                                      } else return null;
                                    },
                                    controller: cityController,
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
                                      hintText: 'Select city',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  'Address',
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffF5F4F4),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextFormField(
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'This field cannot be empty';
                                      } else return null;
                                    },
                                    controller: addressController,
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
                                      hintText: 'Select address',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  'Postal code',
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffF5F4F4),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextFormField(
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'This field cannot be empty';
                                      } else return null;
                                    },
                                    controller: postalCodeController,
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
                                      hintText: 'Enter your postal code',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                DropdownButtonFormField<String>(
                                  value: languageDropDown, // Set initial value to the first element in the list
                                  items: language.map((String language) => DropdownMenuItem<String>(
                                    value: language,
                                    child: Text(language),
                                  )).toList(),
                                  onChanged: (value) {
                                    languageDropDown = value!;
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey.shade300.withOpacity(0.6),
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
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Spacer(),
                      ],
                    ),
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
