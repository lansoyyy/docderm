import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addUser(name, email, number, type) async {
  final currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser == null) {
    throw Exception("User is not logged in. Cannot add user to Firestore.");
  }

  final docUser =
      FirebaseFirestore.instance.collection('Users').doc(currentUser.uid);

  final json = {
    'name': name,
    'number': number,
    'email': email,
    'id': docUser.id,
    'isVerified': false,
    'favs': [],
    'profile': '',
    'community': [],
    'type': type,
  };

  await docUser.set(json);
}
