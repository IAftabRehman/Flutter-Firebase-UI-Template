import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:internship_first_task/Screens/Registration_And_Login/registration2.dart';
import 'package:provider/provider.dart';
import 'Data/Provider/AuthenticationProvider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Registration2(name: "adsf",email: "daf", password: "sdfa",)
      ),
    );
  }
}

