import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docderm/utils/const.dart';

import 'package:firebase_auth/firebase_auth.dart';

Future<String> addPost(title, desc, img, myname) async {
  final docUser = FirebaseFirestore.instance.collection('Post').doc();

  final json = {
    'myname': myname,
    'title': title,
    'desc': desc,
    'img': img,
    'id': docUser.id,
    'userId': userId,
    'members': [userId],
  };

  await docUser.set(json);

  return docUser.id;
}
