import 'package:docderm/screens/admin/admin_home.dart';
import 'package:docderm/screens/home_screen.dart';
import 'package:docderm/screens/landing_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tflite_web/tflite_web.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TFLiteWeb.initialize();
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
    return MaterialApp(
      title: 'DocDerm',
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomeScreen();
            } else {
              return const LandingScreen();
            }
          }),
    );
  }
}
