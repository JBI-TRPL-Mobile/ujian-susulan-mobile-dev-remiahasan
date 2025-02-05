import 'package:flutter/material.dart';

class CustomNavItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;

  const CustomNavItem({
    Key? key,
    required this.icon,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white.withOpacity(0.3) : Colors.transparent,
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
