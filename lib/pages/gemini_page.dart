import 'package:flutter/material.dart';

class GeminiPage extends StatefulWidget {
  const GeminiPage({super.key});

  @override
  State<GeminiPage> createState() => _GeminiPageState();
}

class _GeminiPageState extends State<GeminiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Gemini Page",
          style: TextStyle(fontFamily: "JosefinSans"),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
    );
  }
}
