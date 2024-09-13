import 'package:flutter/material.dart';

class CustomDismissibleBackground extends StatelessWidget {
  const CustomDismissibleBackground({
    super.key,
    required this.icon,
    required this.alignment, required this.color,
  });
  final IconData icon;
  final AlignmentGeometry alignment;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        alignment: alignment,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
