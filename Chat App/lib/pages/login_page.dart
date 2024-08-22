import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/components/button.dart';
import 'package:chat_app/components/textformfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  // email and password text controllers
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController pwcontroller = TextEditingController();

  // tap to go register page
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  // login method
  void login(BuildContext context) async {
    // auth service
    final authService = AuthService();

    // try login
    try {
      await authService.signInWithEmailPassword(
          emailcontroller.text, pwcontroller.text);
    }

    // catch any errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            // Welcome  back message
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                "Welcome back, you've been missed!",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary, fontSize: 16),
              ),
            ),

            // email textfield
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: CommonTextformfield(
                hintText: "Email",
                obscureText: false,
                controller: emailcontroller,
              ),
            ),

            // pw textfiled
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CommonTextformfield(
                hintText: "Password",
                obscureText: true,
                controller: pwcontroller,
              ),
            ),

            // login button
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: CommonButton(
                text: 'Login',
                onTap: () => login(context),
              ),
            ),

            // register now
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member? ",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Register now",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
