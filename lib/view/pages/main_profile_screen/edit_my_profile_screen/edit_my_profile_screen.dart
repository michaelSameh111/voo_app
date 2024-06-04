import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:voo_app/Controller/Constants.dart';
import 'package:voo_app/Controller/Login/login_cubit.dart';
import 'package:voo_app/view/pages/location_screen.dart';
import 'package:voo_app/view/pages/main_profile_screen/edit_my_profile_screen/basic_info_screen_contents/change_password_basic_info_screen.dart';
import 'package:voo_app/view/pages/main_profile_screen/edit_my_profile_screen/basic_info_screen_contents/edit_your_photo_basic_info_screen.dart';
import 'package:voo_app/view/widgets/icon_and_text_field_basic_info_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class EditMyProfileScreen extends StatefulWidget {
  const EditMyProfileScreen({super.key});

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
            leadingWidth: 0,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text('${loginData.firstName} ${loginData.lastName}',style: GoogleFonts.roboto(fontSize: 30.dp,color: Colors.black,fontWeight: FontWeight.bold),),
            bottom: TabBar(
             indicator: const UnderlineTabIndicator(
               borderSide: BorderSide(color: Color(0xffFF6A03),width: 2),
             ),

              tabs: [
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 1.h),
                  child: Text(
                    'Basic Info',
                    style: TextStyle(
                        color: const Color(0xffFF6A03),
                        fontWeight: FontWeight.bold,
                        fontSize: 14.8.dp),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 1.h),
                  child: Text(
                    'Driver License',
                    style: TextStyle(
                        color: const Color(0xffFF6A03),
                        fontWeight: FontWeight.bold,
                        fontSize: 13.dp),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 1.h),
                  child: Text(
                    'Insurance',
                    style: TextStyle(
                        color: const Color(0xffFF6A03),
                        fontWeight: FontWeight.bold,
                        fontSize: 14.8.dp),
                  ),
                ),
              ],
            ),
          ),
          body:  TabBarView(
              children: [
            BasicInfoScreen(),
            DriverLicenseScreenInEditMyProfile(),
            InsuranceScreenInEditMyProfile(),
          ]),
        ));
  }
}

class BasicInfoScreen extends StatefulWidget {
  const BasicInfoScreen({super.key});

