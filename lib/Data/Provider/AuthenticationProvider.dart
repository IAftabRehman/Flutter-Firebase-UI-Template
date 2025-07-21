import 'package:flutter/material.dart';
import 'package:internship_first_task/Screens/dashboard_Screens/homeDashboard.dart';
import '../../Data/Services/AuthenticationServices.dart';

class AuthenticationProvider with ChangeNotifier {

  // LogIn
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    setLoading(true);

    try {
      final result = await AuthenticationServices().loginUser(
        email: email,
        password: password,
      );

      if (result != null) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Message"),
            content: const Text("Logged In"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CustomBottomBarWidget()));
                },
                child: const Text("Next"),
              )
            ],
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
    setLoading(false);
  }
  
}
