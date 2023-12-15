import 'package:cse_organizers_app/Services/auth_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
    double screenheight = MediaQuery.of(context).size.height;
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
            ///Logo
            SizedBox(height: screenheight*0.05),
            SvgPicture.asset('assets/images/CSE_Logo_Plexus_Dark.svg',width: screenheight*0.27,height: screenheight*0.27),
             SizedBox(height: screenheight*0.086), // Spacer

            ///Log in to cont
            const Text(
              'Log in to continue',
              style: TextStyle(
                fontFamily: 'CSEOrganizersApp',
                fontSize: 18.0, // Adjust the font size as needed
                color: Color.fromRGBO(38, 38, 38, 1),
                fontWeight: FontWeight.w700// Set the text color
              ),
            ),
            SizedBox(height: screenheight*0.069), // Spacer

            ///Email field
            Container(
              width: screenWidth*0.81,
              height: screenheight*0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0), // the border radius
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
                    fontFamily: 'CSEOrganizersApp',
                    color: Color.fromRGBO(170, 170, 170, 1),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenheight*0.02), // Spacer

            ///Password field
            Container(
              width: screenWidth*0.81,
              height: screenheight*0.06,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(16.0), // Set the border radius
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
                      fontFamily: 'CSEOrganizersApp',
                      color: Color.fromRGBO(170, 170, 170, 1)),
                ),
              ),
            ),
            SizedBox(height: screenheight*0.086), // Spacer

            ///Log in button & Error text
            Column(
              children: [
                SizedBox(
                  width: screenWidth*0.724,
                  height: screenheight*0.064,
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
                          borderRadius: BorderRadius.circular(16.0), // Button border radius
                        ),
                        backgroundColor: const Color(0xFFFFD429)),
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'CSEOrganizersApp',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ///error text
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        erreur,
                        style: const TextStyle(
                            fontFamily: 'CSEOrganizersApp',
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 16),
                      ),
                      Text(
                        msg,
                        style: const TextStyle(color: Colors.red, fontSize: 16,fontFamily: 'CSEOrganizersApp',),
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
