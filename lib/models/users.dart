import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserCreaditials {
  final String firstName;
  final String lastName;
  final String uid;
  final String email;
  final String phoneNo;
  final String address;
  final String cnic;
  final String gender;
  final String age;
  final String country;
  // creating the constructor here...
  UserCreaditials({
    required this.email,
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.phoneNo,
    required this.address,
    required this.gender,
    required this.age,
    required this.country,
    required this.cnic,
  });
  // converting it to the map object
  Map<String, dynamic> toJson() => {
        "fullName": firstName,
        "lastName": lastName,
        "email": email,
        "uid": uid,
        "address": address,
        "cnic": cnic,
        "phoneNo": phoneNo,
        "gender": gender,
        "age": age,
        "country": country,
      };
  static UserCreaditials fromSnap(DocumentSnapshot documentSnapshot) {
    var snapshot = documentSnapshot.data() as Map<String, dynamic>;
    return UserCreaditials(
      uid: snapshot['uid'],
      email: snapshot['email'],
      firstName: snapshot['firstName'],
      lastName: snapshot['lastName'],
      address: snapshot['address'],
      age: snapshot['age'],
      cnic: snapshot['cnic'],
      country: snapshot['country'],
      gender: snapshot['gender'],
      phoneNo: snapshot['phoneNo'],
    );
  }
}
