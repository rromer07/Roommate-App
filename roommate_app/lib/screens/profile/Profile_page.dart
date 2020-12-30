import 'package:flatemate/models/Profile.dart';
import 'package:flatemate/screens/profile/edit_profile.dart';
import 'package:flatemate/screens/profile/profile_list.dart';
import 'package:flatemate/services/database.dart';
import 'package:flatemate/shared/add_photo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    void _showModalBottomSheet(BuildContext context) =>
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) => SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: EditForm(),
              ),
            ),
          ),
        );

    return StreamProvider<List<Profile>>.value(
        value: Database().profile,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            actions: <Widget>[
              FlatButton.icon(
                onPressed: () => _showModalBottomSheet(context),
                icon: Icon(Icons.edit),
                label: Text(''),
              ),
            ],
            backgroundColor: Colors.yellow,
            title: Text('Profile', style: TextStyle(color: Colors.black)),
          ),
          body: ProfileList(),
        ));
  }
}
