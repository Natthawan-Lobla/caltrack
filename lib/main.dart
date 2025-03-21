import 'package:caltrack/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAV-Quw1AOJPI82M3ZtjjdN-fzdeZaxfK8",
      authDomain: "caltrack-adf35.firebaseapp.com",
      projectId: "caltrack-adf35",
      storageBucket: "caltrack-adf35.firebasestorage.app",
      messagingSenderId: "1079312687821",
      appId: "1:1079312687821:web:3b760ae6aeefcf62d83f84",
      measurementId: "G-5FXHQRF798",)
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CalTrack',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WelcomeScreen(),
    );
  }
}
