import 'package:flutter/material.dart';
import 'package:roommate_app/pages/home_page.dart';
import 'package:roommate_app/pages/login_page.dart';
import 'package:roommate_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Constants.prefs.getBool('loggedIn') == true
          ? HomePage()
          : LoginPage(),
      theme: ThemeData(primarySwatch: Colors.yellow),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        HomePage.routeName: (context) => HomePage(),
      },
    );
  }
}
