import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/Controller/Data/data_cubit.dart';
import 'package:voo_app/view/pages/HomePage/Home.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class SubmitAComplaintScreen extends StatefulWidget {
  const SubmitAComplaintScreen({super.key});


  @override
  State<SubmitAComplaintScreen> createState() => _SubmitAComplaintScreenState();
}


class _SubmitAComplaintScreenState extends State<SubmitAComplaintScreen> {
  String? selectedValue = 'Lost Item';
  GlobalKey <FormState> formKey = GlobalKey();
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 10.h,
        leadingWidth: 0,
        title: Row(
          children: [
            SizedBox(
              width: 1.w,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  height: 20.h,
                  width: 10.w,
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
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              'Submit a complain',
              style: TextStyle(
                  fontSize: 20.dp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
      ),

      body: BlocConsumer<DataCubit, DataState>(
  listener: (context, state) {
    if(state is SubmitClaimSuccessState){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePageMapsScreen()), (route)=>false);
    }
  },
  builder: (context, state) {
    return Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.0.w),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Title *',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              DropdownButtonFormField<String>(
                padding: EdgeInsets.all(8),
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
                ),
                validator: (value) {
                  if (value == 'Claim Type') {
                    return 'Please choose Claim Type';
                  }
                  return null;
                },
                items: [
                  DropdownMenuItem(child: Text('Lost Item',),value: 'Lost Item',),
                  DropdownMenuItem(child: Text('Complain',),value: 'Complain',),
                ],
                value: selectedValue,

                onChanged: (String? value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Description *',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Please add full description';
                    } else return null;
                  },
                  maxLines: null,
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'Description',
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffC4C4C4),
                          ),
                          borderRadius: BorderRadius.circular(8.dp))),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: Text(
              //         'Car Images *',
              //         style:
              //         TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 2.h,
              // ),
              // Container(
              //   decoration: BoxDecoration(
              //       color: const Color(0xffF5F4F4),
              //       borderRadius: BorderRadius.circular(8.dp)),
              //   child: TextField(
              //     decoration: InputDecoration(
              //       suffixIcon: Icon(Icons.arrow_forward_ios,
              //         color: Colors.black,
              //       size: 15.dp,),
              //         border: InputBorder.none,
              //         contentPadding: EdgeInsets.all(13.dp),
              //         hintText: 'Add car image'),
              //
              //   ),
              // ),
              const Spacer(),
              MainElevatedButtonTwo(
                  onPressed: (){
                    if(formKey.currentState!.validate()){
                      DataCubit.get(context).complainSubmit(description: controller.text, type: selectedValue!, context: context);
                    }
                  },
                  circularBorder: true,
                  condition: state is SubmitClaimLoadingState,
                  text: 'Submit',
                  backgroundColor: const Color(0xffFF6A03)),
              SizedBox(height: 3.h,),
            ],
          ),
        ),
      );
  },
),

    );
  }
}
