import 'package:final_project/Views/Introduction_screen/onboarding_screen.dart';
import 'package:final_project/Views/bottom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BottomNavScreen();
          } else {
            return const OnboardingScreen();
          }
        },
      ),
    );
  }
}
