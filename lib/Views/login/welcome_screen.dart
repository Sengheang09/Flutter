import 'package:final_project/Views/bottom_navigation.dart';
import 'package:final_project/Views/login/login_page.dart';
import 'package:final_project/Views/login/singUp_page.dart';
import 'package:final_project/const/themes/app_themes.dart';
import 'package:final_project/services/authservice.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.primary_dark,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/icons/CN.png"),
              SizedBox(height: 10),
              Text(
                "CINEMAX",
                style: TextStyle(
                  color: AppThemeData.text_color_white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Text(
                "Enter your registered",
                style: TextStyle(
                  color: AppThemeData.text_color_darkgrey,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              Text(
                "Phone Number to Sign Up",
                style: TextStyle(
                  color: AppThemeData.text_color_darkgrey,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 60),
              SizedBox(
                width: 380,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SingUpPage(),
                      ),
                    );
                  },
                  // ignore: sort_child_properties_last
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: AppThemeData.text_color_white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      AppThemeData.primary_blue,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "I already have an account?",
                    style: TextStyle(
                      color: AppThemeData.text_color_grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => LoginPage(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SingUpPage(),
                                    ),
                                  );
                                },
                              ),
                        ),
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: AppThemeData.primary_blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                      indent: 30,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text("Or Sign Up With", style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 5),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                      endIndent: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Image.asset("assets/icons/Facebook.png", height: 50),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                      backgroundColor: MaterialStateProperty.all(
                        AppThemeData.text_color_blue,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () async {
                      final userCredential =
                          await Authservice().signInWithGoogle();
                      if (userCredential != null) {
                        // navigate to home page
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BottomNavScreen(),
                          ),
                        );
                      } else {
                        // user canceled or error
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Google Sign-In canceled or failed"),
                          ),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        AppThemeData.text_color_white,
                      ),
                      padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                    ),
                    child: Image.asset("assets/icons/Google.png", height: 50),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
