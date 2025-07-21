import 'package:flutter/material.dart';

class ConnectionLost extends StatelessWidget {
  const ConnectionLost({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            top: 400,
            child: Image.asset(
              "assets/images/connectionLost_4.png",
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            top: size.height * 0.08,
            right: size.width * 0.1,
            child: Image.asset(
              "assets/images/connectionLost_2.png",
              width: size.width * 0.3,
              height: size.height * 0.4,
              fit: BoxFit.contain,
            ),
          ),

          // Sky overlay/clouds (behind kite)
          Positioned(
            top: size.height * 0.05,
            right: size.width * 0.15,
            child: Image.asset(
              "assets/images/connectionLost_3.png",
              width: size.width * 0.8,
              fit: BoxFit.contain,
            ),
          ),

          // Boy image (bottom center)
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.3),
              child: Image.asset(
                "assets/images/connectionLost_1.png",
                height: size.height * 0.25,
              ),
            ),
          ),

          // Content (Text + Button)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.05),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Connection Lost",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Something went wrong",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Retry logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF339D44),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Retry",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
