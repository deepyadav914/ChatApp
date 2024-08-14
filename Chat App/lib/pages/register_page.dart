import 'package:flutter/material.dart';
import '../components/button.dart';
import '../components/textformfield.dart';

class RegisterPage extends StatelessWidget {
  // email and password text controllers
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController pwcontroller = TextEditingController();
  final TextEditingController confirmpwcontroller = TextEditingController();

  //tap to go to register page
  final void Function()? onTap;


  RegisterPage({super.key,required this.onTap});

  // register method
  void register() {}

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
                "Let's create an account for you",
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

            // confirm pw textfiled
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CommonTextformfield(
                hintText: "Confirm password",
                obscureText: true,
                controller: confirmpwcontroller,
              ),
            ),

            // login button
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: CommonButton(
                text: 'Register',
                onTap: register,
              ),
            ),

            // register now
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Login now",
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
