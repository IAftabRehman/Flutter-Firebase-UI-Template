import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intership_first_task/Screens/Status_Screens/verificationCode.dart';
import 'package:intership_first_task/Screens/onBoarding/splashScreen.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen(),
    );
  }
}


// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:intership_first_task/Screens/Status_Screens/verificationCode.dart';
// import 'firebase_options.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   try {
//     // Load environment variables with better error handling
//     await dotenv.load(fileName: ".env");
//     print('Environment loaded successfully');
//
//     // Verify a key exists
//     if (dotenv.env['API_KEY_ANDROID'] == null) {
//       throw Exception('API_KEY_ANDROID not found in .env file');
//     }
//
//     // Initialize Firebase
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//
//     print('Firebase initialized successfully');
//     runApp(const MyApp());
//   } catch (e) {
//     // Handle initialization errors
//     print('Error during app initialization: $e');
//     print('Error type: ${e.runtimeType}');
//     runApp(const ErrorApp());
//   }
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: const VerificationCode(),
//     );
//   }
// }
//
// // Error fallback widget
// class ErrorApp extends StatelessWidget {
//   const ErrorApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Icon(
//                 Icons.error_outline,
//                 size: 64,
//                 color: Colors.red,
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Failed to initialize app',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'Please check your configuration and try again.',
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }