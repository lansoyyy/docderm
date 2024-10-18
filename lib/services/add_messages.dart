import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docderm/services/add_notif.dart';
import 'package:docderm/utils/const.dart';

import 'package:firebase_auth/firebase_auth.dart';

Future<String> addMessages(otherUserId, msg, myname) async {
  final docUser = FirebaseFirestore.instance.collection('Chats').doc();

  final json = {
    'sender': userId,
    'msg': msg,
    'dateTime': DateTime.now(),
    'id': docUser.id,
    'ids': [userId, otherUserId],
  };

  addNotif(otherUserId, myname);

  await docUser.set(json);

  return docUser.id;
}
