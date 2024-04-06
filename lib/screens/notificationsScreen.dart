import 'package:flutter/material.dart';
import 'package:smartmeter/constants/size.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
        ListView(
          children: [
            Text("Notifications"),
            h20,
            Container(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Center(child: Icon(Icons.notifications_rounded,color: const Color.fromARGB(255, 11, 41, 65),),),
                  )
                ],
              ),
            )
          ],
        )   
       ),
    );
  }
}