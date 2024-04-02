import 'package:flutter/material.dart';
import 'package:poultryguard/widgets/customtextfield.dart';
import '../widgets/custombutton.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                "Welcome to Poultry Guard",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontFamily: "JosefinSans",
                  fontSize: 23,
                ),
              ),
              Text(
                "Maximize Yields, Happy Flocks, Joyful Farmers",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontFamily: "JosefinSans",
                  fontSize: 13,
                  fontStyle: FontStyle.italic
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
              CustomButton(
                text: "Let's Get Started",
                onTap: () {},
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Are you new?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontFamily: "JosefinSans",
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Own an account",
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
                    color: Theme.of(context).colorScheme.inversePrimary,
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