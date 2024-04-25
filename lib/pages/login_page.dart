import 'package:flutter/material.dart';
import 'package:poultryguard/widgets/custom_text_field.dart';
import '../services/auth/auth_service.dart';
import '../widgets/custom_button.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void login() async{
    final _authService = AuthService();
      try{
        await _authService.signInWithEmailPassword(emailController.text, passwordController.text);
      }
      catch(e){
        showDialog(context: context, builder: (context) => const AlertDialog(
          title: Text("invalid email or password",
            style: TextStyle(
              fontFamily: "JosefinSans",
            ),),
        ));
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage("assets/images/logo/app_logo.png")),
              const SizedBox(height: 25),
              Text(
                "Welcome to Poultry Guard",
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
              CustomButton(
                text: "Let's Get Started",
                onTap: login,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Are you new?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontFamily: "JosefinSans",
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Own an account here",
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
