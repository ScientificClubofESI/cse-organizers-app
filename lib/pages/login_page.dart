import 'package:cse_organizers_app/Services/auth_manager.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F7FE),
      body: Center(
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidthPercentage = 75.0;
    double textfieldWidthPercentage = 80.0;
    final emailController = TextEditingController();
    final passwordControler = TextEditingController();
    String erreur = " ";
    String msg = " ";

    double buttonWidth =
        (screenWidth * buttonWidthPercentage / 100).clamp(0, screenWidth);
    double textFieldWidth =
        (screenWidth * textfieldWidthPercentage / 100).clamp(0, screenWidth);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Logo part
            Image.asset(
              'assets/images/logo.png',
              width: 200,
            ),

            const SizedBox(height: 20.0), // Spacer

            const Text(
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
                controller: emailController,
                decoration: const InputDecoration(
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
                controller: passwordControler,
                obscureText: true,
                decoration: const InputDecoration(
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

            Column(
              //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: buttonWidth,
                  height: 59,
                  child: ElevatedButton(
                    onPressed: () async {
                      // Handle login button press here
                      if (emailController.text.isNotEmpty &&
                          passwordControler.text.isNotEmpty) {
                        await signIn(emailController.text.trim(),
                            passwordControler.text.trim(), context);
                      } else {
                        print("msg derreur");
                        setState(() {
                          erreur = "Error :";
                          msg = " try again ";
                        });
                      }
                      // msg d'erreur
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20.0), // Button border radius
                        ),
                        backgroundColor:
                            const Color.fromRGBO(255, 212, 41, 1.0)),
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
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        erreur,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 16),
                      ),
                      Text(
                        msg,
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const LoginPage());
}
