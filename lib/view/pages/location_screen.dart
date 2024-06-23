import 'package:country_state_city/utils/city_utils.dart';
import 'package:country_state_city/utils/state_utils.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/Controller/Constants.dart';
import 'package:voo_app/Controller/Login/login_cubit.dart';
import 'package:voo_app/view/pages/HomePage/Home.dart';
import 'package:voo_app/view/pages/LandingPage.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';
//ignore_for_file: must_be_immutable

class LocationScreen extends StatefulWidget {
  bool? login;

  LocationScreen({super.key, this.login});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  TextEditingController stateController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController postalCodeController = TextEditingController();

  String languageDropDown = 'English';

  List<String> language = ['English'];
  String? selectedState;
  String? selectedCity;
  List<String> states = [];
  List<String> stateCodes = [];
  List<String> cities = []; 

  GlobalKey<FormState> formKey = GlobalKey();
  Future<void> fetchStates() async {
    final fetchedStates = await getStatesOfCountry('US');
    setState(() {
      states = fetchedStates.map((state) => state.name).toList();
      stateCodes = fetchedStates.map((state) => state.isoCode).toList();
    });
  }
  Future<void> fetchCities(String stateCode) async {
    final fetchedCities = await getStateCities('US', stateCode);
    setState(() {
      cities = fetchedCities.map((city) => city.name).toList();
    });
  }
  @override
  void initState() {
    fetchStates();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is AddDriverDataSuccessState && widget.login == true) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Landingpage()),
            (route) => false,
          );
        } else if (state is AddDriverDataSuccessState && widget.login != false) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePageMapsScreen()),
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: SizedBox(
            width: 50.w,
            height: 5.h,
            child: MainElevatedButtonTwo(
                condition: state is AddDriverDataLoadingState,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    LoginCubit.get(context).addDriverData(
                        language: languageDropDown,
                        socialSecurity: socialSecurity!,
                        country: 'United States',
                        city: selectedCity!,
                        state: selectedState!,
                        address: addressController.text,
                        postalCode: postalCodeController.text,
                        context: context);
                  }
                },
                text: 'Next',
                backgroundColor: Color(0xffFF6A03)),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
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
                                  color: Colors.black),
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
                                      color: Color(0xffFF6A03),
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
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.dp),
                                ),
                                DropdownSearch<String>(
                                  items: states,
                                  selectedItem: selectedState,
                                  dropdownDecoratorProps: DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(color: Colors.transparent),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(color: Colors.transparent),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(color: Colors.transparent),
                                      ),
                                      hintText: 'Select state',
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please Choose State';
                                    } else return null;
                                  },
                                  onChanged: (newState) {
                                    setState(() {
                                      selectedState = newState;
                                      selectedCity = null;
                                      int stateIndex = states.indexOf(newState!);
                                      String stateCode = stateCodes[stateIndex];
                                      fetchCities(stateCode); // Fetch cities for the selected state
                                    });
                                  },
                                  popupProps: PopupProps.menu(
                                    searchFieldProps: TextFieldProps(
                                      decoration:InputDecoration(
                                        filled: true,
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: Colors.transparent)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: Colors.transparent)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: Colors.transparent)),
                                        contentPadding: EdgeInsets.all(15),
                                        hintText: 'Search State',
                                      ),
                                    ),
                                    showSearchBox: true,
                                  ),
                                ),
                                // DropdownButtonFormField<String>(
                                //   value: null,
                                //   decoration: InputDecoration(
                                //     filled: true,
                                //     focusedBorder: OutlineInputBorder(
                                //       borderRadius: BorderRadius.circular(10),
                                //       borderSide: const BorderSide(
                                //           color: Colors.transparent),
                                //     ),
                                //     enabledBorder: OutlineInputBorder(
                                //       borderRadius: BorderRadius.circular(10),
                                //       borderSide: const BorderSide(
                                //           color: Colors.transparent),
                                //     ),
                                //     border: OutlineInputBorder(
                                //       borderRadius: BorderRadius.circular(10),
                                //       borderSide: const BorderSide(
                                //           color: Colors.transparent),
                                //     ),
                                //     hintText: 'Select state',
                                //   ),
                                //   items: states.map((String state) {
                                //     return DropdownMenuItem<String>(
                                //       value: state,
                                //       child: Text(state),
                                //     );
                                //   }).toList(),
                                //   onChanged: (String? newValue) {
                                //     stateController.text = newValue ?? '';
                                //   },
                                //   validator: (value) {
                                //     if (value == null || value.isEmpty) {
                                //       return 'This field cannot be empty';
                                //     } else {
                                //       return null;
                                //     }
                                //   },
                                // ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  'City',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.dp),
                                ),
                                DropdownSearch<String>(
                                  items: cities,
                                  selectedItem: selectedCity,
                                  dropdownDecoratorProps: DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(color: Colors.transparent),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(color: Colors.transparent),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(color: Colors.transparent),
                                      ),
                                      hintText: 'Select City',
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please Choose City';
                                    } else return null;
                                  },
                                  onChanged: (newCity) {
                                    setState(() {
                                      selectedCity = newCity;
                                    });
                                  },
                                  popupProps: PopupProps.menu(
                                    searchFieldProps: TextFieldProps(
                                      decoration:InputDecoration(
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent)),
                                      contentPadding: EdgeInsets.all(15),
                                      hintText: 'Search City',
                                    ),
                                    ),
                                    showSearchBox: true,
                                  ),
                                ),
                                // Container(
                                //   decoration: BoxDecoration(
                                //       color: Color(0xffF5F4F4),
                                //       borderRadius: BorderRadius.circular(10)),
                                //   child: TextFormField(
                                //     validator: (value) {
                                //       if (value!.isEmpty) {
                                //         return 'This field cannot be empty';
                                //       } else
                                //         return null;
                                //     },
                                //     controller: cityController,
                                //     decoration: InputDecoration(
                                //       filled: true,
                                //       focusedBorder: OutlineInputBorder(
                                //           borderRadius:
                                //               BorderRadius.circular(10),
                                //           borderSide: const BorderSide(
                                //               color: Colors.transparent)),
                                //       enabledBorder: OutlineInputBorder(
                                //           borderRadius:
                                //               BorderRadius.circular(10),
                                //           borderSide: const BorderSide(
                                //               color: Colors.transparent)),
                                //       border: OutlineInputBorder(
                                //           borderRadius:
                                //               BorderRadius.circular(10),
                                //           borderSide: const BorderSide(
                                //               color: Colors.transparent)),
                                //       contentPadding: EdgeInsets.all(15),
                                //       hintText: 'Select city',
                                //     ),
                                //   ),
                                // ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  'Address',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.dp),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffF5F4F4),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'This field cannot be empty';
                                      } else
                                        return null;
                                    },
                                    controller: addressController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent)),
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
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.dp),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffF5F4F4),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'This field cannot be empty';
                                      } else if (value.length != 5 || !RegExp(r'^[0-9]').hasMatch(value)) {
                                        return 'Please enter a valid 5-digit postal code';
                                      } else {
                                        return null; // Valid input
                                      }
                                    },
                                    controller: postalCodeController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent)),
                                      contentPadding: EdgeInsets.all(15),
                                      hintText: 'Enter your postal code',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                DropdownButtonFormField<String>(
                                  value:
                                      languageDropDown, // Set initial value to the first element in the list
                                  items: language
                                      .map((String language) =>
                                          DropdownMenuItem<String>(
                                            value: language,
                                            child: Text(language),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    languageDropDown = value!;
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Colors.grey.shade300.withOpacity(0.6),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent)),
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

class EditLocationScreen extends StatefulWidget {
  bool? login;

  EditLocationScreen({super.key, this.login});

  @override
  State<EditLocationScreen> createState() => _EditLocationScreenState();
}

class _EditLocationScreenState extends State<EditLocationScreen> {
  TextEditingController stateController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController postalCodeController = TextEditingController();

  String languageDropDown = 'English';

  List<String> language = ['English'];

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void initState() {
    stateController.text = loginData.driverData!.state!;
    addressController.text = loginData.driverData!.address!;
    cityController.text = loginData.driverData!.city!;
    postalCodeController.text = loginData.driverData!.postalCode!;
    socialSecurity = loginData.driverData!.socialSecurityNumber!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is EditDriverDataSuccessState) {
          Navigator.pop(context);
          loginData.driverData!.state = stateController.text;
          loginData.driverData!.address = addressController.text;
          loginData.driverData!.city = cityController.text;
          loginData.driverData!.postalCode = postalCodeController.text;
          loginData.driverData!.socialSecurityNumber = socialSecurity;
        }
      },
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: SizedBox(
            width: 50.w,
            height: 5.h,
            child: MainElevatedButtonTwo(
                condition: state is EditDriverDataLoadingState,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    LoginCubit.get(context).editDriverData(
                        language: languageDropDown,
                        socialSecurity: socialSecurity!,
                        country: 'United States',
                        city: cityController.text,
                        state: stateController.text,
                        address: addressController.text,
                        postalCode: postalCodeController.text,
                        context: context);
                  }
                },
                text: 'Next',
                backgroundColor: Color(0xffFF6A03)),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
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
                                  color: Colors.black),
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
                                      color: Color(0xffFF6A03),
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
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.dp),
                                ),
                                DropdownButtonFormField<String>(
                                  value: null,
                                  decoration: InputDecoration(
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(color: Colors.transparent),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(color: Colors.transparent),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(color: Colors.transparent),
                                    ),
                                    hintText: 'Select state',
                                  ),
                                  items: states.map((String state) {
                                    return DropdownMenuItem<String>(
                                      value: state,
                                      child: Text(state),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    stateController.text = newValue ?? '';
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field cannot be empty';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  'City',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.dp),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffF5F4F4),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'This field cannot be empty';
                                      } else
                                        return null;
                                    },
                                    controller: cityController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent)),
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
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.dp),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffF5F4F4),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'This field cannot be empty';
                                      } else
                                        return null;
                                    },
                                    controller: addressController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent)),
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
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.dp),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffF5F4F4),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'This field cannot be empty';
                                      } else if (value.length != 5) {
                                        return 'Postal code must be 5 digits';
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: postalCodeController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(color: Colors.transparent)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(color: Colors.transparent)),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(color: Colors.transparent)),
                                      contentPadding: EdgeInsets.all(15),
                                      hintText: 'Enter your postal code',
                                    ),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(5),
                                    ],
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                DropdownButtonFormField<String>(
                                  value: languageDropDown,
                                  items: language
                                      .map((String language) =>
                                          DropdownMenuItem<String>(
                                            value: language,
                                            child: Text(language),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    languageDropDown = value!;
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Colors.grey.shade300.withOpacity(0.6),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent)),
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
