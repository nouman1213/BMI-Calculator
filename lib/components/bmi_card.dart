import 'package:flutter/material.dart';

class BmiCard extends StatelessWidget {
  const BmiCard({super.key, required this.color, this.child, this.onPress});

  final Color color;
  final Widget? child;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: child,
      ),
    );
  }
}
