import "package:flutter/material.dart";
import 'package:roommate_app/pages/login_page.dart';
import 'package:roommate_app/utils/constants.dart';
class HomePage extends StatelessWidget {
  static const String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app), 
            onPressed: (){
              Constants.prefs.setBool("loggedIn", false);
              Navigator.pushReplacementNamed(context, LoginPage.routeName);
            }
          )
        ],
      ),
    );
  }
}