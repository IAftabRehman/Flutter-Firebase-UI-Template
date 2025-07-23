import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/onBoarding/splashScreen.dart';
import 'firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Supabase.initialize(
    url: 'https://uzelkqzlgkjmdexzhfoj.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InV6ZWxrcXpsZ2tqbWRleHpoZm9qIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNTAyMjIsImV4cCI6MjA2ODkyNjIyMn0.BXWyVHoJ_YItaWETU9rDreaYFJwGTkhgTQG6W_2a6rw',
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen()
    );
  }
}

