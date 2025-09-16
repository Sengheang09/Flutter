import 'package:final_project/Views/login/login_page.dart';
import 'package:final_project/Views/login/singUp_page.dart';
import 'package:flutter/material.dart';

class LogorRegis extends StatefulWidget {
  const LogorRegis({super.key});

  @override
  State<LogorRegis> createState() => _LogorRegisState();
}

class _LogorRegisState extends State<LogorRegis> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages);
    } else {
      return SingUpPage();
    }
  }
}
