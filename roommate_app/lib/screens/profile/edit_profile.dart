import 'package:flatemate/models/User.dart';
import 'package:flatemate/services/database.dart';
import 'package:flatemate/shared/constants.dart';
import 'package:flatemate/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditForm extends StatefulWidget {
  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final _formKey = GlobalKey<FormState>();

  String _currentName;
  int _currentAge;
  String _currentOccupation;
  String _currentBio;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: Database(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update your profile',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration.copyWith(hintText: 'Name'),
                    validator: (val) => val.isEmpty ? 'Enter a name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    initialValue: userData.age.toString(),
                    decoration: textInputDecoration.copyWith(hintText: 'Age'),
                    validator: (val) => val.isEmpty ? 'Enter your age' : null,
                    onChanged: (val) =>
                        setState(() => _currentAge = val as int),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    initialValue: userData.occupation,
                    decoration:
                        textInputDecoration.copyWith(hintText: 'Occupation'),
                    validator: (val) =>
                        val.isEmpty ? 'Enter your occupation' : null,
                    onChanged: (val) =>
                        setState(() => _currentOccupation = val),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    initialValue: userData.bio,
                    decoration: textInputDecoration.copyWith(hintText: 'Bio'),
                    validator: (val) => val.isEmpty ? 'Enter a bio' : null,
                    onChanged: (val) => setState(() => _currentBio = val),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                      onPressed: () async {
                        if(_formKey.currentState.validate()){
                          await Database(uid: user.uid).updateUserData(
                            _currentName ?? userData.name, 
                            _currentOccupation ?? userData.occupation, 
                            _currentAge ?? userData.age, 
                            _currentBio ?? userData.bio);
                        }
                      },
                      color: Colors.amberAccent,
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
