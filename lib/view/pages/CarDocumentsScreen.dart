import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';


class CarDocumentsScreen extends StatelessWidget {
  const CarDocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 7.h,
                    width: 10.w,
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },

                        borderRadius: BorderRadius.circular(300),
                        child: Image.asset(
                          'assets/images/backArrow.png',
                          width: 10.w,
                        )),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text('Car Documents',style: GoogleFonts.roboto(fontSize: 16.dp,fontWeight: FontWeight.w500,color: Colors.black),)
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    DocumentTile(
                      title: 'Car PUC',
                      icon: Icon(Icons.check_circle, color: Colors.green),
                      onTap: () {
                        // Handle tap
                      },
                    ),
                    DocumentTile(
                      title: 'Car insurance',
                      icon:
                          Icon(Icons.check_circle_outline, color: Colors.grey),
                      onTap: () {
                        // Handle tap
                      },
                    ),
                    DocumentTile(
                      title: 'Car registration certificate',
                      icon:
                          Icon(Icons.check_circle_outline, color: Colors.grey),
                      onTap: () {
                        // Handle tap
                      },
                    ),
                    DocumentTile(
                      title: 'Car permit',
                      icon:
                          Icon(Icons.check_circle_outline, color: Colors.grey),
                      onTap: () {
                        // Handle tap
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class CarImagesScreen extends StatelessWidget {
  const CarImagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 7.h,
                    width: 10.w,
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },

                        borderRadius: BorderRadius.circular(300),
                        child: Image.asset(
                          'assets/images/backArrow.png',
                          width: 10.w,
                        )),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text('Car Images',style: GoogleFonts.roboto(fontSize: 16.dp,fontWeight: FontWeight.w500,color: Colors.black),)
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    DocumentTile(
                      title: 'Front Side',
                      icon: Icon(Icons.check_circle, color: Colors.green),
                      onTap: () {
                        // Handle tap
                      },
                    ),
                    DocumentTile(
                      title: 'Back Side',
                      icon:
                          Icon(Icons.check_circle_outline, color: Colors.grey),
                      onTap: () {
                        // Handle tap
                      },
                    ),
                    DocumentTile(
                      title: 'Left Side',
                      icon:
                          Icon(Icons.check_circle_outline, color: Colors.grey),
                      onTap: () {
                        // Handle tap
                      },
                    ),
                    DocumentTile(
                      title: 'Right Side',
                      icon:
                          Icon(Icons.check_circle_outline, color: Colors.grey),
                      onTap: () {
                        // Handle tap
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DocumentTile extends StatelessWidget {
  final String title;
  final Icon icon;
  final VoidCallback onTap;

  const DocumentTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: Colors.grey.shade300,width: 0.5)
      ),
      child: ListTile(
        leading: icon,
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
