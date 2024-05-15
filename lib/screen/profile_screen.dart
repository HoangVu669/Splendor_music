import 'package:flutter/material.dart';
import 'package:splendor_player/screen/Login_Screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          onIcon1Pressed: () {
            // Xử lý khi icon 1 được bấm
          },
          onIcon2Pressed: () {
            // Xử lý khi icon 2 được bấm
          },
          onIcon3Pressed: () {
            // Xử lý khi icon 3 được bấm
          },
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage:
                    AssetImage("assets/image/user-default.3ff115bb.png"),
                radius: 50,
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen(),));
                },
                child: Container(
                  width: Width * 0.4,
                  height: Heigh * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.4)),
                  child: Center(
                    child: Text(
                      "ĐĂNG NHẬP",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.onIcon1Pressed,
    required this.onIcon2Pressed,
    required this.onIcon3Pressed,
  }) : super(key: key);

  final VoidCallback onIcon1Pressed;
  final VoidCallback onIcon2Pressed;
  final VoidCallback onIcon3Pressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 120,
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Profile",
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: onIcon1Pressed,
          icon: Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: onIcon2Pressed,
          icon: Icon(
            Icons.notifications,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: onIcon3Pressed,
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
