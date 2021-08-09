import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_with_reminder/notification_service.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;


class MainScreen extends StatefulWidget {


  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  void initState() {
    // TODO: implement
    tz.initializeTimeZones();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Set reminder',
        ),
      ),
     body: Center(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
         children: [

           GestureDetector(
             onTap: (){
               NotificationService().cancelAllNotifications();
             },
             child: Container(
               height: 40,
               width: 200,
               color: Colors.pink,
               child: Center(
                 child:  Text(
                   'Cancel all',
                   style: TextStyle(
                     color: Colors.white,
                   ),
                 ),
               ),
             ),
           ),

           GestureDetector(
             onTap: (){
               NotificationService().showNotification(1, 'title', 'body', 5);
             },
             child: Container(
               height: 40,
               width: 200,
               color: Colors.blueGrey,
               child: Center(
                 child:  Text(
                   'Notify me',
                   style: TextStyle(
                     color: Colors.white,
                   ),
                 ),
               ),
             ),
           ),
         ],
       ),
     ),
    );
  }
}
