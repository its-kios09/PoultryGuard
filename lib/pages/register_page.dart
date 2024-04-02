import 'package:flutter/material.dart';

import '../widgets/custombutton.dart';
import '../widgets/customtextfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                  image: AssetImage("assets/images/logo/app_logo.png")
              ),
              const SizedBox(height: 25),
              Text(
                "Let's make you an account",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontFamily: "JosefinSans",
                  fontSize: 23,
                  fontWeight: FontWeight.bold,

                ),
              ),
              Text(
                "Guarding Feathers, Saving Futures",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontFamily: "JosefinSans",
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,

                ),
              ),
              const SizedBox(height: 25),
              CustomTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: passwordController,
                hintText: "Confirm Password",
                obscureText: true,
              ),
              const SizedBox(height: 10),
              CustomButton(
                text: "Create an account",
                onTap: () {},
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already you have an account?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontFamily: "JosefinSans",
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Login here",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontFamily: "JosefinSans",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Powered by Gemini AI",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontFamily: "JosefinSans",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}