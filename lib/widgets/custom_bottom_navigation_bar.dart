import 'package:flutter/material.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  final Widget icon;
  final String label;
  final bool isSelected;
  final Function()? onTap;

  const CustomBottomNavigationBarItem({super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
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
              Text(label, style:  TextStyle(
                fontFamily: "JosefinSans",
                color: Theme.of(context).colorScheme.primary,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
