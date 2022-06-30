import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:houses_olx/db/authentication/storage_methods.dart';
import 'package:houses_olx/models/posts.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  // for uploading the image
  Future<String> uploadPost({
    required Uint8List file,
    required final uid,
    required final contactNumber,
    required final email,
    required String username,
    required String title,
    required String location,
    required String overview,
    required String price,
    required String beds,
    required String rooms,
    required String sqft,
  }) async {
    String res = "Some error occured";
    try {
      String imageURL = await StorageMethods().uploadImageToStorage(
        "posts",
        file,
        true,
      );
      ;
      String postId = const Uuid().v1();
      UserPost userPost = UserPost(
        title: title,
        uid: uid,
        userName: username,
        contactnumber: contactNumber,
        email: email,
        postId: postId,
        datePublished: DateTime.now(),
        postURL: imageURL,
        likes: [],
        beds: beds,
        location: location,
        overview: overview,
        price: price,
        rooms: rooms,
        sqft: sqft,
      );
      _firebaseFirestore.collection("posts").doc(postId).set(userPost.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
