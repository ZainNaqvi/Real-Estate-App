import 'package:cloud_firestore/cloud_firestore.dart';

class UserCreaditials {
  final fullname;
  final lastName;
  final uid;
  final email;
  final phoneNo;
  final address;
  final cnic;
  final gender;
  final age;
  final country;
  final profilePic;
  // final List cart;
  // creating the constructor here...
  UserCreaditials({
    required this.profilePic,
    required this.email,
    required this.uid,
    required this.fullname,
    required this.lastName,
    required this.phoneNo,
    required this.address,
    required this.gender,
    required this.age,
    required this.country,
    required this.cnic,
    // required this.cart,
  });
  // converting it to the map object
  Map<String, dynamic> toJson() => {
        "profilePic": profilePic,
        "fullName": fullname,
        "lastName": lastName,
        "email": email,
        "uid": uid,
        "address": address,
        "cnic": cnic,
        "phoneNo": phoneNo,
        "gender": gender,
        "age": age,
        "country": country,
        "cart": [],
      };
  static UserCreaditials fromSnap(DocumentSnapshot documentSnapshot) {
    var snapshot = documentSnapshot.data() as Map<String, dynamic>;
    return UserCreaditials(
      profilePic: snapshot['profilePic'],
      uid: snapshot['uid'],
      email: snapshot['email'],
      fullname: snapshot['fullName'],
      lastName: snapshot['lastName'],
      address: snapshot['address'],
      age: snapshot['age'],
      cnic: snapshot['cnic'],
      country: snapshot['country'],
      gender: snapshot['gender'],
      phoneNo: snapshot['phoneNo'],
      // cart: snapshot['cart'],
    );
  }
}
