import 'package:flutter/material.dart';
import 'package:splendor_player/controller/auth.dart';
import 'package:splendor_player/screen/Login_Screen.dart';
import 'package:splendor_player/widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  // TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Sign Up",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: width,
        height: height,
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                CustomTextField("Enter UserName", Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                // CustomTextField("Enter Email Id", Icons.person_outline, false,
                //     _emailTextController),
                // const SizedBox(
                //   height: 20,
                // ),
                CustomTextField("Enter Password", Icons.lock_outlined, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                LoginSignUpButton(context, "Sign Up", () async {
                  // Thực hiện đăng ký
                  var result = await register(
                    _userNameTextController.text,
                    // _emailTextController.text,
                    _passwordTextController.text,
                  );
                  // Kiểm tra kết quả đăng ký
                  if (result == true) {
                    // Đăng ký thành công, chuyển hướng đến LogInScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogInScreen()),
                    );
                  } else {
                    // Đăng ký thất bại, xử lý thông báo hoặc hành động khác
                    // Ví dụ: Hiển thị thông báo lỗi
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Registration failed! Please try again.'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
