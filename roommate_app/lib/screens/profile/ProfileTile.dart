import 'package:flatemate/models/Profile.dart';
import 'package:flatemate/shared/add_photo.dart';
import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final Profile profile;
  ProfileTile({this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Card(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              ProfilePageWidget(),
              SizedBox(
                height: 50,
              ),
              Text(profile.name, style: TextStyle(fontSize: 30)),
              SizedBox(
                height: 10,
              ),
              Text(
                profile.age.toString(),
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                profile.occupation,
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                profile.bio,
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
