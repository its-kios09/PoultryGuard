import 'package:flutter/material.dart';

class RoutinePage extends StatefulWidget {
  const RoutinePage({super.key});

  @override
  State<RoutinePage> createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
        title: const Text("Routine Page", style: TextStyle(fontFamily: "JosefinSans"),
    ),
    backgroundColor: Theme.of(context).colorScheme.background,

    ),);
  }
}
