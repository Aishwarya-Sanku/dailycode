import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final leftPadding = screenWidth * 0.2; // 20% of the screen width

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 174, 189, 227),
        body: Stack(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 100.0), // Start from 20% of the screen width
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Text(
                          '      Welcome to Harbinger !',
                          style: TextStyle(
                            fontSize: 28, // Adjust the font size as needed
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF384289), // Adjust the font weight as needed
                          ),
                        ),
                      ),
                      SizedBox(height: 20), // Add some spacing between the text and the image
                      Container(
                        width: screenWidth * 0.4, // Adjust the image width as 60% of the screen width
                        height: 400,
                        child: Image.asset('images/a.png'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 600,
                height: 700,
                color: Colors.white, 
                  // child: Icon(
                  //           Icons.at,
                  //           size: 55,
                  //           color: Colors.black87,
                  //         ),
                ),
              ),
          
          ],
        ),
      ),
    );
  }
}

