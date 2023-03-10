import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String label;
  final Color bgColor;
  const ActionButton({super.key, required this.label, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        left: 55,
        bottom: 8,
        right: 55,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: bgColor,
        ),
      ),
    );
  }
}
