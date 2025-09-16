import 'package:final_project/Views/profile/change_account.dart';
import 'package:final_project/Views/login/welcome_screen.dart';
import 'package:final_project/const/themes/app_themes.dart';
import 'package:final_project/services/authservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.primary_dark,

      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Profile",
                  style: TextStyle(
                    color: AppThemeData.text_color_white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),

                Container(
                  width: 380,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 1,
                      color: AppThemeData.text_color_darkgrey,
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 9,
                        ),
                        child: ClipOval(
                          child: Image.network(
                            "https://i.pinimg.com/736x/f0/b6/ea/f0b6ea6cdb83304ab03251a620116c44.jpg",
                            fit: BoxFit.cover,
                            width: 60,
                            height: 60,
                          ),
                        ),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 14),
                            child: Text(
                              "Heang",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: AppThemeData.text_color_white,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text("${FirebaseAuth.instance.currentUser?.email}"),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Image.asset("assets/icons/Combined-Shape.png"),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                Container(
                  width: 380,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/background.png",
                      ), // your bg image
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Left icon circle
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/icons/star.png",
                              width: 28,
                              height: 28,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),

                        // Text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Premium Member",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "New movies are coming for you,\nDownload Now!",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 10),
                Container(
                  width: 380,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 1,
                      color: AppThemeData.text_color_grey,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Account",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppThemeData.text_color_white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: AppThemeData.primary_soft,
                                ),
                                child: Image.asset(
                                  "assets/icons/profile_with_color.png",
                                ),
                              ),
                              SizedBox(width: 20),
                              Text(
                                "Member",
                                style: TextStyle(
                                  color: AppThemeData.text_color_white,
                                  fontSize: 16,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 35,
                                height: 35,
                                child: Image.asset("assets/icons/Group.png"),
                              ),
                            ],
                          ),
                          Divider(
                            color: AppThemeData.text_color_grey,
                            endIndent: 10,
                            indent: 10,
                          ),
                          InkWell(
                            onTap: () async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChangeAccount(),
                                ),
                              );
                              if (result == true) {
                                await FirebaseAuth.instance.currentUser
                                    ?.reload();
                                setState(() {});
                              }
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: AppThemeData.primary_soft,
                                  ),
                                  child: Image.asset(
                                    "assets/icons/padlock.png",
                                  ),
                                ),
                                SizedBox(width: 20),
                                Text(
                                  "Change Password",
                                  style: TextStyle(
                                    color: AppThemeData.text_color_white,
                                    fontSize: 16,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  width: 35,
                                  height: 35,
                                  child: Image.asset("assets/icons/Group.png"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 380,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 1,
                      color: AppThemeData.text_color_grey,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "General",
                          style: TextStyle(
                            color: AppThemeData.text_color_white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: AppThemeData.primary_soft,
                              ),
                              child: Image.asset(
                                "assets/icons/notification.png",
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "Notification",
                              style: TextStyle(
                                color: AppThemeData.text_color_white,
                                fontSize: 16,
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 35,
                              height: 35,
                              child: Image.asset("assets/icons/Group.png"),
                            ),
                          ],
                        ),
                        Divider(
                          color: AppThemeData.text_color_grey,
                          indent: 10,
                          endIndent: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: AppThemeData.primary_soft,
                              ),
                              child: Image.asset("assets/icons/language.png"),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "Language",
                              style: TextStyle(
                                color: AppThemeData.text_color_white,
                                fontSize: 16,
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 35,
                              height: 35,
                              child: Image.asset("assets/icons/Group.png"),
                            ),
                          ],
                        ),
                        Divider(
                          color: AppThemeData.text_color_grey,
                          indent: 10,
                          endIndent: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: AppThemeData.primary_soft,
                              ),
                              child: Image.asset("assets/icons/country.png"),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "Country",
                              style: TextStyle(
                                color: AppThemeData.text_color_white,
                                fontSize: 16,
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 35,
                              height: 35,
                              child: Image.asset("assets/icons/Group.png"),
                            ),
                          ],
                        ),
                        Divider(
                          color: AppThemeData.text_color_grey,
                          indent: 10,
                          endIndent: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: AppThemeData.primary_soft,
                              ),
                              child: Image.asset("assets/icons/trash.png"),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "Clear Cache",
                              style: TextStyle(
                                color: AppThemeData.text_color_white,
                                fontSize: 16,
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 35,
                              height: 35,
                              child: Image.asset("assets/icons/Group.png"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 380,
                  height: 240,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 1,
                      color: AppThemeData.text_color_grey,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "More",
                          style: TextStyle(
                            color: AppThemeData.text_color_white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: AppThemeData.primary_soft,
                              ),
                              child: Image.asset("assets/icons/legal.png"),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "Legal and Policies",
                              style: TextStyle(
                                color: AppThemeData.text_color_white,
                                fontSize: 16,
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 35,
                              height: 35,
                              child: Image.asset("assets/icons/Group.png"),
                            ),
                          ],
                        ),
                        Divider(
                          color: AppThemeData.text_color_grey,
                          indent: 10,
                          endIndent: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: AppThemeData.primary_soft,
                              ),
                              child: Image.asset("assets/icons/feedback.png"),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "Help & FeedBack",
                              style: TextStyle(
                                color: AppThemeData.text_color_white,
                                fontSize: 16,
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 35,
                              height: 35,
                              child: Image.asset("assets/icons/Group.png"),
                            ),
                          ],
                        ),
                        Divider(
                          color: AppThemeData.text_color_grey,
                          indent: 10,
                          endIndent: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: AppThemeData.primary_soft,
                              ),
                              child: Image.asset("assets/icons/about_us.png"),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "About Us",
                              style: TextStyle(
                                color: AppThemeData.text_color_white,
                                fontSize: 16,
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 35,
                              height: 35,
                              child: Image.asset("assets/icons/Group.png"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // log out with show dailog
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false, // tap Cancel
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: AppThemeData.primary_dark,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: AppThemeData.primary_blue
                                        .withOpacity(0.2),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    "assets/images/Question.png",
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "Are you sure?",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Do you want to log out from your account?",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppThemeData.primary_blue,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 30,
                                          vertical: 12,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppThemeData.primary_dark,
                                        side: BorderSide(
                                          color: AppThemeData.primary_blue,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 30,
                                          vertical: 12,
                                        ),
                                      ),
                                      onPressed: () async {
                                        Navigator.pop(context); // close dialog
                                        await Authservice().signOut();
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) =>
                                                    const WelcomeScreen(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Log Out",
                                        style: TextStyle(
                                          color: AppThemeData.primary_blue,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 60,
                    width: 340,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppThemeData.primary_dark,
                      border: Border.all(
                        strokeAlign: 1,
                        color: AppThemeData.primary_blue,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Log Out",
                        style: TextStyle(
                          color: AppThemeData.primary_blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
