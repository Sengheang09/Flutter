import 'package:final_project/Views/bottom_navigation.dart';
import 'package:final_project/Views/login/welcome_screen.dart';
import 'package:final_project/const/themes/app_themes.dart';
import 'package:final_project/services/authservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  bool hidePassemail = false;
  bool hidePasspassword = true;
  bool hidePassconfirmpas = true;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  Future SignUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    try {
      if (_passwordController.text.trim() ==
          _confirmpasswordController.text.trim()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavScreen()),
        );
      } else {
        Navigator.pop(context);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Password do not match")));
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message ?? "An error occurred")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.primary_dark,
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
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
                        "Sign Up",
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
                "Let's get started",
                style: TextStyle(
                  color: AppThemeData.text_color_white,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "The latest movies and series",
                style: TextStyle(color: AppThemeData.text_color_white_grey),
              ),
              Text(
                "are here",
                style: TextStyle(color: AppThemeData.text_color_white_grey),
              ),
              SizedBox(height: 50),
              SizedBox(
                width: 380,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    prefixIconColor: MaterialStateColor.resolveWith(
                      (states) =>
                          states.contains(MaterialState.focused)
                              ? AppThemeData.primary_blue
                              : AppThemeData.text_color_white,
                    ),
                    labelText: "Name",
                    labelStyle: TextStyle(color: AppThemeData.text_color_white),
                    hintText: "Enter Name Here",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: AppThemeData.text_color_white,
                      ),
                    ),
                    floatingLabelStyle: TextStyle(
                      color: AppThemeData.primary_blue,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: AppThemeData.primary_blue),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
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
              SizedBox(height: 20),
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
                    hintText: 'Enter new Password',
                    // hintStyle: TextStyle(color: Colors.white70),),
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
                      color:
                          hidePasspassword
                              ? Colors.white
                              : AppThemeData.primary_blue,
                      onPressed:
                          () => setState(
                            () => hidePasspassword = !hidePasspassword,
                          ),
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
              SizedBox(height: 20),
              SizedBox(
                width: 380,
                child: TextField(
                  controller: _confirmpasswordController,
                  obscureText: hidePassconfirmpas,
                  style: const TextStyle(color: AppThemeData.text_color_white),
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle: TextStyle(color: AppThemeData.text_color_white),
                    floatingLabelStyle: TextStyle(
                      color: AppThemeData.primary_blue,
                    ),
                    hintText: 'Enter confirm Password',
                    // hintStyle: TextStyle(color: Colors.white70),),
                    prefixIcon: const Icon(Icons.password),
                    prefixIconColor: MaterialStateColor.resolveWith(
                      (states) =>
                          states.contains(MaterialState.focused)
                              ? AppThemeData.primary_blue
                              : Colors.white,
                    ),

                    suffixIcon: IconButton(
                      icon: Icon(
                        hidePassconfirmpas
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      color:
                          hidePassconfirmpas
                              ? Colors.white
                              : AppThemeData.primary_blue,
                      onPressed:
                          () => setState(
                            () => hidePassconfirmpas = !hidePassconfirmpas,
                          ),
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
                onTap: SignUp,
                child: Container(
                  width: 380,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppThemeData.primary_blue,
                  ),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
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
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Image.asset("assets/icons/Facebook.png", height: 50),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        AppThemeData.text_color_blue,
                      ),
                      padding: MaterialStateProperty.all(EdgeInsets.all(12)),
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
