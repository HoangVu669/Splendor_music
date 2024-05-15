import 'package:flutter/material.dart';
import 'package:splendor_player/screen/Main_Screen.dart';
import 'package:splendor_player/screen/SignUp_Screen.dart';
import 'package:splendor_player/widgets/widgets.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double Heigh = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple.shade800.withOpacity(1.0),
            Colors.deepPurple.shade200.withOpacity(0.8)
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/image/logo.png",
                  fit: BoxFit.fitWidth,
                  width: 240,
                  height: 240,
                ),
                const SizedBox(
                  height: 0,
                ),
                CustomTextField("Enter UserName", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField("Enter Password", Icons.person_outline, false,
                    _passwordTextController),
                const SizedBox(
                  height: 10,
                ),
                LoginSignUpButton(context, "Log In", () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainScreen()));
                }),
                const SizedBox(),
                forgetPassword(context),
                const SizedBox(),
                signUpOption(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Row signUpOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Don't have account?",
          style: TextStyle(color: Colors.white70)),
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
        },
        child: const Text(
          " Sign Up",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}

Widget forgetPassword(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 35,
    alignment: Alignment.bottomRight,
    child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () {}),
  );
}
