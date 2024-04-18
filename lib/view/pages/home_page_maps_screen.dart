import 'package:flutter/material.dart';

class HomePageMapsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Let\'s start'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Go online'))
                ],
                title: Icon(Icons.add_alert),
                content: Text(
                  'You\'re offline !\nGo online to accept jobs',
                  style: TextStyle(color: Color(0xff646363)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