  @override
  State<BasicInfoScreen> createState() => _BasicInfoScreenState();
}
class _BasicInfoScreenState extends State<BasicInfoScreen> {
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  final DateTime _selectedDate = DateTime.now();

  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        dateController.text = picked.toString().split(" ")[0];
      });
    }
  }
  @override
  void initState() {
    firstNameController.text = loginData.firstName!;
    lastNameController.text = loginData.lastName!;
    phoneController.text = loginData.phone!;
    dateController.text = loginData.dateOfBirth!;
    selectedValue = loginData.gender!;
   emailController.text = loggedInEmail!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    if(state is EditUserSuccessState){
      loginData.firstName = firstNameController.text;
      loginData.lastName = lastNameController.text;
      loginData.phone = phoneController.text;
      loginData.dateOfBirth = dateController.text;
      loginData.gender = selectedValue;
    }
  },
  builder: (context, state) {
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
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const EditYourPhotoBasicInfoScreen()));
                  },
                  child: CircleAvatar(
                    radius: 10.w,
                    backgroundColor: const Color(0xffA2A2A2),
                    child: ClipRRect(borderRadius: BorderRadius.circular(100),child: Image.network('${loginData.image}',fit: BoxFit.fill,height: 300,width: 300,)),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const EditYourPhotoBasicInfoScreen()));
                  },
                  child: Text(
                    'Edit your photo',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                  ),
                ),
                IconAndTextField(
                  controller: firstNameController,
                    icon: const Icon(Icons.person),
                    hintText: 'Enter your First Name',
                    keyboardType: TextInputType.name),
                IconAndTextField(
                  controller: lastNameController,
                    icon: const Icon(Icons.person),
                    hintText: 'Enter your Last Name',
                    keyboardType: TextInputType.name),
                IconAndTextField(
                  controller: emailController,
                    icon: const Icon(Icons.mail),
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Enter your email address'),
                IconAndTextField(
                  controller: phoneController,
                    icon: const Icon(Icons.phone_android),
                    keyboardType: TextInputType.phone,
                    hintText: 'Enter your phone number'),
                ListTile(
                  leading: const Icon(Icons.calendar_today),
                  iconColor: const Color(0xff808080),
                  title: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      color: Color(0xffF5F4F4),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Date of birth is Empty';
                        }
                        return null;
                      },
                      readOnly: true,

                      decoration: InputDecoration(

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
                          contentPadding: EdgeInsets.symmetric(vertical: 15),
                          hintText: 'Choose your date of birth',
                          ),
                      onTap: () {
                        selectDate();
                      },
                      controller: dateController,
                    ),
                  ),
                ),

                ListTile(
                  leading: const Icon(Icons.transgender_outlined),
                  iconColor: const Color(0xff808080),
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
                          },
                      dropdownStyleData: DropdownStyleData(maxHeight: 200,width: 80.w,),
                      ),
                    )
                  ),
                ),
                SizedBox(height: 1.h,),
                Divider(
                  thickness: 1.h,
                  color: const Color(0xffECECEC),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                 ChangePasswordBasicInfoScreen()));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                    child: Row(
                      children: [
                        const Icon(
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
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: const Color(0xffA2A2A2),
                          size: 17.dp,
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: Color(0xffF5F4F4),
                ),
                // InkWell(
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) =>
                //                 const ChangeLanguageBasicInfoScreen()));
                //   },
                //   child: Padding(
                //     padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                //     child: Row(
                //       children: [
                //         const Icon(
                //           Icons.language,
                //           color: Color(0xff808080),
                //         ),
                //         SizedBox(
                //           width: 3.w,
                //         ),
                //         Expanded(
                //           child: Text(
                //             'Change Language',
                //             style: TextStyle(fontSize: 15.dp),
                //           ),
                //         ),
                //         const Spacer(),
                //         Icon(
                //           Icons.arrow_forward_ios,
                //           color: const Color(0xffA2A2A2),
                //           size: 17.dp,
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // const Divider(
                //   color: Color(0xffF5F4F4),
                // ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  EditLocationScreen()));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                    child: Row(
                      children: [
                        const Icon(
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
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: const Color(0xffA2A2A2),
                          size: 17.dp,
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: Color(0xffF5F4F4),
                ),
                MainElevatedButtonTwo(
                  condition: state is EditUserLoadingState,
                    onPressed: (){
                      LoginCubit.get(context).editUser(firstName: firstNameController.text, lastName: lastNameController.text, email: emailController.text, phone: phoneController.text,date: dateController.text, context: context);
                    },
                    text: 'Update',
                    backgroundColor: const Color(0xffFF6A03),
                circularBorder: true,),
                SizedBox(height: 2.h,)
              ],
            ),
          ),
        ),
      ),
    );
  },
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
              locale: const Locale('en'),
              onDateTimeChanged: (DateTime value) {
                setState(() {
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


class DriverLicenseScreenInEditMyProfile extends StatefulWidget {
   DriverLicenseScreenInEditMyProfile({Key? key}) : super(key: key);

  @override
  State<DriverLicenseScreenInEditMyProfile> createState() => _DriverLicenseScreenInEditMyProfileState();
}

class _DriverLicenseScreenInEditMyProfileState extends State<DriverLicenseScreenInEditMyProfile> {
   Future<void> selectDate() async {
     DateTime? picked = await showDatePicker(
         context: context,
         initialDate: DateTime.now(),

         firstDate: DateTime(1950),
         lastDate: DateTime(2100));
     if (picked != null) {
       setState(() {
         expiryDateController.text = picked.toString().split(" ")[0];
       });
     }
   }
   TextEditingController driverLicenseController = TextEditingController();
   TextEditingController expiryDateController = TextEditingController();
   @override
  void initState() {
    driverLicenseController.text = loginData.driverLicense![0].licenseNumber!;
    expiryDateController.text = loginData.driverLicense![0].licenseExpiry!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    if(state is EditDriverLicenseSuccessState){
      loginData.driverLicense![0].licenseExpiry = expiryDateController.text;
      loginData.driverLicense![0].licenseNumber = driverLicenseController.text;
      Navigator.pop(context);
    }
  },
  builder: (context, state) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 3.h,),
                Text('Driver License Number',
                  style: TextStyle(
                      fontSize: 15.dp,
                      fontWeight: FontWeight.bold
                  ),),
                SizedBox(height: 1.h,),
                TextFormField(
                  controller: driverLicenseController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field is required';
                    } else
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
                    contentPadding: const EdgeInsets.all(15),
                    hintText: 'Driver License Number',
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 4.h,),
                Center(
                  child: DottedBorder(
                    dashPattern: const [1, 1],
                    color: const Color(0xff808080),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffF5F4F4),
                      ),
                      child: LoginCubit.frontLicenseImage != null ? Image.file(LoginCubit.frontLicenseImage!,width: 300,height: 300,fit: BoxFit.fill,) :  loginData.driverLicense![0].licenseFrontImage != null ? Image.network(loginData.driverLicense![0].licenseFrontImage!,height: 300,width: 300,fit: BoxFit.fill,) : Column(
                        children: [
                          Icon(
                            Icons.camera_alt_rounded,
                            size: 45.dp,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Click here to upload a clear pictue of\n              front of driver\'s license',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          MainElevatedButtonTwo(
                              onPressed: () async {
                                LoginCubit.get(context).pickImage(image: LoginCubit.frontLicenseImage).then((value){
                                  setState(() {
                                    LoginCubit.frontLicenseImage = value;
                                  });
                                });
                              },
                              text: 'Upload',
                              circularBorder: true,
                              backgroundColor: const Color(0xffFF6A03)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4.h,),
                Center(
                  child: SizedBox(
                    width: 40.w,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xffFF6A03))),
                        onPressed: () {
                            LoginCubit.get(context).pickImage(
                                image: LoginCubit.frontLicenseImage).then((
                                value) {
                              setState(() {
                                LoginCubit.frontLicenseImage = value;
                              });
                            });
                          ;
                        },
                        child: const Text(
                          'Edit photo',
                          style: TextStyle(color: Color(0xffFF6A03)),
                        )),
                  ),
                ),
                SizedBox(height: 4.h,),
                Center(
                  child: DottedBorder(
                    dashPattern: const [1, 1],
                    color: const Color(0xff808080),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffF5F4F4),
                      ),
                      child: LoginCubit.backLicenseImage != null ? Image.file(LoginCubit.backLicenseImage!,width: 300,height: 300,fit: BoxFit.fill,) :  loginData.driverLicense![0].licenseBackImage != null ? Image.network(loginData.driverLicense![0].licenseBackImage!,height: 300,width: 300,fit: BoxFit.fill,) : Column(
                        children: [
                          Icon(
                            Icons.camera_alt_rounded,
                            size: 45.dp,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Click here to upload a clear pictue of\n              front of driver\'s license',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          MainElevatedButtonTwo(circularBorder: true,
                              onPressed: () async {
                                LoginCubit.get(context).pickImage(image: LoginCubit.backLicenseImage).then((value){
                                  setState(() {
                                    LoginCubit.backLicenseImage = value;
                                  });
                                });
                              },
                              text: 'Upload',
                              backgroundColor: const Color(0xffFF6A03)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4.h,),
                Center(
                  child: SizedBox(
                    width: 40.w,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xffFF6A03))),
                        onPressed: () async {
                          LoginCubit.get(context).pickImage(image: LoginCubit.backLicenseImage).then((value){
                            setState(() {
                              LoginCubit.backLicenseImage = value;
                            });
                          });
                        },
                        child: const Text(
                          'Edit photo',
                          style: TextStyle(color: Color(0xffFF6A03)),
                        )),
                  ),
                ),
                SizedBox(height: 4.h,),
                Text(
                  'Expiration Date',
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                SizedBox(
                  height: 2.h,
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
                      hintText: 'Expiry Date',
                      prefixIcon: const Icon(Icons.calendar_today)),
                  onTap: () {
                    selectDate();
                  },
                  controller: expiryDateController,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: MainElevatedButtonTwo(
                    condition: state is EditDriverLicenseLoadingState,
                    circularBorder: true,
                      onPressed: (){
                      LoginCubit.get(context).editDriverLicense(driverLicense: driverLicenseController.text, expiryDate: expiryDateController.text, frontImage: LoginCubit.frontLicenseImage, backImage: LoginCubit.backLicenseImage, context: context);
                      },
                      text: 'Update',
                      backgroundColor: const Color(0xffFF6A03)),
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
  },
);
  }
}


