import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFF3F7FE),
        body: Center(
          child: LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidthPercentage = 75.0;
    double textfieldWidthPercentage = 80.0;

    double buttonWidth =
        (screenWidth * buttonWidthPercentage / 100).clamp(0, screenWidth);
    double textFieldWidth =
        (screenWidth * textfieldWidthPercentage / 100).clamp(0, screenWidth);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Logo part
          Image.asset(
            'assets/images/CSE Logo.png',
            width: 200,
          ),

          // SvgPicture.asset(
          //   'assets/cseLogo.svg',
          //   semanticsLabel: 'My SVG Image',
          //   height: 100,
          //   width: 70,
          // ),

          const SizedBox(height: 20.0), // Spacer

          Text(
            'Log in to continue',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18.0, // Adjust the font size as needed
              color: Color.fromRGBO(38, 38, 38, 1), // Set the text color
            ),
          ),

          const SizedBox(height: 50.0), // Spacer

          Container(
            width: textFieldWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0), // the border radius
              color: Colors.white, //the textfield's background color to white
            ),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 16.0), //padding left
                border: InputBorder.none, // Remove the border
                hintText: 'Email',
                hintStyle: TextStyle(
                  // Adjust font style for the label
                  fontSize: 16.0, // Set the font size
                  fontFamily: 'Poppins',
                  color: Color.fromRGBO(170, 170, 170, 1),
                ),
              ),
            ),
          ),

          const SizedBox(height: 24.0), // Spacer

          Container(
            width: textFieldWidth,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(20.0), // Set the border radius
              color: Colors.white, // Set the background color to white
            ),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 16.0), //padding left
                border: InputBorder.none, // Remove the border
                hintText: 'Password',
                hintStyle: TextStyle(
                    // Adjust font style for the label
                    fontSize: 16.0, // Set the font size
                    fontFamily: 'Poppins',
                    color: Color.fromRGBO(170, 170, 170, 1)),
              ),
            ),
          ),

          const SizedBox(height: 50.0), // Spacer

          SizedBox(
            width: buttonWidth,
            height: 59,
            child: ElevatedButton(
              onPressed: () {
                // Handle login button press here
              },
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20.0), // Button border radius
                  ),
                  backgroundColor: Color.fromRGBO(255, 212, 41, 1.0)),
              child: const Text(
                'Log in',
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const LoginPage());
}
