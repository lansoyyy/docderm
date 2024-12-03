import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docderm/utils/const.dart';

import 'package:firebase_auth/firebase_auth.dart';

Future<String> addCommunity(name) async {
  final docUser = FirebaseFirestore.instance.collection('Community').doc();

  final json = {
    'name': name,
    'id': docUser.id,
    'members': [FirebaseAuth.instance.currentUser!.uid],
  };

  await docUser.set(json);

  return docUser.id;
}
