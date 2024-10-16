import 'package:docderm/screens/home_screen.dart';
import 'package:docderm/screens/landing_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAqxg3mkfYh6gOJkScF9UqyOm_5UQxafdE",
          authDomain: "docderm-54b6f.firebaseapp.com",
          projectId: "docderm-54b6f",
          storageBucket: "docderm-54b6f.appspot.com",
          messagingSenderId: "889291875183",
          appId: "1:889291875183:web:ae83f561d9a80cee277e9a"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'DocDerm',
      home: HomeScreen(),
    );
  }
}