class InsuranceScreenInEditMyProfile extends StatefulWidget {
  const InsuranceScreenInEditMyProfile({super.key});

  @override
  State<InsuranceScreenInEditMyProfile> createState() => _InsuranceScreenInEditMyProfileState();
}

class _InsuranceScreenInEditMyProfileState extends State<InsuranceScreenInEditMyProfile> {
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController driverLicenseController = TextEditingController();
  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2100));
    if (picked != null) {
      setState(() {
        expiryDateController.text = picked.toString().split(" ")[0];
      });
    }
  }
  @override
  void initState() {
    expiryDateController.text = loginData.driverInsurance!.insuranceExpiry!;
    driverLicenseController.text = loginData.driverInsurance!.insuranceNumber!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    if(state is EditInsuranceLicenseSuccessState){
      loginData.driverInsurance!.insuranceExpiry = expiryDateController.text;
      loginData.driverInsurance!.insuranceNumber = driverLicenseController.text;
      Navigator.pop(context);
    }
  },
  builder: (context, state) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 3.h,),
                Text(
                  'Driver License Number',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xfff5f4f4),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: driverLicenseController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required';
                      } else
                        return null;
                    },
                    decoration: InputDecoration(
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
                        contentPadding: EdgeInsets.all(15),
                        hintText:
                        'Enter your Insurance license number'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Text(
                  'Insurance Expiration Date',
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                SizedBox(
                  height: 1.h,
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
                      hintText: 'Expiry Date',
                      prefixIcon: const Icon(Icons.calendar_today)),
                  onTap: () {
                    selectDate();
                  },
                  controller: expiryDateController,
                ),
                SizedBox(height: 3.h,),
                Center(
                  child: DottedBorder(
                    dashPattern: const [1, 1],
                    color: const Color(0xff808080),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffF5F4F4),
                      ),
                      child: LoginCubit.insuranceLicense != null ? Image.file(LoginCubit.insuranceLicense!,width: 300,height: 300,fit: BoxFit.fill,) :  loginData.driverInsurance!.insuranceFrontImage != null ? Image.network(loginData.driverInsurance!.insuranceFrontImage!,height: 300,width: 300,fit: BoxFit.fill,) : Column(
                        children: [
                          Icon(
                            Icons.camera_alt_rounded,
                            size: 45.dp,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Click here to upload a clear pictue of\n              front of driver\'s Insurance',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          MainElevatedButtonTwo(
                              onPressed: () async {
                                LoginCubit.get(context).pickImage(image: LoginCubit.insuranceLicense).then((value){
                                  setState(() {
                                    LoginCubit.insuranceLicense = value;
                                  });
                                });
                              },
                              text: 'Upload',
                              circularBorder: true,
                              condition: state is EditInsuranceLicenseLoadingState,
                              backgroundColor: const Color(0xffFF6A03)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1.5.h,),
                Center(
                  child: SizedBox(
                    width: 40.w,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xffFF6A03))),
                        onPressed: () async {
                          LoginCubit.get(context).pickImage(image: LoginCubit.insuranceLicense).then((value){
                            setState(() {
                              LoginCubit.insuranceLicense = value;
                            });
                          });
                        },
                        child: const Text(
                          'Edit photo',
                          style: TextStyle(color: Color(0xffFF6A03)),
                        )),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: MainElevatedButtonTwo(
                    onPressed: (){
                      LoginCubit.get(context).editInsuranceLicense(insuranceLicense: driverLicenseController.text, insuranceExpiry: expiryDateController.text, frontImage: LoginCubit.insuranceLicense, context: context);
                    },
                      condition: state is EditInsuranceLicenseLoadingState,
                      circularBorder: true,
                      text: 'Update',
                      backgroundColor: const Color(0xffFF6A03)),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  },
);
  }
}
