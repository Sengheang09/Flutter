import 'package:final_project/const/themes/app_themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChangeAccount extends StatefulWidget {
  ChangeAccount({super.key});

  @override
  State<ChangeAccount> createState() => _ChangeAccountState();
}

class _ChangeAccountState extends State<ChangeAccount> {
  bool hidePassword = true;
  final user = FirebaseAuth.instance.currentUser!;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future Change() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      Navigator.pop(context,true);
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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset("assets/icons/back.png"),
                      ),
                    ),
                    SizedBox(width: 100),
                    Text(
                      "Change Account",
                      style: TextStyle(
                        color: AppThemeData.text_color_white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipOval(
                      child: Image.network(
                        "https://i.pinimg.com/736x/f0/b6/ea/f0b6ea6cdb83304ab03251a620116c44.jpg",
                        cacheHeight: 90,
                        cacheWidth: 90,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 35,
                        width: 35,
                        // ignore: sort_child_properties_last
                        child: Image.asset(
                          "assets/icons/edit.png",
                          color: AppThemeData.primary_blue,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppThemeData.primary_soft,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "Heang",
                  style: TextStyle(
                    color: AppThemeData.text_color_white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text("${user.email}"),
                SizedBox(height: 150),
                SizedBox(
                  width: 380,
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      prefixStyle: TextStyle(
                        color: AppThemeData.text_color_white,
                      ),
                      prefixIconColor: MaterialStateColor.resolveWith(
                        (states) =>
                            states.contains(MaterialState.focused)
                                ? AppThemeData.primary_blue
                                : AppThemeData.text_color_white,
                      ),
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: AppThemeData.text_color_white,
                      ),
                      floatingLabelStyle: TextStyle(
                        color: AppThemeData.primary_blue,
                      ),
                      hintText: "Enter your Email Here",
                      hintStyle: TextStyle(
                        color: AppThemeData.text_color_grey,
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
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
                    obscureText: hidePassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: AppThemeData.text_color_white,
                      ),
                      floatingLabelStyle: TextStyle(
                        color: AppThemeData.primary_blue,
                      ),
                      hintText: "Enter Password Here",
                      prefixIcon: Icon(Icons.password),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: AppThemeData.text_color_white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: AppThemeData.primary_blue,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed:
                            () => setState(() => hidePassword = !hidePassword),
                        color:
                            hidePassword
                                ? Colors.white
                                : AppThemeData.primary_blue,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 80),
                GestureDetector(
                  onTap: Change,
                  child: Container(
                    width: 280,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppThemeData.primary_blue,
                    ),
                    child: Center(
                      child: Text(
                        "Save Change",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppThemeData.text_color_white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
