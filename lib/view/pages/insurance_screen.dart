import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/Controller/Constants.dart';
import 'package:voo_app/Controller/Login/login_cubit.dart';
import 'package:voo_app/view/pages/DataCheck.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class InsuranceScreen extends StatefulWidget {
  @override
  State<InsuranceScreen> createState() => _InsuranceScreenState();
}

class _InsuranceScreenState extends State<InsuranceScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController insuranceLicenseController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
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
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is AddInsuranceLicenseSuccessState){
          Navigator.popUntil(context,(route) => route.isFirst);
          Navigator.push(context, MaterialPageRoute(builder: (context) => DataCheckScreen()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 23),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 8.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  'Insurance',
                                  style: TextStyle(
                                      fontSize: 25.dp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                DottedBorder(
                                  dashPattern: [8, 4],
                                  color: Color(0xff808080),
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Color(0xffF5F4F4),
                                    ),
                                    child: LoginCubit.insuranceLicense != null
                                        ? InkWell(
                                      onTap: () async {
                                        await LoginCubit.get(context)
                                            .pickImage(
                                            image: LoginCubit
                                                .insuranceLicense,frontCamera: false)
                                            .then((value) {
                                          setState(() {
                                            LoginCubit.insuranceLicense =
                                                value;
                                          });
                                        });
                                      },
                                      child: Image.file(
                                        LoginCubit.insuranceLicense!,
                                        height: 40.h,
                                        width: 100.w,
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                        : Column(
                                      children: [
                                        Icon(
                                          Icons.camera_alt_rounded,
                                          size: 45.dp,
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Click here to take a clear picture of the\n                     registration card',
                                            style: TextStyle(
                                                color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        SizedBox(
                                          child: ElevatedButton(
                                              style: ElevatedButton
                                                  .styleFrom(
                                                  backgroundColor:
                                                  const Color(
                                                      0xffFF6A03)),
                                              onPressed: () async {
                                                await LoginCubit.get(
                                                    context)
                                                    .pickImage(
                                                    image: LoginCubit
                                                        .insuranceLicense)
                                                    .then((value) {
                                                  setState(() {
                                                    LoginCubit
                                                        .insuranceLicense =
                                                        value;
                                                  });
                                                });
                                              },
                                              child: Text(
                                                '+',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontSize: 25.dp),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            'Policy Number',
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
                              controller: insuranceLicenseController,
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
                                  'Enter your Policy number'),
                              keyboardType: TextInputType.text,
                              inputFormatters: [LettersAndDigitsInputFormatter()],
                            ),
                          ),
                          Text(
                            'Insurance Expiration Date',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.dp),
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
                                hintText: 'Expiry Date',
                                prefixIcon: Icon(Icons.calendar_today)),
                            onTap: () {
                              selectDate();
                            },
                            controller: expiryDateController,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          MainElevatedButtonTwo(
                            condition: state is AddInsuranceLicenseLoadingState,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  if (LoginCubit.insuranceLicense == null) {
                                    showSimpleDialog(
                                        context,
                                        'Please Add Insurance Image',
                                        'An insurance image is required to proceed.');
                                  } else {     LoginCubit.get(context).addInsuranceLicense(
                                      insuranceLicense:
                                      insuranceLicenseController.text,
                                      insuranceExpiry:
                                      expiryDateController.text,
                                      frontImage: LoginCubit.insuranceLicense,
                                      context: context);}
                                }
                              },
                              text: 'Next',
                              backgroundColor: Color(0xffFF6A03)),
                          SizedBox(height: 2.h,)
                        ],
                      )
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
