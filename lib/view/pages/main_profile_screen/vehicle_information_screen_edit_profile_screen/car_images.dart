import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/widgets/raise_documents_container_widget.dart';

class CarImages extends StatelessWidget {
  const CarImages({super.key});


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
            'Car Images',
            style: TextStyle(fontSize: 20.dp, fontWeight: FontWeight.bold),
          ),
        ),

        body:
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.0.w),
          child: Column(
            children: [
              RaiseDocumentsContainerWidget(
                  uploadedPicture: true,
                  text: 'Front side with number plate'),
              SizedBox(height: 2.h,),
              RaiseDocumentsContainerWidget(
                  uploadedPicture: false,
                  text: 'Chassis number images'),
              SizedBox(height: 2.h,),
              RaiseDocumentsContainerWidget(
                  uploadedPicture: false,
                  text: 'Back side with number plate'),
              SizedBox(height: 2.h,),
              RaiseDocumentsContainerWidget(
                  uploadedPicture: true,
                  text: 'Left side exterior'),
              SizedBox(height: 2.h,),
              RaiseDocumentsContainerWidget(
                  uploadedPicture: true,
                  text: 'Right side exterior'),
            ],
          ),
        )
    );
  }
}
