import 'package:final_project/Views/login/main_page.dart';
import 'package:final_project/Views/login/welcome_screen.dart';
import 'package:final_project/const/themes/app_themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required void Function() onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassemail = false;
  bool hidePasspassword = true;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Future logIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const MainPage()),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'user-not-found') {
        message = "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        message = "Wrong password provided.";
      } else {
        message = "Something went wrong: ${e.message}";
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.primary_dark,
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Row(
                children: [
                  InkWell(
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WelcomeScreen(),
                          ),
                        ),
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppThemeData.primary_soft,
                      ),
                      child: Image.asset("assets/icons/back.png"),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 120),
                    child: Text(
                      "Sigin",
                      style: TextStyle(
                        color: AppThemeData.text_color_white,
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),
            Text(
              "Hi, Tiffany",
              style: TextStyle(
                color: AppThemeData.text_color_white,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Welcome back Please enter",
              style: TextStyle(color: AppThemeData.text_color_white_grey),
            ),
            Text(
              "your details.",
              style: TextStyle(color: AppThemeData.text_color_white_grey),
            ),
            SizedBox(height: 70),
            SizedBox(
              width: 380,
              child: TextField(
                controller: _emailController,
                style: TextStyle(color: AppThemeData.text_color_white),
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: AppThemeData.text_color_white),
                  hintText: 'Enter your email',
                  floatingLabelStyle: TextStyle(
                    color: AppThemeData.primary_blue,
                  ),
                  prefixIcon: Icon(Icons.email),
                  prefixIconColor: MaterialStateColor.resolveWith(
                    (states) =>
                        states.contains(MaterialState.focused)
                            ? AppThemeData.primary_blue
                            : AppThemeData.text_color_white,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(
                      color: AppThemeData.text_color_white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: AppThemeData.primary_blue,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 380,
              child: TextField(
                controller: _passwordController,
                obscureText: hidePasspassword,
                style: const TextStyle(color: AppThemeData.text_color_white),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: AppThemeData.text_color_white),
                  floatingLabelStyle: TextStyle(
                    color: AppThemeData.primary_blue,
                  ),
                  hintText: 'Enter Password',
                  prefixIcon: const Icon(Icons.password),
                  prefixIconColor: MaterialStateColor.resolveWith(
                    (states) =>
                        states.contains(MaterialState.focused)
                            ? AppThemeData.primary_blue
                            : Colors.white,
                  ),

                  suffixIcon: IconButton(
                    icon: Icon(
                      hidePasspassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed:
                        () => setState(
                          () => hidePasspassword = !hidePasspassword,
                        ),
                    color:
                        hidePasspassword
                            ? Colors.white
                            : AppThemeData.primary_blue,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: AppThemeData.primary_blue,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            GestureDetector(
              onTap: logIn,
              child: Container(
                width: 380,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppThemeData.primary_blue,
                ),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
