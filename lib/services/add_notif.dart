import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docderm/utils/const.dart';

import 'package:firebase_auth/firebase_auth.dart';

Future<String> addNotif(otherUserId, myname) async {
  final docUser = FirebaseFirestore.instance.collection('Notifs').doc();

  final json = {
    'otherUserId': otherUserId,
    'myname': myname,
    'id': docUser.id,
    'msg': '$myname has sent you a message',
    'dateTime': DateTime.now(),
  };

  await docUser.set(json);

  return docUser.id;
}
