import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../widgets/custombottomnavigationbar.dart';
import '../widgets/customdrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Poultry Guard"),),
      drawer: const CustomDrawer(),
      bottomNavigationBar: NavigationBar(
        destinations:  const [
          CustomBottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
            isSelected: true, // Set to true for the initial selected item
          ),
          CustomBottomNavigationBarItem(
            icon: Icon(Icons.medical_information_rounded),
            label: "Consult",
            isSelected: false, // Set to false for non-selected items

          ),
          CustomBottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded),
            label: "Daily Routine",
            isSelected: false, // Set to false for non-selected items

          ),
        ],
      ),
    );
  }
}
