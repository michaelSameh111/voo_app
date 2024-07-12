import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../Controller/Data/data_cubit.dart';
import '../../../widgets/main_elevated_button.dart';
import '../../HomePage/Home.dart';

class SubmitAComplaintScreen extends StatefulWidget {
 final int? tripId;
  const SubmitAComplaintScreen({super.key,this.tripId});


  @override
  State<SubmitAComplaintScreen> createState() => _SubmitAComplaintScreenState();
}


class _SubmitAComplaintScreenState extends State<SubmitAComplaintScreen> {
  String? selectedValue = 'Accident';
  GlobalKey <FormState> formKey = GlobalKey();
  late BuildContext dialogContext;
  TextEditingController controller = TextEditingController();
  Future<void> showSimpleDialog(
      {VoidCallback? camera, VoidCallback? gallery}) async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          dialogContext = context;
          return SimpleDialog(
            title: const Text('Select Picker Type'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: camera,
                child: const Text('Camera'),
              ),
              SimpleDialogOption(
                onPressed: gallery,
                child: const Text('Gallery'),
              ),
            ],
          );
        });
  }
  @override
  void dispose() {
    DataCubit.imagesFilesList.clear();
    DataCubit.imagesFileList.clear();
    DataCubit.multiPart.clear();
    DataCubit.claimImage = null;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
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
                      DropdownMenuItem(child: Text('Accident',),value: 'Accident',),
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
                        } else {
                          return null;
                        }
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
                  MainElevatedButtonTwo(onPressed: () async {
                    showSimpleDialog(camera: () async {
                      await DataCubit.get(context)
                          .pickImage(ImageSource.camera);
                      Navigator.pop(dialogContext);
                    }, gallery: () async {
                      await DataCubit.get(context)
                          .selectImages(context);
                      Navigator.pop(dialogContext);
                    });
                  }, text: 'Add Photos'),
                  SizedBox(height: 2.h,),
                  DataCubit.imagesFilesList.isNotEmpty ? SizedBox(height: 20.h,child: ListView.separated(physics: BouncingScrollPhysics(),itemBuilder: (context,index)=>Stack(
                    children: [
                      Image.file(DataCubit.imagesFilesList[index]),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: Icon(Icons.close, color: Colors.white),
                          onPressed: () {
                            setState(() {
                              DataCubit.imagesFilesList.removeAt(index);
                              DataCubit.imagesFileList.removeAt(index);
                              if(DataCubit.multiPart.isNotEmpty){   DataCubit.multiPart.removeAt(index);}
                            });
                          },
                        ),
                      ),
                    ],
                  ), separatorBuilder: (context,index)=>SizedBox(width: 5.w,), itemCount: DataCubit.imagesFileList.length,scrollDirection: Axis.horizontal,),) : SizedBox(),
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
                          DataCubit.get(context).complainSubmit(description: controller.text, type: selectedValue!,tripId :widget.tripId, context: context);
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
