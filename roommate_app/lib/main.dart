import 'package:flatemate/models/User.dart';
import 'package:flatemate/screens/profile/Profile_page.dart';
import 'package:flatemate/screens/home/Home.dart';
import 'package:flatemate/screens/wrapper.dart';
import 'package:flatemate/services/Auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: Auth().user,
          child: MaterialApp(
        home: Wrapper(),
         routes: {
           'home': (context)=>Home(),
           'profile':(context)=>ProfilePage(),
        //   'listing':(context)=>Listing(),
        //   'notifications':(context)=>Notifications(),
        //   'matching': (context)=>Matching()
         },
      ),
    );
  }
}
