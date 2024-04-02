import 'package:flutter/material.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  final Widget icon;
  final String label;
  final bool isSelected;

  const CustomBottomNavigationBarItem({super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).colorScheme.background : null,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Text(label, style: const TextStyle(
              fontFamily: "JosefinSans",
            ),),
          ],
        ),
      ),
    );
  }
}
