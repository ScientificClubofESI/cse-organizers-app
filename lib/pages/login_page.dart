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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();
  String erreur = 'Try again !';
  bool yban = true;
  bool show = false;

  @override
  void initState() {
    super.initState();
    // Initialize your controllers or other state variables here
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double buttonWidthPercentage = 75.0;
    double textfieldWidthPercentage = 80.0;

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
            // Logo
            SizedBox(height: screenheight * 0.05),
            SvgPicture.asset('assets/images/CSE_Logo_Plexus_Dark.svg',
                width: screenheight * 0.27, height: screenheight * 0.27),
            SizedBox(height: screenheight * 0.086), // Spacer

            // Log in to continue
            const Text(
              'Log in to continue',
              style: TextStyle(
                fontFamily: 'CSEOrganizersApp',
                fontSize: 18.0,
                color: Color.fromRGBO(38, 38, 38, 1),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: screenheight * 0.069), // Spacer

            // Email field
            Container(
              width: screenWidth * 0.81,
              height: screenheight * 0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white,
                border: show
                    ? Border.all(
                        color: Colors
                            .red, // Set the border color to red when show is true
                        width: 1.0, // Set the border width
                      )
                    : Border.all(
                        color: Colors
                            .transparent, // No border color when show is false
                      ),
              ),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 16.0),
                  border: InputBorder.none,
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'CSEOrganizersApp',
                    color: Color.fromRGBO(170, 170, 170, 1),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenheight * 0.02), // Spacer

            // Password field
            Container(
              width: screenWidth * 0.81,
              height: screenheight * 0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white,
                border: show
                    ? Border.all(
                        color: Colors
                            .red, // Set the border color to red when show is true
                        width: 1.0, // Set the border width
                      )
                    : Border.all(
                        color: Colors
                            .transparent, // No border color when show is false
                      ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 7.0),
                child: TextField(
                  controller: passwordControler,
                  obscureText: yban,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          yban = !yban;
                        });
                      },
                      child: Container(
                        child: yban
                            ? const Icon(
                                Icons.visibility_off,
                              )
                            : const Icon(Icons.visibility),
                      ),
                    ),
                    contentPadding: EdgeInsets.only(left: 16.0),
                    border: InputBorder.none,
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'CSEOrganizersApp',
                      color: Color.fromRGBO(170, 170, 170, 1),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenheight * 0.086), // Spacer

            // Log in button & Error text
            Column(
              children: [
                SizedBox(
                  width: screenWidth * 0.724,
                  height: screenheight * 0.064,
                  child: ElevatedButton(
                    onPressed: () async {
                      // Handle login button press here
                      if (emailController.text.isNotEmpty &&
                          passwordControler.text.isNotEmpty) {
                        if (await signIn(emailController.text.trim(),
                            passwordControler.text.trim(), context)) {
                          // Do something if login is successful
                        } else {
                          setState(() {
                            show = true;
                          });
                        }
                      } else {
                        setState(() {
                          show = true;
                        });
                      }
                      // msg d'erreur
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      backgroundColor: const Color(0xFFFFD429),
                    ),
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
                Visibility(
                  visible: show,
                  child: SizedBox(
                    child: Text(
                      erreur,
                      style: const TextStyle(
                        fontFamily: 'CSEOrganizersApp',
                        color: Colors.red,
                        fontSize: 16,
                      ),
                    ),
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
  runApp(const MaterialApp(
    home: LoginPage(),
  ));
}
