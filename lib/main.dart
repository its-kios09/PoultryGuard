import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:poultryguard/firebase_options.dart';
import 'package:poultryguard/models/poultryshopmodel.dart';
import 'package:poultryguard/services/auth/auth_gate.dart';
import 'package:poultryguard/services/auth/login_or_register.dart';
import 'package:poultryguard/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: ".env");
  final apiKey = dotenv.env["GEMINI_KEY_API"]!;
  Gemini.init(apiKey: apiKey);
  Stripe.publishableKey = dotenv.env["STRIPE_PUBLISH_KEY"]!;
  runApp(
   MultiProvider(
       providers: [
         ChangeNotifierProvider(create: (context) => ThemeProvider()),
         ChangeNotifierProvider(create: (context) => Shop()),
       ],
     child: const MyApp(),
   ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) => {
      FlutterNativeSplash.remove()
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
