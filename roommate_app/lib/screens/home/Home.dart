import 'package:flatemate/services/Auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final Auth _auth = Auth();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Center(child: Text("FlateMate", style: TextStyle(color: Colors.black),)),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              color: Colors.black,
              highlightColor: Colors.grey,
              onPressed: () async {
                await _auth.signOut();
              })
        ],
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 100,),
            RaisedButton(
                color: Colors.amberAccent,
                child: Text("Profile"),
                onPressed: () {
                  Navigator.pushNamed(context, 'profile');
                }),
            RaisedButton(
                color: Colors.amberAccent,
                child: Text("Listings"),
                onPressed: () {
                  Navigator.pushNamed(context, 'listing');
                }),
            RaisedButton(
                color: Colors.amberAccent,
                child: Text("Notifications"),
                onPressed: () {
                  Navigator.pushNamed(context, 'notifications');
                }),
            RaisedButton(
                color: Colors.amberAccent,
                child: Text("Matchings"),
                onPressed: () {
                  Navigator.pushNamed(context, 'matching');
                }),
          ],
        ),
      ),
    );
  }
}
