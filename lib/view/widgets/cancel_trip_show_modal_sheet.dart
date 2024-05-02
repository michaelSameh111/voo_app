// import 'package:flutter/material.dart';
//
// class cancelTripShowModalSheet {
//   static void _moreModalBottomSheet(context) {
//     Size size = MediaQuery.of(context).size;
//     showModalBottomSheet(
//         isScrollControlled: true,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(40.0),
//         ),
//         context: context,
//         builder: (BuildContext context) {
//           return Container(
//             height: size.height * 0.5,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(40.0),
//                 topLeft: Radius.circular(40.0),
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//               child: ListView(
//                 physics: ClampingScrollPhysics(),
//                 children: [
//                   //content of modal bottomsheet
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }