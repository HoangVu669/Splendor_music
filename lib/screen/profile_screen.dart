import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splendor_player/controller/userProvider.dart';
import 'package:splendor_player/screen/Login_Screen.dart';
import 'package:splendor_player/screen/setting_screen.dart';
import 'package:splendor_player/screen/upload_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
          BtnSetting: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScreen()));
          },
          BtnUpload: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => UploadScreen()));
          },
          Btnsearch: () {

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
              if (userProvider.username != null) ...[
                Text(
                  userProvider.username!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ] else ...[
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LogInScreen()));
                  },
                  child: Container(
                    width: width * 0.4,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.4),
                    ),
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
    required this.BtnSetting,
    required this.BtnUpload,
    required this.Btnsearch,
  }) : super(key: key);

  final VoidCallback BtnSetting;
  final VoidCallback BtnUpload;
  final VoidCallback Btnsearch;

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
          onPressed: BtnSetting,
          icon: Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: BtnUpload,
          icon: Icon(
            Icons.upload,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: Btnsearch,
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
