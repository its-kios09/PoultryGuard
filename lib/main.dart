import 'package:flutter/material.dart';
import 'package:poultryguard/pages/login_page.dart';
import 'package:poultryguard/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(
        onTap: (){},
      ),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
