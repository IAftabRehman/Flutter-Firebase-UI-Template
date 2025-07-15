import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intership_first_task/Screens/onBoarding/splashScreen.dart';
import 'package:intership_first_task/gettingVideos.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: ".env");
  // print(dotenv.env['API_KEY_ANDROID']);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: gettingVideos(),
    );
  }
}
