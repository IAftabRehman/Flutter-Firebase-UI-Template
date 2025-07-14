import 'package:flutter/material.dart';

class ConnectionLost extends StatelessWidget {
  const ConnectionLost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/connectionLost_4.png",
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 50,
            right: 50,
            child: Image.asset(
              "assets/images/connectionLost_3.png",
              width: 300,
              height: 100,
            ),
          ),
          Positioned(
            top: 50,
            right: 50,
            child: Image.asset(
              "assets/images/connectionLost_2.png",
              width: 100,
              height: 500,
            ),
          ),
          Positioned(
            bottom: 40,
            left: 50,
            child: Image.asset(
              "assets/images/connectionLost_1.png",
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
