import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/widgets/icon_and_text_field_basic_info_screen.dart';

class BasicInfoScreen extends StatefulWidget {

  @override
  State<BasicInfoScreen> createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends State<BasicInfoScreen> {
  TextEditingController dateController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 3.h,),
               InkWell(
                 onTap: (){},
                 child: CircleAvatar(
                   radius: 10.w,
                   backgroundColor: Color(0xffA2A2A2),
                   child: Icon(
                     Icons.person,
                     size: 15.w,
                     color: Colors.white,
                   ),
                 ),
               ),
               SizedBox(height: 1.h,),
               InkWell(
                 onTap: (){},
                 child: Text('Edit your photo',
                 style: TextStyle(
                   fontWeight: FontWeight.bold,
                 fontSize: 15.dp
                 ),
                 ),
               ),
                IconAndTextField(
                    icon: Icons.person,
                    keyboardType: TextInputType.name,
                    hintText: 'Enter your name'),
                IconAndTextField(
                    icon: Icons.mail,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Enter your email address'),
                IconAndTextField(
                  icon: Icons.phone_android,
                  keyboardType: TextInputType.phone,
                  hintText: 'Enter your phone number'),

              Container(
                decoration: BoxDecoration(
                    color: Color(0xffF5F4F4),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                      hintText: 'Choose your date of birth',
                      prefixIcon: Icon(Icons.calendar_today)),
                  onTap: () {
                    selectDate();
                  },
                  controller: dateController,
                ),
              ),
              IconAndTextField(
                  icon: Icons.transgender_outlined,
                  keyboardType: TextInputType.text,
                  hintText: 'Enter your gender'),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2100));
    if (picked != null) {
      setState(() {
        dateController.text = picked.toString().split(" ")[0];
      });
    }
  }
}


// class IconAndTextField extends StatelessWidget {
//   IconData icon;
//   TextInputType keyboardType;
//   String hintText;
//
//   IconAndTextField ({
//     required this.icon,
//     required this.keyboardType,
//     required this.hintText,
// });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
//       child: Row(
//         children: [
//           Icon(icon,
//             size: 25.dp,
//             color: Color(0xff808080),),
//           SizedBox(width: 3.w,),
//           Container(
//             width: 82.w,
//             height: 6.h,
//             decoration: const BoxDecoration(
//               color: Color(0xffF5F4F4),
//             ),
//             child: TextField(
//               keyboardType: keyboardType,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(5.dp)),
//                     borderSide: BorderSide(
//                         color: Color(0xffF5F4F4)
//                     )
//                 ),
//                 hintText: hintText,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
