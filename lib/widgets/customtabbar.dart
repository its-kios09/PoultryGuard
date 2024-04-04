import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;

  const CustomTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        tabs: const [
          Tab(
            icon: Icon(Icons.vaccines_rounded),
          ),
          Tab(
            icon: Icon(Icons.food_bank),
          ),
          Tab(
            icon: Icon(Icons.engineering_rounded),
          )
        ],
      ),
    );
  }
}
