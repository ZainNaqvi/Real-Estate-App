import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserPost {
  final String title;
  final String location;
  final String overview;
  final String price;
  final String beds;
  final String rooms;
  final String sqft;
  final String uid;
  final String userName;
  final String postId;
  final datePublished;
  final String postURL;
  final String profileImage;

  final likes;
  // creating the constructor here...
  UserPost({
    required this.title,
    required this.uid,
    required this.userName,
    required this.postId,
    required this.datePublished,
    required this.postURL,
    required this.profileImage,
    required this.likes,
    required this.beds,
    required this.location,
    required this.overview,
    required this.price,
    required this.rooms,
    required this.sqft,
  });
  // converting it to the map object
  Map<String, dynamic> toJson() => {
        "title": title,
        "userName": userName,
        "location": location,
        "price": price,
        "beds": beds,
        "rooms": rooms,
        "sqft": sqft,
        "overview": overview,
        "datePublished": datePublished,
        "profileImage": profileImage,
        "likes": likes,
        "postURL": postURL,
      };
  static UserPost fromSnap(DocumentSnapshot documentSnapshot) {
    var snapshot = documentSnapshot.data() as Map<String, dynamic>;
    return UserPost(
      uid: snapshot['uid'],
      userName: snapshot['userName'],
      title: snapshot['title'],
      profileImage: snapshot['profileImage'],
      likes: snapshot['likes'],
      datePublished: snapshot['datePublished'],
      postURL: snapshot['postURL'],
      postId: snapshot['postId'],
      sqft: snapshot['sqft'],
      beds: snapshot['beds'],
      location: snapshot['location'],
      overview: snapshot['overview'],
      price: snapshot['price'],
      rooms: snapshot['rooms'],
    );
  }
}
