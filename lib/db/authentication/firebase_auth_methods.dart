import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:houses_olx/models/users.dart';
import 'package:houses_olx/widget/customSnakeBar.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  // creating the function to create the user
  Future<String> createUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    String res = "Some error Occured";
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(userCredential.user!.uid);
      res = "success";
    } on FirebaseAuthException catch (err) {
      if (err.code == 'weak-password') {
        showSnakeBar("The password provided is too weak.", context);
      } else if (err.code == 'email-already-in-use') {
        showSnakeBar("The account already exists for that email.", context);
      }
    }
    return res;
  }

  Future<String> completeProfile({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String address,
    required String cnic,
    required String country,
    required String age,
    required String gender,
    required BuildContext context,
  }) async {
    String res = "Some error occured";
    try {
      UserCreaditials userCreaditials = UserCreaditials(
        email: _auth.currentUser!.email!,
        uid: _auth.currentUser!.uid,
        firstName: firstName,
        lastName: lastName,
        address: address,
        age: age,
        gender: gender,
        country: country,
        cnic: cnic,
        phoneNo: phoneNumber,
      );
      _firebaseFirestore
          .collection("users")
          .doc(_auth.currentUser!.uid)
          .set(userCreaditials.toJson());
      res = "success";
    } on FirebaseAuthException catch (err) {
      showSnakeBar(err.message!, context);
    }
    return res;
  }

  // login
  Future<String> userLogin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    String res = "Some error occured.";
    // checking the values are empty or not
    try {
      // now checking and login the user
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      res = "success";
    } on FirebaseAuthException catch (err) {
      if (err.code == "wrong-password") {
        showSnakeBar("Invalid Creaditials", context);
      }
    } catch (err) {
      showSnakeBar(err.toString(), context);
    }
    return res;
  }
}
