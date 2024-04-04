import 'package:flutter/material.dart';
import 'package:poultryguard/widgets/customsilverbar.dart';

import '../widgets/custombottomnavigationbar.dart';
import '../widgets/customcurrentlocation.dart';
import '../widgets/customdescriptionbox.dart';
import '../widgets/customdrawer.dart';
import '../widgets/customtabbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      bottomNavigationBar: NavigationBar(
        destinations:   [
          CustomBottomNavigationBarItem(
            icon: Icon(Icons.store_rounded, color: Theme.of(context).colorScheme.primary,),
            label: "Store",
            isSelected: true, // Set to true for the initial selected item
          ),
          CustomBottomNavigationBarItem(
            icon: Icon(Icons.man_rounded,color: Theme.of(context).colorScheme.primary,),
            label: "Gemini Vet",
            isSelected: false, // Set to false for non-selected items

          ),
          CustomBottomNavigationBarItem(
            icon: Icon(Icons.assignment, color: Theme.of(context).colorScheme.primary,),
            label: "Daily Routine",
            isSelected: false, // Set to false for non-selected items

          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled)=>[
          CustomSilverBar(
            title: CustomTabBar(tabController: _tabController),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const CustomCurrentLocation(),
                const CustomDescriptionBox()
              ],
            ),
          )
        ],
      body: Container(
        color: Colors.blue,
      ),
      ),
    );
  }
}
