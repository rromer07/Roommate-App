import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flatemate/models/Profile.dart';
import 'package:flatemate/models/User.dart';

class Database{
  
  final String uid;
  Database({this.uid});
  //collection reference
  final CollectionReference userCollection = Firestore.instance.collection('user');

  Future updateUserData(String name, String occupation, int age, String bio)async{
    return await userCollection.document(uid).setData({
      'name': name,
      'occupation': occupation,
      'age':age,
      'bio':bio
    });
  }

  //get profile stream from snapshot
  List<Profile> _profileListFromSnapShot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){ 
      return Profile(
        name: doc.data['name'] ?? '',
        occupation: doc.data['occupation'] ?? '',
        bio: doc.data['bio'] ?? '',
        age: doc.data['age'] ?? null
      );
    }).toList();
  }

  //get profile stream
  Stream<List<Profile>> get profile{
    return userCollection.snapshots()
    .map(_profileListFromSnapShot);
  }

  //get user doc stream 
  Stream <UserData> get userData{
    return userCollection.document(uid).snapshots().map((_userDataFromSnapshot));
  }

  //userData from snapshot
  UserData  _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid:uid, 
      name:snapshot.data['name'],
      age:snapshot.data['age'],
      occupation:snapshot.data['occupation'],
      bio:snapshot.data['bio'],

    );
  }
}